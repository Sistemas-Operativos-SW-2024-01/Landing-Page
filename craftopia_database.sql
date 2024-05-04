-- Created by Vertabelo (http://vertabelo.com)
-- Last modification date: 2024-05-04 13:25:44.623

-- tables
-- Table: artesanos
CREATE TABLE artesanos (
    codigo int  NOT NULL,
    nombre_usuario varchar(100)  NOT NULL,
    contrasenia varchar(100)  NOT NULL,
    correo_electronico varchar(100)  NOT NULL,
    fecha_registro varchar(100)  NOT NULL,
    biografia text  NOT NULL,
    CONSTRAINT artesanos_pk PRIMARY KEY (codigo)
);

-- Table: artesanos_clientes_lista
CREATE TABLE artesanos_clientes_lista (
    artesanos_codigo int  NOT NULL,
    clientes_codigo int  NOT NULL,
    CONSTRAINT artesanos_clientes_lista_pk PRIMARY KEY (artesanos_codigo,clientes_codigo)
);

-- Table: categorias
CREATE TABLE categorias (
    codigo int  NOT NULL,
    nombre varchar(100)  NOT NULL,
    descripcion text  NOT NULL,
    CONSTRAINT categorias_pk PRIMARY KEY (codigo)
);

-- Table: clientes
CREATE TABLE clientes (
    codigo int  NOT NULL,
    nombre_usuario varchar(100)  NOT NULL,
    contrasenia varchar(100)  NOT NULL,
    correo_electronico varchar(100)  NOT NULL,
    fecha_registro datetime  NOT NULL,
    CONSTRAINT clientes_pk PRIMARY KEY (codigo)
);

-- Table: historial_compra
CREATE TABLE historial_compra (
    codigo int  NOT NULL,
    fecha_pedido datetime  NOT NULL,
    precio_total decimal(10,2)  NOT NULL,
    estado varchar(100)  NOT NULL,
    cantidad int  NOT NULL,
    clientes_codigo int  NOT NULL,
    CONSTRAINT historial_compra_pk PRIMARY KEY (codigo)
);

-- Table: ordenes
CREATE TABLE ordenes (
    codigo int  NOT NULL,
    fecha_pedido datetime  NOT NULL,
    precio_total decimal(10,2)  NOT NULL,
    estado varchar(100)  NOT NULL,
    cantidadd int  NOT NULL,
    clientes_codigo int  NOT NULL,
    CONSTRAINT ordenes_pk PRIMARY KEY (codigo)
);

-- Table: ordenes_productos
CREATE TABLE ordenes_productos (
    productos_codigo int  NOT NULL,
    ordenes_codigo int  NOT NULL,
    CONSTRAINT ordenes_productos_pk PRIMARY KEY (productos_codigo,ordenes_codigo)
);

-- Table: productos
CREATE TABLE productos (
    codigo int  NOT NULL,
    nombre varchar(100)  NOT NULL,
    descripcion text  NOT NULL,
    precio decimal(10,2)  NOT NULL,
    canitdad int  NOT NULL,
    artesanos_codigo int  NOT NULL,
    categorias_codigo int  NOT NULL,
    CONSTRAINT productos_pk PRIMARY KEY (codigo)
);

-- Table: resenias
CREATE TABLE resenias (
    codigo int  NOT NULL,
    calificacion int  NOT NULL,
    comentario text  NOT NULL,
    fecha datetime  NOT NULL,
    productos_codigo int  NOT NULL,
    CONSTRAINT resenias_pk PRIMARY KEY (codigo)
);

-- foreign keys
-- Reference: artesanos_clientes_lista_artesanos (table: artesanos_clientes_lista)
ALTER TABLE artesanos_clientes_lista ADD CONSTRAINT artesanos_clientes_lista_artesanos FOREIGN KEY artesanos_clientes_lista_artesanos (artesanos_codigo)
    REFERENCES artesanos (codigo);

-- Reference: artesanos_clientes_lista_clientes (table: artesanos_clientes_lista)
ALTER TABLE artesanos_clientes_lista ADD CONSTRAINT artesanos_clientes_lista_clientes FOREIGN KEY artesanos_clientes_lista_clientes (clientes_codigo)
    REFERENCES clientes (codigo);

-- Reference: historial_compra_clientes (table: historial_compra)
ALTER TABLE historial_compra ADD CONSTRAINT historial_compra_clientes FOREIGN KEY historial_compra_clientes (clientes_codigo)
    REFERENCES clientes (codigo);

-- Reference: ordenes_clientes (table: ordenes)
ALTER TABLE ordenes ADD CONSTRAINT ordenes_clientes FOREIGN KEY ordenes_clientes (clientes_codigo)
    REFERENCES clientes (codigo);

-- Reference: ordenes_productos_ordenes (table: ordenes_productos)
ALTER TABLE ordenes_productos ADD CONSTRAINT ordenes_productos_ordenes FOREIGN KEY ordenes_productos_ordenes (ordenes_codigo)
    REFERENCES ordenes (codigo);

-- Reference: ordenes_productos_productos (table: ordenes_productos)
ALTER TABLE ordenes_productos ADD CONSTRAINT ordenes_productos_productos FOREIGN KEY ordenes_productos_productos (productos_codigo)
    REFERENCES productos (codigo);

-- Reference: productos_artesanos (table: productos)
ALTER TABLE productos ADD CONSTRAINT productos_artesanos FOREIGN KEY productos_artesanos (artesanos_codigo)
    REFERENCES artesanos (codigo);

-- Reference: productos_categorias (table: productos)
ALTER TABLE productos ADD CONSTRAINT productos_categorias FOREIGN KEY productos_categorias (categorias_codigo)
    REFERENCES categorias (codigo);

-- Reference: resenias_productos (table: resenias)
ALTER TABLE resenias ADD CONSTRAINT resenias_productos FOREIGN KEY resenias_productos (productos_codigo)
    REFERENCES productos (codigo);

-- End of file.

