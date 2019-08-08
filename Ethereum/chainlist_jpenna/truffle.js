module.exports = {
  networks: {
    development: {
      host: "localhost",
      port: 8545,
      network_id: "*" // Match any network id
    },
    rinkeby: {
      host: "localhost",
      port: 8545,
      from: "0x57b43cd9bc9089c519e5f025f313d7ed53a357ce", // default address to use for any transaction Truffle makes during migrations
      network_id: 4,
    }
  },
};
