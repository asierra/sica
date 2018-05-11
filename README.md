# Sistema de Control de Aceso (SICA)

El sistema SICA se desarrolló originalmente para registrar el acceso
de estudiantes al Centro de Ciencias de la Atmósfera (CCA), UNAM, que
asisten a tomar una clase o a alguna actividad relacionada con un
académico del CCA. Hay tres partes involucradas en el sistema: el
estudiante, el académico y la coordinación docente. Para el caso del
estudiante las actividades que realizará son el registro de sus datos
personales y fotografía y la solicitud de activación. Para la
coordinación escolar, las actividades son la captura de cursos que se
imparten en el centro, la autorización de la activación del estudiante
y la consulta y generación de reportes. En la operación, el estudiante
presenta su credencial ante un lector de código de barras en la
entrada; en el caso de que su registro esté activado en el sistema,
sus datos aparecerán en la pantalla a la vista del vigilante en turno,
si no es así deberá solicitar su activación. Además de presentar la
información del estudiante, la entrada queda registrada con hora y
fecha para su consulta posterior por la coordinación escolar.

El sistema está desarrollado en la plataforma Ruby (2.5) on Rails
(5.1.5) y el motor de bases de datos SQLite3.  Se requiere lo típico
para una aplicación rails moderna y el servidor de producción
recomendado es Apache2 / Pushion Passenger.

License:  GPL 3.0

Copyright (c) 2018 Alejandro Aguilar Sierra (asierra@unam.mx)
	           Centro de Ciencias de la Atmosfera, UNAM

