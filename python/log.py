import os
import logging
import platform

if platform.platform().startswith('Windows'):
    path = os.path.join(os.getenv('HOMEDRIVE'),
                        os.getenv('HOMEPATH'),
                        'loggin.txt')
else:
    path = os.path.join(os.getenv('HOME'),
                        'loggin.txt')

logging.basicConfig(
    level=logging.DEBUG,
    format="%(asctime)s : %(levelname)s : %(message)s",
    filename=path,
    filemode="w"
)

logging.debug('hello there debug')
logging.info('info for you')
logging.warning('dont enter, danger!')

# import os
# import platform
# import logging
#
# if platform.platform().startswith('Windows'):
#     logging_file = os.path.join(os.getenv('HOMEDRIVE'),
#                                 os.getenv('HOMEPATH'),
#                                 'test.log')
# else:
#     logging_file = os.path.join(os.getenv('HOME'),
#                                 'test.log')
#
# print("Logging to", logging_file)
#
# logging.basicConfig(
#     level=logging.DEBUG,
#     format='%(asctime)s : %(levelname)s : %(message)s',
#     filename=logging_file,
#     filemode='w',
# )
#
# logging.debug("Start of the program")
# logging.info("Doing something")
# logging.warning("Dying now")
