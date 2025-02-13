App = {
  web3Provider: null,
  contracts: {},
  account: 0x0,
  loading: false,

  init: function () {
    return App.initWeb3();
  },

  initWeb3: function () {
    // Initialize web3 and set the provider to the testRPC.
    if (typeof web3 !== 'undefined') {
      App.web3Provider = web3.currentProvider;
      web3 = new Web3(web3.currentProvider);
    } else {
      // set the provider you want from Web3.providers
      App.web3Provider = new Web3.providers.HttpProvider('http://localhost:8545');
      web3 = new Web3(App.web3Provider);
    }
    App.displayAccountInfo();
    return App.initContract();
  },

  displayAccountInfo: function () {
    web3.eth.getCoinbase(function (err, account) {
      if (err === null) {
        App.account = account;
        $("#account").text(account);
        web3.eth.getBalance(account, function (err, balance) {
          if (err === null) {
            $("#accountBalance").text(web3.fromWei(balance, "ether") + " ETH");
          }
        });
      }
    });
  },

  initContract: function () {
    $.getJSON('ChainList.json', function (chainListArtifact) {
      // Get the necessary contract artifact file and use it to instantiate a truffle contract abstraction.
      App.contracts.ChainList = TruffleContract(chainListArtifact);

      // Set the provider for our contract.
      App.contracts.ChainList.setProvider(App.web3Provider);

      // Listen for events
      App.listenToEvents();

      // Retrieve the article from the smart contract
      return App.reloadArticles();
    });
  },

  reloadArticles: function () {
    // refresh account information because the balance may have changed
    App.displayAccountInfo();
    if (App.loading) return;

    App.loading = true;

    App.contracts.ChainList.deployed().then(function (instance) {
      chainListInstance = instance;
      return chainListInstance.getArticlesForSale();
    }).then(function (articlesIds) {
      // Retrieve and clear the article placeholder
      var articlesRow = $('#articlesRow');
      articlesRow.empty();

      articlesIds.forEach((id) => {
        chainListInstance.articles(id).then((article) => {
          App.displayArticle(article);
        })
      });

      App.loading = false;
    }).catch(function (err) {
      console.log(err.message);
      App.loading = false;
    });
  },

  displayArticle: function(article) {
    var articlesRow = $('#articlesRow');
    var price = web3.fromWei(article[5], "ether");

    // Retrieve and fill the article template
    var articleTemplate = $('#articleTemplate');
    articleTemplate.find('.panel-title').text(article[3]);
    articleTemplate.find('.article-description').text(article[4]);
    articleTemplate.find('.article-price').text(price + ' ETH');
    articleTemplate.find('.btn-buy').attr('data-id', article[0]);
    articleTemplate.find('.btn-buy').attr('data-value', price);

    // seller
    var seller = article[1];
    if (seller == App.account) {
      seller = "You";
      articleTemplate.find('.btn-buy').hide();
    }
    articleTemplate.find('.article-seller').text(seller);

    // add this new article
    articlesRow.append(articleTemplate.html());
  },

  sellArticle: function () {
    // retrieve details of the article
    var _article_name = $("#article_name").val();
    var _description = $("#article_description").val();
    var _price = web3.toWei(parseFloat($("#article_price").val() || 0), "ether");

    if ((_article_name.trim() == '') || (_price == 0)) {
      // nothing to sell
      return false;
    }

    App.contracts.ChainList.deployed().then(function (instance) {
      return instance.sellArticle(_article_name, _description, _price, {
        from: App.account,
        gas: 500000
      });
    }).then(function (result) {

    }).catch(function (err) {
      console.error(err);
    });
  },

  // Listen for events raised from the contract
  listenToEvents: function () {
    App.contracts.ChainList.deployed().then(function (instance) {
      instance.sellArticleEvent({}, {
        fromBlock: 0,
        toBlock: 'latest'
      }).watch(function (error, event) {
        if (!error) {
          $("#events").append('<li class="list-group-item">' + event.args._name + ' is for sale' + '</li>');
        } else {
          console.error(error);
        }
        App.reloadArticles();
      });

      instance.buyArticleEvent({}, {
        fromBlock: 0,
        toBlock: 'latest'
      }).watch(function (error, event) {
        if (!error) {
          $("#events").append('<li class="list-group-item">' + event.args._buyer + ' bought ' + event.args._name + '</li>');
        } else {
          console.error(error);
        }
        App.reloadArticles();
      });
    });
  },

  buyArticle: function () {
    event.preventDefault();

    // retrieve the article price
    var _articleId = $(event.target).data('id');
    var _price = parseFloat($(event.target).data('value'));

    App.contracts.ChainList.deployed().then(function (instance) {
      return instance.buyArticle(_articleId, {
        from: App.account,
        value: web3.toWei(_price, "ether"),
        gas: 500000
      });
    }).then(function (result) {

    }).catch(function (err) {
      console.error(err);
    });
  },
};

$(function () {
  $(window).load(function () {
    App.init();
  });
});
