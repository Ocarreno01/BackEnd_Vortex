# Proyecto Backend Vortex

Este proyecto backend se desarrolló utilizando una combinación de tecnologías modernas y frameworks para garantizar la eficiencia, la modularidad y el mantenimiento sostenible del código. A continuación, se detallan las tecnologías y frameworks utilizados, junto con las razones detrás de estas elecciones y las buenas prácticas implementadas.

## Tecnologías Utilizadas:

1. **Node.js y Express:**

   - **Razón:** Node.js es una plataforma de ejecución de JavaScript que permite la creación de aplicaciones eficientes y escalables. Express, un framework para Node.js, facilita la construcción de API REST de manera sencilla y flexible.

2. **Sequelize y Sequelize-Typescript:**

   - **Razón:** Sequelize es un ORM para bases de datos relacionales que facilita la interacción con bases de datos PostgreSQL. Sequelize-Typescript extiende Sequelize para agregar soporte de decoradores TypeScript, lo que mejora la legibilidad y mantenimiento del código.

3. **Inversify y Inversify Express Utils:**

   - **Razón:** Inversify es un contenedor de inversión de control (IoC) que se integra bien con TypeScript y facilita la inyección de dependencias. Inversify Express Utils proporciona utilidades para integrar Inversify con Express, facilitando la creación de controladores y rutas de manera modular.

4. **Cors:**

   - **Razón:** Cors se utiliza para gestionar la política de mismo origen (CORS) y permitir solicitudes HTTP desde diferentes dominios, mejorando la interoperabilidad con clientes en el navegador.

5. **Dotenv:**
   - **Razón:** Dotenv se utiliza para cargar variables de entorno desde un archivo `.env`, lo que permite la configuración fácil y segura de parámetros sensibles.

## Razones de Elección y Buenas Prácticas:

1. **TypeScript:**

   - Se eligió TypeScript para aprovechar la verificación de tipos estática, lo que ayuda a evitar errores comunes y mejora la refactorización del código.

2. **Express y Sequelize:**

   - Express se seleccionó por su simplicidad y flexibilidad en la creación de API REST.
   - Sequelize se eligió para interactuar con la base de datos PostgreSQL de manera eficiente, proporcionando un ORM robusto y fácil de usar.

3. **Inyección de Dependencias con Inversify:**

   - La inyección de dependencias mejora la modularidad y facilita las pruebas unitarias.
   - Inversify se utilizó para implementar un patrón de inversión de control (IoC) y facilitar la gestión de dependencias.

4. **Buenas Prácticas en Controladores:**

   - Validación estricta de tipos en las solicitudes mediante interfaces específicas para mejorar la seguridad y la legibilidad del código.

5. **Manejo de Errores con Middleware:**

   - Implementación de un middleware para manejar de manera uniforme los errores y evitar la repetición de código.

6. **Gestión de Variables de Entorno con Dotenv:**
   - Dotenv se utiliza para cargar y gestionar las variables de entorno, lo que mejora la seguridad y la portabilidad del proyecto.

Este proyecto sigue las mejores prácticas de programación y arquitectura para garantizar un desarrollo eficiente, sostenible y mantenible.
