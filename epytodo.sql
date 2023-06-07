-- Créer la base de données epytodo
CREATE DATABASE IF NOT EXISTS epytodo;

-- Utiliser la base de données epytodo
USE epytodo;

-- Créer l'utilisateur et définir le mot de passe
CREATE USER 'root'@'localhost' IDENTIFIED BY 'root';

-- Accorder tous les privilèges à l'utilisateur root
GRANT ALL PRIVILEGES ON epytodo.* TO 'root'@'localhost';

-- Recharger les privilèges
FLUSH PRIVILEGES;

-- Créer la table user
CREATE TABLE IF NOT EXISTS user (
    id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    email VARCHAR(255) NOT NULL UNIQUE,
    password VARCHAR(255) NOT NULL,
    name VARCHAR(255) NOT NULL,
    firstname VARCHAR(255) NOT NULL,
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP
);

-- Créer la table todo
CREATE TABLE IF NOT EXISTS todo (
    id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    description TEXT NOT NULL,
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    due_time DATETIME NOT NULL,
    status ENUM('not started', 'todo', 'in progress', 'done') DEFAULT 'not started',
    user_id INT UNSIGNED NOT NULL
);
