-- Crear la base de datos si no existe
CREATE DATABASE IF NOT EXISTS vortex_delivery;

-- Conectar a la base de datos
\c vortex_delivery;

CREATE TABLE IF NOT EXISTS public.drivers (
    id SERIAL PRIMARY KEY,
    identification VARCHAR(11) NOT NULL,
    last_name VARCHAR(20) NOT NULL,
    first_name VARCHAR(20) NOT NULL,
    phone VARCHAR(10),
    "address" VARCHAR(50),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE IF NOT EXISTS public.vehicles (
    id SERIAL PRIMARY KEY,
    model VARCHAR(4) NOT NULL,
    plate VARCHAR(7),
    ability VARCHAR(7),
    conductor_id INTEGER REFERENCES public.drivers(id) NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE IF NOT EXISTS public.orders (
    id SERIAL PRIMARY KEY,
    order_type VARCHAR(20),
    "address" VARCHAR(50),
    conductor_id INTEGER REFERENCES public.drivers(id),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE IF NOT EXISTS public.parameters (
    id SERIAL PRIMARY KEY,
    "name" VARCHAR(50) UNIQUE NOT NULL,
    "value" TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
