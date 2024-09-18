CREATE TABLE tbl_categorias (
    cat_id INT PRIMARY KEY,
    cat_descripcion VARCHAR(45)
);

CREATE TABLE tbl_provedores (
    prov_id INT PRIMARY KEY,
    prov_nit VARCHAR(45),
    prov_nombre VARCHAR(100)
);

CREATE TABLE tbl_usuarios (
    usu_id INT PRIMARY KEY,
    usu_correo VARCHAR(80),
    usu_contrasena TEXT,
    usu_salt TEXT,
    usu_estado VARCHAR(15)
);

CREATE TABLE tbl_productos (
    pro_id INT PRIMARY KEY,
    pro_codigo VARCHAR(45),
    pro_descripcion VARCHAR(100),
    pro_cantidad INT,
    pro_precio DOUBLE,
    tbl_provedores_prov_id INT,
    tbl_categorias_cat_id INT,
    FOREIGN KEY (tbl_provedores_prov_id) REFERENCES tbl_provedores(prov_id),
    FOREIGN KEY (tbl_categorias_cat_id) REFERENCES tbl_categorias(cat_id)
);

-- Categorias
-- INSERT
DELIMITER //
CREATE PROCEDURE sp_insert_category(IN v_descripcion VARCHAR(45))
BEGIN
  INSERT INTO tbl_categorias(cat_descripcion) VALUES(v_descripcion);
END;
DELIMITER ;

-- UPDATE
DELIMITER //
CREATE PROCEDURE sp_update_category(IN v_id INT, IN v_descripcion VARCHAR(45))
BEGIN
  UPDATE tbl_categorias
  SET cat_descripcion = v_descripcion
  WHERE cat_id = v_id;
END;
DELIMITER ;

-- SHOW
DELIMITER //
CREATE PROCEDURE sp_show_category()
BEGIN
  SELECT cat_id,cat_descripcion FROM tbl_categorias;
END;
DELIMITER ;

-- DELETE
DELIMITER //
CREATE PROCEDURE sp_delete_category(IN v_id INT)
BEGIN
  DELETE FROM tbl_categorias WHERE cat_id = v_id;
END;
DELIMITER ;

-- Provedores


-- Productos


-- Usuarios
