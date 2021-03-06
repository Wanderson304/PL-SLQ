
-- Limitando e ordenando Dados.

   SELECT * FROM TALUNO;

   -- ALTER TABLE TALUNO DROP COLUMN COLUNA
   ALTER TABLE TALUNO ADD ESTADO CHAR(2) DEFAULT 'RS';
   ALTER TABLE TALUNO ADD SALARIO NUMBER(8,2) DEFAULT 620;

   UPDATE TALUNO SET
   ESTADO = 'AC', SALARIO = 250
   WHERE COD_ALUNO = 1;

   UPDATE TALUNO SET
   ESTADO = 'MT', SALARIO = 2000
   WHERE COD_ALUNO = 2;

   UPDATE TALUNO SET
   ESTADO = 'SP', SALARIO = 800
   WHERE COD_ALUNO = 5;

   SELECT * FROM TALUNO;

   COMMIT;

   SELECT * FROM TALUNO
   WHERE ESTADO <> 'RS'
   AND SALARIO <= 800
   ORDER BY SALARIO DESC;

   INSERT INTO TALUNO (COD_ALUNO, NOME, CIDADE)
   VALUES (SEQ_ALUNO.NEXTVAL,'VALDO','DOIS IRMAO');

   INSERT INTO TALUNO (COD_ALUNO, NOME, CIDADE)
   VALUES (SEQ_ALUNO.NEXTVAL, 'ALDO','QUATRO IRMAOS');

   SELECT * FROM TALUNO;

   UPDATE TALUNO SET
   ESTADO = 'SP', SALARIO = 900, NOME = 'PEDRO'
   WHERE COD_ALUNO = 25;

   SELECT ESTADO, SALARIO, NOME FROM TALUNO
   ORDER BY ESTADO, SALARIO DESC;


   -- 31/12/1899 - DATA Zero
   -- 01/01/1900 - DATA 1

   -- Adicionando uma nova coluna a tabela TALUNO
   ALTER TABLE TALUNO ADD NASCIMENTO DATE DEFAULT SYSDATE - 1000;

   -- Usando a fun��o DUAL para trabalhar com data.
   SELECT SYSDATE - SYSDATE - 100 FROM DUAL;

   SELECT * FROM TALUNO;

   -- Alterando dados da tabela TALUNO.
   UPDATE TALUNO SET
   NASCIMENTO = '10/10/2001'
   WHERE COD_ALUNO=1;

   UPDATE TALUNO SET
   NASCIMENTO = '10/08/2000'
   WHERE COD_ALUNO=2;

   -- Filtrando a consulta por data usando a fun��o TRUNC para para zerar a hora.
   SELECT COD_ALUNO, NASCIMENTO, TRUNC(NASCIMENTO), NOME
   FROM TALUNO
   WHERE TRUNC(NASCIMENTO) = '26/11/2016';

   -- FiLtando a consulta com intervalo de datas e em seguida formatando a data para
   SELECT COD_ALUNO, NASCIMENTO, TRUNC(NASCIMENTO), NOME
   FROM TALUNO
   WHERE NASCIMENTO
    BETWEEN To_Date('10/10/2001 15:00','DD/MM/YYYY HH24 :MI')
      AND To_Date('26/11/2016 21:00', 'DD/MM/YYYY HH24 :MI')


  COMMIT;


  SELECT COD_CONTRATO, DATA, TOTAL,
          DESCONTO, DESCONTO + 1000 AS CALCULO
  FROM TCONTRATO
  WHERE TOTAL <= DESCONTO + 1000;


  SELECT * FROM TCONTRATO;

  -- Inserindo NULL na coluna desconto onde o COD_CONTRATO � igual a 2.
  UPDATE TCONTRATO SET
  DESCONTO = NULL
  WHERE COD_CONTRATO = 2;

  -- Selecionar todos os campos onde o desconto � nulo.
  SELECT * FROM TCONTRATO
  WHERE DESCONTO IS NULL;

  -- Selecionar todos os campos onde o desconto n�o � nulo.
  SELECT * FROM TCONTRATO
  WHERE DESCONTO IS NOT NULL;

  -- Selecionar todos os campos onde o desconta est� entre 0 a 10.
  SELECT * FROM TCONTRATO
  WHERE DESCONTO BETWEEN 0 AND 10;

  -- Trantando o campo NULL para ser exibindo ao usar o BETWEEN.
  -- Transformando NULL em 0 usando o cmando NVL.
  SELECT COD_CONTRATO, TOTAL, DESCONTO, NVL(DESCONTO, 0)
  FROM TCONTRATO
  WHERE NVL(DESCONTO, 0) BETWEEN 0 AND 10;

  -- Mesmo efeito do between.
  SELECT * FROM TCONTRATO
  WHERE DESCONTO >= 0
  AND DESCONTO <= 10
  OR DESCONTO IS NULL;


-- IN /// NOT IN

-- Selecionar campos onde o COD_CURSO � 1, 2 ou 3
SELECT * FROM TITEM
WHERE COD_CURSO IN (1, 2, 3);

-- Selecionar campos onde o COD_CURSO n�o seja 1, 2 ou 3
SELECT * FROM TITEM
WHERE COD_CURSO NOT IN (1, 2, 4);


INSERT INTO TCURSO VALUES (5,'WINDOWS', 1000, 50);

-- Selecionar cursos n�o vendidos usando subconsultas.
SELECT * FROM TCURSO
WHERE COD_CURSO NOT IN (SELECT COD_CURSO FROM TITEM)

-- Selecionar cursos vendidos usando subconsultas.
SELECT * FROM TCURSO
WHERE COD_CURSO IN (SELECT COD_CURSO FROM TITEM)

-- Outro comando semelhante ao SELECT IN
SELECT * FROM TITEM
WHERE COD_CURSO = 1
OR COD_CURSO = 2
OR COD_CURSO = 3;

-- Selecionar itens onde a segunda letra do nome inciar com A
SELECT * FROM TALUNO WHERE NOME LIKE '_A%'

-- Selecionar itens onde a primeira letra do nome inciar com W
SELECT * FROM TCURSO WHERE NOME LIKE 'W%'

-- Selecionar itens onde a primeira letra do nome contenha a palavra JAVA
SELECT * FROM TCURSO WHERE NOME LIKE '%JAVA%';

-- Selecionar itens onde a ultima palavra � 'FACE'
SELECT * FROM TCURSO WHERE NOME LIKE '%FACE';


SELECT * FROM TCURSO;

-- Adicinar uma nova coluna chamada PRE_REQ do tipo inteiro.
ALTER TABLE TCURSO ADD PRE_REQ INTEGER;

UPDATE TCURSO SET
PRE_REQ = 1
WHERE COD_CURSO = 2;

UPDATE TCURSO SET
PRE_REQ = 3
WHERE COD_CURSO = 4;

-- Selecionar todos os cursos que n�o tenha pre-requisito
SELECT * FROM TCURSO WHERE PRE_REQ IS NULL;

-- selecionar todos os cursos que tenha pre-pre-requisito
SELECT * FROM TCURSO WHERE PRE_REQ IS NOT NULL;

-- PRECEDENCIA DE OPERADORA

   SELECT * FROM TCURSO
   WHERE VALOR > 750
   OR VALOR < 1000
   AND CARGA_HORARIA = 25;

   SELECT * FROM TCURSO
   WHERE (VALOR > 750
   OR VALOR < 1000)
   AND CARGA_HORARIA = 25;




COMMIT;
























