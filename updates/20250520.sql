CREATE TABLE plank_stats_graphs (
  id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
  stat_id INT NOT NULL,
  title VARCHAR(255) NOT NULL,
  config JSON NOT NULL,
  filters JSON,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  
  CONSTRAINT fk_plank_stats_graphs_stat_id FOREIGN KEY (stat_id)
    REFERENCES plank_stats_queries(id)
);
