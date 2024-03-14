const express = require("express");
const mysql = require("mysql2");
const bodyParser = require("body-parser");

const app = express();
const port = 3000;

const connection = mysql.createConnection({
  host: "localhost",
  user: "root",
  password: "admin",
  database: "Escola",
});

connection.connect((err) => {
  if (err) {
    console.error("Erro ao conectar ao banco de dados:", err);
  } else {
    console.log("Conexão bem-sucedida ao banco de dados");
  }
});

app.use(bodyParser.json());

// Adicionar um Aluno
app.post("/alunos", (req, res) => {
  const { Nome, DataNascimento, Genero, Endereco, Telefone, Email, ID_escola } =
    req.body;
  const query = "CALL AdicionarAluno(?, ?, ?, ?, ?, ?, ?)";
  connection.query(
    query,
    [Nome, DataNascimento, Genero, Endereco, Telefone, Email, ID_escola],
    (err, results) => {
      if (err) {
        console.error("Erro ao adicionar aluno:", err);
        res.status(500).send("Erro ao adicionar aluno");
      } else {
        res.status(200).send("Aluno adicionado com sucesso!");
      }
    }
  );
});

// Adicionar um Professor
app.post("/professores", (req, res) => {
  const { Nome, DataNascimento, Genero, Endereco, Telefone, Email, ID_escola } =
    req.body;
  const query = "CALL AdicionarProfessor(?, ?, ?, ?, ?, ?, ?)";
  connection.query(
    query,
    [Nome, DataNascimento, Genero, Endereco, Telefone, Email, ID_escola],
    (err, results) => {
      if (err) {
        console.error("Erro ao adicionar professor:", err);
        res.status(500).send("Erro ao adicionar professor");
      } else {
        res.status(200).send("Professor adicionado com sucesso!");
      }
    }
  );
});

// Adicionar uma Escola
app.post("/escolas", (req, res) => {
  const { NomeEscola, Endereco, Telefone, Diretor, AnoFundacao } = req.body;
  const query = "CALL AdicionarEscola(?, ?, ?, ?, ?)";
  connection.query(
    query,
    [NomeEscola, Endereco, Telefone, Diretor, AnoFundacao],
    (err, results) => {
      if (err) {
        console.error("Erro ao adicionar escola:", err);
        res.status(500).send("Erro ao adicionar escola");
      } else {
        res.status(200).send("Escola adicionada com sucesso!");
      }
    }
  );
});

// Adicionar uma Turma
app.post("/turmas", (req, res) => {
  const { ID_professor, ID_disciplina, Ano, Periodo } = req.body;
  const query = "CALL AdicionarTurma(?, ?, ?, ?)";
  connection.query(
    query,
    [ID_professor, ID_disciplina, Ano, Periodo],
    (err, results) => {
      if (err) {
        console.error("Erro ao adicionar turma:", err);
        res.status(500).send("Erro ao adicionar turma");
      } else {
        res.status(200).send("Turma adicionada com sucesso!");
      }
    }
  );
});

// Adicionar uma Disciplina
app.post("/disciplinas", (req, res) => {
  const { NomeDisciplina } = req.body;
  const query = "CALL AdicionarDisciplina(?)";
  connection.query(query, [NomeDisciplina], (err, results) => {
    if (err) {
      console.error("Erro ao adicionar disciplina:", err);
      res.status(500).send("Erro ao adicionar disciplina");
    } else {
      res.status(200).send("Disciplina adicionada com sucesso!");
    }
  });
});

// Lançar uma Nota
app.post("/notas", (req, res) => {
  const { ID_aluno, ID_disciplina, ValorNota, DataNota } = req.body;
  const query = "CALL LancarNota(?, ?, ?, ?)";
  connection.query(
    query,
    [ID_aluno, ID_disciplina, ValorNota, DataNota],
    (err, results) => {
      if (err) {
        console.error("Erro ao lançar nota:", err);
        res.status(500).send("Erro ao lançar nota");
      } else {
        res.status(200).send("Nota lançada com sucesso!");
      }
    }
  );
});

// Obter todos os Alunos
app.get("/alunos", (req, res) => {
  const query = "SELECT * FROM Alunos";
  connection.query(query, (err, results) => {
    if (err) {
      console.error("Erro ao obter dados da tabela Alunos:", err);
      res.status(500).send("Erro ao obter dados da tabela Alunos");
    } else {
      console.log("Dados da tabela Alunos:", results);
      res.status(200).json(results);
    }
  });
});

// Obter todos os Professores
app.get("/professores", (req, res) => {
  const query = "SELECT * FROM Professores";
  connection.query(query, (err, results) => {
    if (err) {
      console.error("Erro ao obter dados da tabela Professores:", err);
      res.status(500).send("Erro ao obter dados da tabela Professores");
    } else {
      console.log("Dados da tabela Professores:", results);
      res.status(200).json(results);
    }
  });
});

// Obter todas as Escolas
app.get("/escolas", (req, res) => {
  const query = "SELECT * FROM Escolas";
  connection.query(query, (err, results) => {
    if (err) {
      console.error("Erro ao obter dados da tabela Escolas:", err);
      res.status(500).send("Erro ao obter dados da tabela Escolas");
    } else {
      console.log("Dados da tabela Escolas:", results);
      res.status(200).json(results);
    }
  });
});

// Obter todas as Turmas
app.get("/turmas", (req, res) => {
  const query = "SELECT * FROM Turmas";
  connection.query(query, (err, results) => {
    if (err) {
      console.error("Erro ao obter dados da tabela Turmas:", err);
      res.status(500).send("Erro ao obter dados da tabela Turmas");
    } else {
      console.log("Dados da tabela Turmas:", results);
      res.status(200).json(results);
    }
  });
});

// Obter todas as Disciplinas
app.get("/disciplinas", (req, res) => {
  const query = "SELECT * FROM Disciplinas";
  connection.query(query, (err, results) => {
    if (err) {
      console.error("Erro ao obter dados da tabela Disciplinas:", err);
      res.status(500).send("Erro ao obter dados da tabela Disciplinas");
    } else {
      console.log("Dados da tabela Disciplinas:", results);
      res.status(200).json(results);
    }
  });
});

// Obter todas as Notas
app.get("/notas", (req, res) => {
  const query = "SELECT * FROM Notas";
  connection.query(query, (err, results) => {
    if (err) {
      console.error("Erro ao obter dados da tabela Notas:", err);
      res.status(500).send("Erro ao obter dados da tabela Notas");
    } else {
      console.log("Dados da tabela Notas:", results);
      res.status(200).json(results);
    }
  });
});

app.listen(port, () => {
  console.log(`Servidor rodando na porta ${port}`);
});
