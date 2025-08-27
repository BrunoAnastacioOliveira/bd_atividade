CREATE DATABASE IF NOT EXISTS Escola;
USE Escola;

CREATE TABLE cursos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL
);

CREATE TABLE turmas (
    id INT AUTO_INCREMENT PRIMARY KEY,
    turma VARCHAR(50) NOT NULL,
    id_curso INT NOT NULL,
    FOREIGN KEY (id_curso) REFERENCES cursos(id)
);


CREATE TABLE alunos (
    id_aluno INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    idade INT,
    id_turma INT,
    FOREIGN KEY (id_turma) REFERENCES turmas(id)
);


CREATE TABLE boletim (
    id INT AUTO_INCREMENT PRIMARY KEY,
    id_curso INT NOT NULL,
    id_turma INT NOT NULL,
    id_aluno INT NOT NULL,
    nota DECIMAL(5,2) CHECK (nota BETWEEN 0 AND 10),
    FOREIGN KEY (id_curso) REFERENCES cursos(id),
    FOREIGN KEY (id_turma) REFERENCES turmas(id),
    FOREIGN KEY (id_aluno) REFERENCES alunos(id_aluno)
);



INSERT INTO cursos (nome) 
VALUES ('Técnico em Desenvolvimento de Sistemas');


INSERT INTO turmas (turma, id_curso) 
VALUES ('3DS', 1);


INSERT INTO alunos (nome, idade, id_turma) VALUES
('João da Silva', 17, 1),
('Maria Oliveira', 18, 1),
('Carlos Souza', 19, 1);

INSERT INTO boletim (id_curso, id_turma, id_aluno, nota) VALUES
(1, 1, 1, 8.5),  -- João
(1, 1, 2, 9.2),  -- Maria
(1, 1, 3, 7.8);  -- Carlos


SELECT 
    c.nome AS curso,
    t.turma,
    a.nome AS aluno,
    b.nota
FROM 
    boletim b
JOIN alunos a ON b.id_aluno = a.id_aluno
JOIN turmas t ON b.id_turma = t.id
JOIN cursos c ON b.id_curso = c.id
WHERE 
    t.turma = '3DS'
    AND c.nome = 'Técnico em Desenvolvimento de Sistemas';

CALL proc_esco();
