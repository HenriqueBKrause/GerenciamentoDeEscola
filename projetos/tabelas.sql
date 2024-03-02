-- Tabela Escola
CREATE TABLE Escola (
    ID_escola INT PRIMARY KEY,
    NomeEscola VARCHAR(100),
    Endereco TEXT,
    Telefone VARCHAR(15),
    Diretor VARCHAR(100),
    AnoFundacao YEAR
);

-- Tabela Professor
CREATE TABLE Professor (
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

-- Tabela Disciplina
CREATE TABLE Disciplina (
    ID_disciplina INT PRIMARY KEY,
    NomeDisciplina VARCHAR(100)
);

-- Tabela Turma
CREATE TABLE Turma (
    ID_turma INT PRIMARY KEY,
    ID_professor INT,
    ID_disciplina INT,
    Ano INT,
    Periodo VARCHAR(10),
    FOREIGN KEY (ID_professor) REFERENCES Professor(ID_professor),
    FOREIGN KEY (ID_disciplina) REFERENCES Disciplina(ID_disciplina)
);

-- Tabela Aluno
CREATE TABLE Aluno (
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

-- Tabela Nota
CREATE TABLE Nota (
    ID_nota INT PRIMARY KEY,
    ID_aluno INT,
    ID_disciplina INT,
    ValorNota DECIMAL(5, 2),
    DataNota DATE,
    FOREIGN KEY (ID_aluno) REFERENCES Aluno(ID_aluno),
    FOREIGN KEY (ID_disciplina) REFERENCES Disciplina(ID_disciplina)
);

-- Tabela Matricula
CREATE TABLE Matricula (
    ID_matricula INT PRIMARY KEY,
    ID_aluno INT,
    ID_turma INT,
    DataMatricula DATE,
    FOREIGN KEY (ID_aluno) REFERENCES Aluno(ID_aluno),
    FOREIGN KEY (ID_turma) REFERENCES Turma(ID_turma)
);
