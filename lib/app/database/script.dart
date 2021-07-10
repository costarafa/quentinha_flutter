final createTable = '''
  CREATE TABLE quentinha(
    id INTEGER NOT NULL PRIMARY KEY
    ,sabor VARCHAR(200) NOT NULL
    ,preco FLOAT(16) NOT NULL
    ,tamanho CHAR(1) NOT NULL
    ,img_quentinha VARCHAR(300) NOT NULL 
  )
''';

final insert1 = '''
INSERT INTO quentinha (sabor, preco, tamanho, img_quentinha)
VALUES ('Escondidinho de carne','7.50','P','http://www.saboresajinomoto.com.br/uploads/images/recipes/escondidinho-com-carne-seca.jpg')
''';

final insert2 = '''
INSERT INTO quentinha (sabor, preco, tamanho, img_quentinha)
VALUES ('Escondidinho de frango','7.50','M','https://http2.mlstatic.com/escondidinho-de-frango-congelado-D_NQ_NP_540625-MLB25445328797_032017-F.jpg')
''';

final insert3 = '''
INSERT INTO quentinha (sabor, preco, tamanho, img_quentinha)
VALUES ('Strogonoff de carne','7.50','P','https://www.receitasagora.com.br/wp-content/uploads/2020/06/receita-de-strogonof-de-frango-simples.jpg')
''';