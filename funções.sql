-- Adicionar um Aluno
DELIMITER //
CREATE PROCEDURE AdicionarAluno(
    IN p_Nome VARCHAR(100),
    IN p_DataNascimento DATE,
    IN p_Genero VARCHAR(10),
    IN p_Endereco TEXT,
    IN p_Telefone VARCHAR(15),
    IN p_Email VARCHAR(100),
    IN p_ID_escola INT
)
BEGIN
    INSERT INTO Aluno (Nome, DataNascimento, Genero, Endereco, Telefone, Email, ID_escola)
    VALUES (p_Nome, p_DataNascimento, p_Genero, p_Endereco, p_Telefone, p_Email, p_ID_escola);
END //
DELIMITER ;

-- Adicionar um Professor
DELIMITER //
CREATE PROCEDURE AdicionarProfessor(
    IN p_Nome VARCHAR(100),
    IN p_DataNascimento DATE,
    IN p_Genero VARCHAR(10),
    IN p_Endereco TEXT,
    IN p_Telefone VARCHAR(15),
    IN p_Email VARCHAR(100),
    IN p_ID_escola INT
)
BEGIN
    INSERT INTO Professor (Nome, DataNascimento, Genero, Endereco, Telefone, Email, ID_escola)
    VALUES (p_Nome, p_DataNascimento, p_Genero, p_Endereco, p_Telefone, p_Email, p_ID_escola);
END //
DELIMITER ;

-- Adicionar uma Escola
DELIMITER //
CREATE PROCEDURE AdicionarEscola(
    IN p_NomeEscola VARCHAR(100),
    IN p_Endereco TEXT,
    IN p_Telefone VARCHAR(15),
    IN p_Diretor VARCHAR(100),
    IN p_AnoFundacao YEAR
)
BEGIN
    INSERT INTO Escola (NomeEscola, Endereco, Telefone, Diretor, AnoFundacao)
    VALUES (p_NomeEscola, p_Endereco, p_Telefone, p_Diretor, p_AnoFundacao);
END //
DELIMITER ;

-- Adicionar uma Turma
DELIMITER //
CREATE PROCEDURE AdicionarTurma(
    IN p_ID_professor INT,
    IN p_ID_disciplina INT,
    IN p_Ano INT,
    IN p_Periodo VARCHAR(10)
)
BEGIN
    INSERT INTO Turma (ID_professor, ID_disciplina, Ano, Periodo)
    VALUES (p_ID_professor, p_ID_disciplina, p_Ano, p_Periodo);
END //
DELIMITER ;

-- Adicionar uma Disciplina
DELIMITER //
CREATE PROCEDURE AdicionarDisciplina(
    IN p_NomeDisciplina VARCHAR(100)
)
BEGIN
    INSERT INTO Disciplina (NomeDisciplina)
    VALUES (p_NomeDisciplina);
END //
DELIMITER ;

-- Lançar uma Nota
DELIMITER //
CREATE PROCEDURE LancarNota(
    IN p_ID_aluno INT,
    IN p_ID_disciplina INT,
    IN p_ValorNota DECIMAL(5, 2),
    IN p_DataNota DATE
)
BEGIN
    INSERT INTO Nota (ID_aluno, ID_disciplina, ValorNota, DataNota)
    VALUES (p_ID_aluno, p_ID_disciplina, p_ValorNota, p_DataNota);
END //
DELIMITER ;
