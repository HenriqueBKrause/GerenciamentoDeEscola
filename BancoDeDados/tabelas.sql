-- Criar o schema Escola
CREATE SCHEMA IF NOT EXISTS Escola;
USE Escola;

-- Criar a tabela Escola
CREATE TABLE IF NOT EXISTS Escola (
    ID_escola INT PRIMARY KEY,
    NomeEscola VARCHAR(100),
    Endereco TEXT,
    Telefone VARCHAR(15),
    Diretor VARCHAR(100),
    AnoFundacao YEAR
);

-- -- Inserir dados na tabela Escola
-- INSERT INTO Escola (ID_escola, NomeEscola, Endereco, Telefone, Diretor, AnoFundacao) 
-- VALUES 
-- (1, 'Escola Primária ABC', 'Rua Principal, 123', '123456789', 'João Silva', 1990),
-- (2, 'Escola Secundária XYZ', 'Avenida Secundária, 456', '987654321', 'Maria Santos', 2005);

-- Criar a tabela Professor
CREATE TABLE IF NOT EXISTS Professor (
    ID_professor INT PRIMARY KEY,
    Nome VARCHAR(100),
    DataNascimento DATE,
    Genero VARCHAR(10),
    Endereco TEXT,
    Telefone VARCHAR(15),
    Email VARCHAR(100),
    ID_escola INT,
    FOREIGN KEY (ID_escola) REFERENCES Escola(ID_escola)
);

-- -- Inserir dados na tabela Professor
-- INSERT INTO Professor (ID_professor, Nome, DataNascimento, Genero, Endereco, Telefone, Email, ID_escola) 
-- VALUES 
-- (1, 'Carlos Oliveira', '1980-05-15', 'Masculino', 'Rua Professor, 234', '987654321', 'carlos@email.com', 1),
-- (2, 'Ana Santos', '1975-08-20', 'Feminino', 'Avenida Professora, 456', '123456789', 'ana@email.com', 2);

-- Criar a tabela Disciplina
CREATE TABLE IF NOT EXISTS Disciplina (
    ID_disciplina INT PRIMARY KEY,
    NomeDisciplina VARCHAR(100)
);

-- -- Inserir dados na tabela Disciplina
-- INSERT INTO Disciplina (ID_disciplina, NomeDisciplina) 
-- VALUES 
-- (1, 'Matemática'),
-- (2, 'História'),
-- (3, 'Ciências');

-- Criar a tabela Turma
CREATE TABLE IF NOT EXISTS Turma (
    ID_turma INT PRIMARY KEY,
    ID_professor INT,
    ID_disciplina INT,
    Ano INT,
    Periodo VARCHAR(10),
    FOREIGN KEY (ID_professor) REFERENCES Professor(ID_professor),
    FOREIGN KEY (ID_disciplina) REFERENCES Disciplina(ID_disciplina)
);

-- -- Inserir dados na tabela Turma
-- INSERT INTO Turma (ID_turma, ID_professor, ID_disciplina, Ano, Periodo) 
-- VALUES 
-- (1, 1, 1, 2024, 'Semestre 1'),
-- (2, 2, 2, 2024, 'Semestre 1');

-- Criar a tabela Aluno
CREATE TABLE IF NOT EXISTS Aluno (
    ID_aluno INT PRIMARY KEY,
    Nome VARCHAR(100),
    DataNascimento DATE,
    Genero VARCHAR(10),
    Endereco TEXT,
    Telefone VARCHAR(15),
    Email VARCHAR(100),
    ID_escola INT,
    FOREIGN KEY (ID_escola) REFERENCES Escola(ID_escola)
);

-- -- Inserir dados na tabela Aluno
-- INSERT INTO Aluno (ID_aluno, Nome, DataNascimento, Genero, Endereco, Telefone, Email, ID_escola) 
-- VALUES 
-- (1, 'Maria Oliveira', '2005-03-10', 'Feminino', 'Rua do Aluno, 123', '111222333', 'maria@email.com', 1),
-- (2, 'Pedro Santos', '2006-07-20', 'Masculino', 'Avenida do Estudante, 456', '444555666', 'pedro@email.com', 2);

-- Criar a tabela Nota
CREATE TABLE IF NOT EXISTS Nota (
    ID_nota INT PRIMARY KEY,
    ID_aluno INT,
    ID_disciplina INT,
    ValorNota DECIMAL(5, 2),
    DataNota DATE,
    FOREIGN KEY (ID_aluno) REFERENCES Aluno(ID_aluno),
    FOREIGN KEY (ID_disciplina) REFERENCES Disciplina(ID_disciplina)
);

-- -- Inserir dados na tabela Nota
-- INSERT INTO Nota (ID_nota, ID_aluno, ID_disciplina, ValorNota, DataNota) 
-- VALUES 
-- (1, 1, 1, 8.5, '2024-03-10'),
-- (2, 2, 2, 7.8, '2024-03-10');

-- Criar a tabela Matricula
CREATE TABLE IF NOT EXISTS Matricula (
    ID_matricula INT PRIMARY KEY,
    ID_aluno INT,
    ID_turma INT,
    DataMatricula DATE,
    FOREIGN KEY (ID_aluno) REFERENCES Aluno(ID_aluno),
    FOREIGN KEY (ID_turma) REFERENCES Turma(ID_turma)
);

-- -- Inserir dados na tabela Matricula
-- INSERT INTO Matricula (ID_matricula, ID_aluno, ID_turma, DataMatricula) 
-- VALUES 
-- (1, 1, 1, '2024-03-10'),
-- (2, 2, 2, '2024-03-10');
