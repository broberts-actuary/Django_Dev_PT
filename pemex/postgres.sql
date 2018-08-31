--
-- PostgreSQL database dump
--

-- Dumped from database version 9.5.13
-- Dumped by pg_dump version 9.5.13

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: DATABASE postgres; Type: COMMENT; Schema: -; Owner: postgres
--

COMMENT ON DATABASE postgres IS 'default administrative connection database';


--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: applicability; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.applicability (
    id integer NOT NULL,
    desc_eng character varying,
    desc_esp character varying
);


ALTER TABLE public.applicability OWNER TO postgres;

--
-- Name: assets; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.assets (
    id integer NOT NULL,
    nam character varying,
    code character varying
);


ALTER TABLE public.assets OWNER TO postgres;

--
-- Name: criteria; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.criteria (
    id integer NOT NULL,
    desc_eng character varying,
    desc_esp character varying
);


ALTER TABLE public.criteria OWNER TO postgres;

--
-- Name: field_inputs; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.field_inputs (
    id integer NOT NULL,
    item integer,
    applicability integer,
    item_status integer,
    input_user integer,
    input_date date,
    input_comment character varying,
    seq_num integer,
    next_responsible integer,
    next_action character varying
);


ALTER TABLE public.field_inputs OWNER TO postgres;

--
-- Name: files; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.files (
    id integer NOT NULL,
    filenam character varying,
    deleted bytea,
    upload_user character varying,
    upload_comment character varying
);


ALTER TABLE public.files OWNER TO postgres;

--
-- Name: inst_import_lookup; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.inst_import_lookup (
    orig character(10),
    lookup character(30)
);


ALTER TABLE public.inst_import_lookup OWNER TO postgres;

--
-- Name: installations; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.installations (
    id integer NOT NULL,
    nam character varying,
    asset integer,
    processing_center character varying,
    platform_count integer,
    latitude double precision,
    longitude double precision
);


ALTER TABLE public.installations OWNER TO postgres;

--
-- Name: items; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.items (
    id integer NOT NULL,
    installation integer,
    recommendation integer,
    verification integer,
    criteria integer
);


ALTER TABLE public.items OWNER TO postgres;

--
-- Name: recommendations; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.recommendations (
    id integer NOT NULL,
    nam character varying,
    prefix character varying,
    major character varying,
    minor character varying,
    part character varying,
    desc_eng character varying,
    desc_esp character varying,
    summary_eng character varying,
    summary_esp character varying,
    pep_responsible character varying,
    absg_responsible character varying,
    installation character varying,
    feild_verification character varying,
    interview character varying,
    sweetiening_plant character varying,
    drill character varying,
    crae character varying,
    cases character varying,
    abk_a2 character varying
);


ALTER TABLE public.recommendations OWNER TO postgres;

--
-- Name: status; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.status (
    id integer NOT NULL,
    desc_eng character varying,
    desc_esp character varying,
    type_user bytea,
    type_rev bytea,
    next_action character varying
);


ALTER TABLE public.status OWNER TO postgres;

--
-- Name: users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.users (
    id integer NOT NULL,
    username character varying,
    passcode character varying,
    contact_phone character varying,
    contact_email character varying,
    type_user bytea,
    type_rev bytea
);


ALTER TABLE public.users OWNER TO postgres;

--
-- Name: verification_actions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.verification_actions (
    id integer NOT NULL,
    desc_eng character varying,
    desc_esp character varying
);


ALTER TABLE public.verification_actions OWNER TO postgres;

--
-- Data for Name: applicability; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.applicability (id, desc_eng, desc_esp) FROM stdin;
2	Not Applicable	No aplica
1	TBD	TBD
3	Applicable	Aplica
\.


--
-- Data for Name: assets; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.assets (id, nam, code) FROM stdin;
6	Litoral	02-04
3	CASES	\N
5	KuMaZa	01-02
1	ABK-POL-CHUK	02-03
2	Cantarell	01-01
4	CRAE	\N
\.


--
-- Data for Name: criteria; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.criteria (id, desc_eng, desc_esp) FROM stdin;
1	1 - The technical basis of the implementation program was documented.	1 - Se ha documentado la base técnica del programa de ejecución.
9	B.  A guideline was developed and documented for the helmsmen to perform the verification of the lifeboat conditions at the beginning of his 14-day shift.	B. Se desarrolló y documentó una directriz para que los timoneles realicen la verificación de las condiciones del bote salvavidas al comienzo de su turno de 14 días.
17	B.  An analysis about the current SDVs set points and locations of their instrumentation was conducted and documented.	B. Se realizó y documento un análisis acerca de las ubicaciones presentes de los SDV’s y sus instrumentos.
25	B.  Guidance on the development of inspection plans to include consideration of 1) special conditions in the process, 2) combined corrosion damage mechanisms, and 3) historical inspection results.	B. Orientación sobre el desarrollo de planes de inspección para incluir la consideración de 1) condiciones especiales en el proceso, 2) mecanismos combinados de daños por corrosión y 3) resultados históricos de inspección.
33	B.  Requirements that all bypass lines and dead legs in the installation are identified for the inspection company prior to the development of the inspection plan.	B. Requisitos de que todas las líneas de bypass y las patas muertas en la instalación estén identificadas para la compañía de inspección antes del desarrollo del plan de inspección.
41	B.  The PEP Technical Standard for pressure vessel design and construction includes the requirement that steel used in the design of pressure vessels for critical sour service in offshore facilities is normalized.	B. El Standard Técnico de PEP para el diseño y construcción de recipientes a presión incluya el requisito de que el acero usado en el diseño de recipientes a presión para servicio crítico amargo en instalaciones costa afuera sea normalizado.
49	B.  There is a requirement that process risk analysis teams include participation of a certified corrosion expert with experience in the identification of and consequent damage from MIC and other common damage mechanisms in the offshore facilities.	B. Se requiere que los equipos de análisis de riesgos de proceso incluyan la participación de un experto certificado en corrosión con experiencia en la identificación y consecuente daño de MIC y otros mecanismos comunes de daños en las instalaciones offshore.
57	C.  Inspection plans developed since the enactment of the above guidance include consideration of historical inspection results includes the 1) review of the inspection techniques applied, 2) review of inspection measurement locations, and 3) the assessment of measurement trends.	C. Los planes de inspección desarrollados desde la promulgación de la guía anterior incluyen el examen de los resultados de la inspección histórica incluye 1) revisión de las técnicas de inspección aplicadas, 2) revisión de los lugares de medición de la inspección y 3) evaluación de las tendencias de medición.
65	C.  Requirements are in place for the assessment of lines to determine if they are sporadically used.	C. Existen requisitos para la evaluación de las líneas para determinar si se utilizan esporádicamente.
73	C.  That documentation shows that all offshore installations with combustible gas systems, in the Sound of Campeche were included in the census.	C. Que la documentación demuestra que todas las instalaciones costa afuera con los sistemas de gas combustible, en la Bahía de Campeche fueron incluidas en el censo.
81	C.  The criteria which defines the contracting basis for third parties includes the requirement that the SSPA supervisor has knowledge regarding all safety and protection environment aspects inherent to the position, including survival at the sea.	C. Los criterios que definen las bases de contratación para terceros incluyen el requisito de que el supervisor de SSPA tenga conocimiento sobre todos los aspectos del ambiente de seguridad y protección inherentes a la posición, incluida la supervivencia en el mar.
89	C.  There is a documented strategy in place to provide ambulance helicopter(s) in the event of an emergency situation.	C. Hay una estrategia documentada en el lugar para proporcionar helicóptero(s) ambulancia en caso de una situación de emergencia.
97	D.  An evaluation to determine the optimum frequency and identity of the necessary personnel (e.g., helmsmen and safety engineer) to perform navigation tests, was performed and documented.	D. Se realizó y documentó una evaluación para determinar la frecuencia optima e identidad del personal (por ejemplo, timonel e ingeniero de seguridad) necesarios para realizar las pruebas de navegación.
105	D.  Review the professional background of the individual supervising the analysis for the feasibility and/or the individual performing the analysis to determine appropriate experience and expertise.	D. Revisar los antecedentes profesionales de la persona que supervisa el análisis para la factibilidad y/o la persona que realiza el análisis para determinar la experiencia y la experiencia apropiadas.
113	D.  That the RBI procedure P.6.0300.01:2015 (or equivalent) was updated or replaced based on the criteria developed to detect and control damage mechanisms on sporadic use lines	D. Que el procedimiento RBI P.6.0300.01: 2015 (o equivalente) fue actualizado o reemplazado en base a los criterios desarrollados para detectar y controlar mecanismos de daño en líneas de uso esporádico
121	D.  The PEP material selection criteria for sour gas lines is based on the characterization of damage mechanisms.	D. Los criterios de selección de materiales de PEP para líneas de gas ácido se basan en la caracterización de mecanismos de daño.
129	E.  Documentation of the installed monitoring system was completed and conforms to the technical basis.	E. Se completó la documentación del sistema de monitoreo instalado y se ajusta a la base técnica.
137	E.  That sporadic use lines, in the combustible gas system, are appropriately marked/flagged.	E. Que las líneas de uso esporádico, en el sistema de gas combustible, estén apropiadamente marcadas / marcadas.
145	E.  The requirement exists that a defined portion of the abandon platform drills be conducted under pressure.	E. Existe el requerimiento de que una parte definida de los simulacros de abandono de plataforma se lleve a cabo bajo presión.
153	F.  Evidence of an evaluation into the possible methods of optimization of sweetening processes to further reduce the levels of H2S in combustible gas lines.	F. Evidencia de una evaluación de los posibles métodos de optimización de los procesos edulcorantes para reducir aún más los niveles de H2S en las líneas de gas combustible.
161	F.  Review the professional background of the individual supervising the analysis for the installation and/or the individual performing the analysis to determine appropriate experience and expertise.	F. Revisar los antecedentes profesionales del individuo que supervisa el análisis para la instalación y/o la persona que realiza el análisis para determinar la experiencia y la experiencia apropiadas.
4	4 - The documentation was completed and conforms to the technical basis.	4 - La documentación se ha completado y cumple con la base técnica.
12	B.  A review of best international practices and codes in order to develop requirements for the techniques and criteria to perform inspections for static equipment in offshore facilities was carried out and documented.	B. Se llevó a cabo y documentó una revisión de las mejores prácticas y códigos internacionales para desarrollar los requisitos para las técnicas y criterios para realizar inspecciones de equipos estáticos en instalaciones en alta mar.
20	B.  An expert with documented background and experience in damage mechanisms identified in combustible and sour gas lines participated in the development of the criteria for material selection in combustible and sour gas lines.	B. Un experto con antecedentes documentados y experiencia en mecanismos de daños identificados en líneas de gas combustible y ácido participó en el desarrollo de los criterios para la selección de materiales en líneas de gas combustible y ácido.
28	B.  Identification of the key personnel to be notified when tolerance values of bacteria are exceeded.	B. Identificación del personal clave a notificar cuando se superen los valores de tolerancia de las bacterias.
36	B.  That the installations are keeping personnel in the COE, 24 hours to activate the safety systems.	B. Que las instalaciones están manteniendo personal en el COE las 24 horas. para activar los sistemas de seguridad.
44	B.  The requirement exists for abandon platform drills to reinforce that personnel at the accommodation platform use their assigned lifejackets.	B. El requisito existe de que los simulacros de abandono de plataforma refuercen que el personal de la plataforma de alojamiento utilice sus chalecos salvavidas asignados.
52	C.  A requirement is in place for helmsmen to perform the verification of the lifeboat conditions at the beginning of his 14-day shift.	C. Se estableció un requerimiento para que los timoneles realicen la verificación de las condiciones del bote salvavidas al comienzo de su turno de 14 días.
60	C.  PEMEX Norm NRF-028-PEMEX-2010 has been updated or replaced so that all new pressure vessels in critical sour service in offshore installations, shall have the ASME stamp and that all associated documentation shall be provided to PEP.	C. Se ha actualizado o reemplazado la Norma NRF-028-PEMEX-2010 de PEMEX para que todos los nuevos recipientes a presión en servicio crítico amargo en instalaciones costa afuera tengan la estampa ASME y que toda la documentación asociada sea proporcionada a PEP.
68	C.  Results of the evaluation of Functional Safety for SDVs to determine the compliance with the standard NRF-045-PEMEX-2010 or equivalent that includes dynamic simulation of Functional Safety for all offshore facilities.	C. Resultados de la evaluación de la Seguridad Funcional para SDVs para determinar el cumplimiento con la norma NRF-045-PEMEX-2010 o equivalente que incluye simulación dinámica de la Seguridad Funcional para todas las instalaciones costa afuera.
76	C.  That the documentation from the review performed includes a listing of the selected international practices and codes that are recommended to be used to develop the Pemex criteria to perform inspections for static equipment in offshore facilities.	C. Que la documentación de la revisión realizada incluya una lista de las prácticas y códigos internacionales seleccionados que se recomiendan para ser utilizados para desarrollar los criterios de Pemex para realizar inspecciones de equipos estáticos en instalaciones en alta mar.
84	C.  The recommendations from the above evaluation were implemented and dead legs were removed where determine feasible to do so.	C. Se implementaron las recomendaciones de la evaluación anterior y se eliminaron las piernas muertas donde se determinó que era factible hacerlo.
92	D.  A chart is provided and regularly updated to the installations of all the facilities involved in the process center where they belong to be used during emergencies and simulations.	D. Se suministra una gráfica que se actualiza regularmente a las instalaciones de todas las instalaciones involucradas en el centro de proceso en el que pertenecen para ser utilizadas durante emergencias y simulaciones.
100	D.  For vessels that show a lack of heat treatment, determination of remedial actions or deactivation from service have been made.	D. Para los recipientes que demuestren falta de tratamiento térmico, se han tomado medidas correctivas o se ha desactivado del servicio.
108	D.  That simulation drills at selected installations conform to the new emergency communication protocols.	D. Que los ejercicios de simulación en instalaciones seleccionadas se ajusten a los nuevos protocolos de comunicación de emergencia.
116	D.  The above procedure references NRF-043-PEMEX-2014 or equivalent.	D. El procedimiento anterior se refiere a NRF-043-PEMEX-2014 o equivalente.
124	D.  The study included the participation of experts with documented experience in the MIC influenced damage mechanisms	D. El estudio incluyó la participación de expertos con experiencia documentada en los mecanismos de daño influenciados por la MIC
132	E.  Periodic monitoring of corrosion coupons is incorporated into the maintenance plan and budget.	E. El monitoreo periódico de los cupones de corrosión se incorpora en el plan de mantenimiento y presupuesto.
140	E.  That the requirement for changes to the number of installations, number of fire vessels, and/or total capacity of fire vessels prompt a management of change.	E. Que los requerimientos, para cambios en el número de instalaciones, el número de buques contraincendios y/o la capacidad total de los buques contra incendios, produzcan una gestión del cambio.
148	E.  The study included the participation of experts with documented experience in the design and/or selection of control methods.	E. El estudio incluyó la participación de expertos con experiencia documentada en el diseño y / o selección de métodos de control.
156	F.  Modifications were made to address the findings of the above evaluation of emergency lighting requirements.	F. Se realizaron modificaciones para abordar los resultados de la evaluación anterior de los requisitos de iluminación de emergencia.
164	F.  That the operating contexts for combustible gas lines identified as sporadically used has been updated to identify them as such.	F. Que los contextos de funcionamiento de las líneas de gas combustible identificadas como esporádicamente utilizadas se han actualizado para identificarlas como tales.
172	F.  The requirement exists for the provision of a specific lifeboat to be used only by the Strategic URE team.	F. Que exista el requerimiento para la provisión de que un bote salvavidas específico sea utilizado solamente por el equipo Estratégico de URE.
5	5 - The documentation includes guidelines for the long term operational sustainability	5 - La documentación incluye directrices para la sostenibilidad operacional a largo plazo.
2	2 - The implementation program was documented.	2 - Se ha documentado el programa de ejecución.
169	F.  That training plans at the Training Centers (CASES) cover critical scenarios, including tests on lowering lifeboats and navigation tests with the crew.	F. Que los planes de formación de los Centros de Formación (CASES) abarquen escenarios críticos, incluidas pruebas de descenso de botes salvavidas y pruebas de navegación con la tripulación.
177	G.  A schedule for corrosion inhibitor dosage and injection frequency has been developed and documented.	G. Se ha desarrollado y documentado un calendario para la dosificación del inhibidor de la corrosión y la frecuencia de inyección.
185	G.  The documented plan exists for developing better awareness about the prohibition on the use of any non-prescribed sleeping medication or medications that cause drowsiness.	G. Existe el plan documentado para desarrollar una mejor conciencia sobre la prohibición del uso de cualquier medicación para dormir no prescrita o medicamentos que causen somnolencia.
193	H.  Requirements for PEP and contractor specialists who execute non-destructive testing activities include certification to ASNT SNT-TC-1A, Level 1 in the applicable technique.	H. Requisitos para PEP y contratistas especialistas que ejecutan actividades de ensayos no destructivos incluyen certificación a ASNT SNT-TC-1A, Nivel 1 en la técnica aplicable.
201	I.  Analysis was conducted of critical evacuation scenarios to identify strategic places where additional life jacket containers should be placed.	I. Se realizó un análisis de los escenarios críticos de evacuación para identificar lugares estratégicos donde se deben colocar contenedores adicionales de chalecos salvavidas.
209	J.  A program for abandon platform drills closer to critical situations including lifeboat/raft identification, accessing, and boarding, has been established.	J. Se ha establecido un programa para simulacros de abandono de la plataforma más cercano a situaciones críticas, incluyendo la identificación, acceso y embarque de bote salvavidas.
217	K.  The general understanding exists that the use of nausea medication is not to be passed out as needed but rather passed out upon baording.	K. Existe el entindimiento general que el uso de los medicamentos antinausea no se repartira como sea necesario, sino que que se repartira al abordaje. 
225	M.  Analysis was conducted of critical evacuation scenarios to identify strategic places where additional fire blankets should be placed.	M. Se realizó un análisis de los escenarios críticos de evacuación para identificar lugares estratégicos donde se deben colocar mantas cortafuegos adicionales.
10	B.  A procedure to control the personnel access to the process centers arriving from ships has been created.	B. Se ha creado un procedimiento para controlar el acceso de personal, que llegan en los buques, a los centros de proceso.
18	B.  An analysis to determine the appropriate profile to comply with the Helmsmen (first to third Helmsman and alternates) functions, under emergency situations was performed and documented.	B. Se realizó y documentó un análisis para determinar el perfil apropiado para cumplir con las funciones de timonel (primero a tercer timonel y suplentes) en situaciones de emergencia.
26	B.  Guidelines and requirements for personnel performing pre-startup safety review require the review of vessel documentation to verify the inclusion of heat treatment records given to the vessel and that these heat treatments were performed in accordance with ASME BPVC specifications.	B. Las directrices y los requisitos para el personal que realiza la revisión de seguridad antes del arranque requieran la revisión de la documentación del recipiente para verificar la inclusión de los registros de tratamiento térmico dados al recipiente y que estos tratamientos térmicos se realizaron de acuerdo con las especificaciones de la ASME BPVC.
34	B.  That both heads and the body of each vessel identified in the census as critical sour service were determined as normalized or not.	B. Que ambas tapas y el envolvente de cada recipiente identificado en el censo como servicio crítico amargo fueron determinados como normalizados o no.
42	B.  The PEP Technical Standard that updates of replaces Pemex norm NRF-028-PEMEX-2010 for pressure vessel design and construction includes the requirement that any cold formed shell or head should be heat treated for stress relieving in accordance with ASME BPVC Section VIII, Div. 1, Part UCS-56.	B. La Norma Técnica PEP que actualiza o reemplaza la norma Pemex NRF-028-PEMEX-2010 para el diseño y construcción de recipientes a presión incluya el requisito de que cualquier envoltura o tapa conformados en frío debe ser tratado térmicamente para aliviar esfuerzos de acuerdo con ASME BPVC Sección VIII, Div. 1, parte UCS-56.
50	B.  There is a requirement that purchase documents for pressure vessels in critical sour service specifically require the heat treatments (normalization, stress relief and post-welding heat treatment) for the steel used in the fabrication of pressure vessels in critical sour service in offshore installations.	B. Existe el requerimiento de que, los documentos de compra de recipientes a presión en servicio crítico amargo, requieran específicamente los tratamientos térmicos (normalización, alivio de esfuerzo y tratamiento térmico después de la soldadura) para el acero utilizado en la fabricación de recipientes a presión en servicio crítico amargo en instalaciones costa afuera.
58	C.  Modifications were made increase the number of corrosion coupon locations in combustible gas systems at offshore process facilities required.	C. Se realizaron modificaciones para aumentar el número de ubicaciones de cupones de corrosión en los sistemas de gas combustible en las instalaciones requeridas de proceso costa afuera.
66	C.  Requirements for PEP and contractor specialists who execute time based inspection activities include certification in API 510, 570, and 653; and knowledgeable in API 571 and 574, as applicable.	C. Requisitos para PEP y contratistas especialistas que ejecutan actividades de inspección basadas en tiempo incluyen la certificación en API 510, 570 y 653; Y con conocimiento en API 571 y 574, según corresponda.
74	C.  That the analysis accounted for response time and operational logistics to respond to a given facility over the Campeche Sound.	C. Que el análisis tomo en cuenta el tiempo de respuesta y la logística operacional para responder a una instalación dada sobre la Sonda de Campeche.
82	C.  The emergency response plan, for major accident cases, requires that the Strategic URE team are to be the last persons to abandon the process center.	C. El plan de respuesta a emergencias, para casos de accidentes graves, requiere que el equipo de URE Estratégico sea el último en abandonar el centro de proceso.
90	C.  Training at CASES centers include instructions and scenarios that reinforce that personnel remain calm in lifeboats/rafts.	C. La capacitación en los centros de CASES incluye instrucciones y escenarios que refuerzan que el personal permanezca tranquilo en botes/balsas.
98	D.  Applicable purchasing standards include the requirement that all new pressure vessels in critical sour service in offshore installations, shall have the ASME stamp and that all associated documentation shall be provided to PEP.	D. Las normas de compra aplicables incluyen el requisito de que todos los nuevos recipientes a presión en servicio crítico amargo en instalaciones costa afuera deben tener el sello ASME y que toda la documentación asociada debe ser proporcionada a PEP.
106	D.  Shift schedules at all installations should present the full 24hr duty roster no less than two weeks in advance and includes the assignation of authority to activate the safety systems.	D. Los horarios de turno en todas las instalaciones deben presentar la lista completa de turnos de 24 horas con no menos de dos semanas de antelación e incluya la asignación de autoridad para activar los sistemas de seguridad.
114	D.  That the requirements that all active helmsmen comply with the training program for platform lifeboat helmsmen (first to third Helmsman and alternates), which are taught in the CASES are in place.	D. Que se hayan establecido los requerimientos de que todos los timoneles activos cumplan con el programa de entrenamiento para los timoneles de balsas de plataforma (primero y tercer timonel y suplentes), que se enseñan en los CASES.
122	D.  The Strategic URE team is documented and identified.	D. El equipo Estratégico de URE está documentado e identificado.
130	E.  Evaluation was conducted of emergency lighting requirements which considered the possibility of autonomous operation with application of new technologies.	E. Se llevó a cabo una evaluación de los requisitos de iluminación de emergencia que consideró la posibilidad de funcionamiento autónomo con aplicación de nuevas tecnologías.
138	E.  That the analysis report contains the criteria used in determining the appropriate set points of SDVs and locations of their instrumentation.	E. Que el informe de análisis contiene los criterios utilizados en la determinación de las ubicaciones apropiadas para SDVs e instrumentación.
146	E.  The Strategic URE team has been made aware of the requirement to be the last persons to abandon the process center in the event of a major accident.	E. El equipo estratégico de URE ha sido informado del requisito de ser la última persona en abandonar el centro de proceso en caso de un accidente grave.
154	F.  Evidence that abandon platform drills under pressure have been conducted.	F. Evidencia de que se han llevado a cabo simulacros de abandono de la plataforma bajo presión.
3	3 - The implemented action(s) were completed and documented.	3 - Las acciones implementadas han sido completadas y documentadas. 
11	B.  A protocol for simulation drills for applicable installations is in place and includes members of the Emergency Operations Center (COE) and the Regional Attention Emergency Center (CRAE) among all the platforms involved in an emergency.	B. Existe un protocolo para ejercicios de simulación para las instalaciones aplicables e incluye miembros del Centro de Operaciones de Emergencia (COE) y del Centro Regional de Atención de Emergencias (CRAE) entre todas las plataformas involucradas en una emergencia.
19	B.  An evaluation of what are the critical components of the fluid, including levels of tolerances to trace elements and bacterial content, that would influence the selection of components and their fabrication materials, has been made and its documented.	B. Se ha realizado y documentado una evaluación de cuáles son los componentes críticos del fluido, incluyendo los niveles de tolerancia a elementos traza y contenido bacteriano, que influirían en la selección de los componentes y sus materiales de fabricación.
27	B.  Guidelines are in place for the selection of the instrumentation package for sweetening plants.	B. Existen directrices para la selección del paquete de instrumentación para edulcorantes.
35	B.  That PEP documentation for the purchase of actuators includes the requirements for an energy supply (hydraulic or pneumatic) do not depend on a central power source, with the capability to take the SDV to a safe position on loss of power.	B. Que la documentación de PEP para la compra de actuadores incluya los requisitos para un suministro de energía (hidráulico o neumático) que no dependan de una fuente de energía central, con la capacidad de llevar el SDV a una posición segura en caso de pérdida de potencia.
43	B.  The PEP Technical Standard that updates or replaces PEMEX Norm NRF-028-PEMEX-2010 includes the requirement that all new pressure vessels in critical sour service in offshore installations, shall have the ASME stamp and that all associated documentation shall be provided to PEP.	B. La Norma Técnica PEP que actualiza o reemplaza la norma Pemex NRF-028-PEMEX-2010 para el diseño y construcción de recipientes a presión incluya el requisito de que todo recipiente nuevo en servicio critico amargo en instalaciones costa afuera, deberá tener la estampa ASME y que toda documentación asociada deberá ser entregada a PEP. 
51	C.  A protocol for simulation drills of the startup of the selected Emergency Group in offshore facilities for the Trunking System is in place.	C. Se ha implementado un protocolo para simulaciones de la puesta en marcha del Grupo de Emergencia seleccionado en instalaciones costa afuera para el Sistema de Trunking.
59	C.  Modifications were made to address the findings of the above evaluation of evacuation route requirements.	C. Se realizaron modificaciones para atender los resultados de la evaluación anterior de los requisitos de la ruta de evacuación.
67	C.  Requirements that the inspection company include, as part of their inspection plan, a listing of the standards or internationally accepted recommended practices used in determining the inspection techniques to be used in bypass lines and dead legs.	C. Requisitos de que la empresa de inspección incluya, como parte de su plan de inspección, una lista de las normas o prácticas recomendadas internacionalmente aceptadas utilizadas en la determinación de las técnicas de inspección que se utilizarán en las líneas de derivación y las piernas muertas.
75	C.  That the applicable PEP documentation include organizational charts and position descriptions with clear delegation of authority to activate the emergency shutdown system.	C. Que la documentación aplicable de PEP incluye organigramas y descripciones de puestos con delegación de autoridad clara para activar el Sistema de paro de emergencia. 
83	C.  The PEP material selection criteria for combustible gas lines is based on the characterization of damage mechanisms.	C. El criterio de selección de materiales de PEP para líneas de gas combustible se basa en la caracterización de mecanismos de daño.
91	Conformance Criteria	Criterio de Conformidad
99	D.  Documentation generated by the analysis lists the applicable regulations for the selection, operation and instrumentation of SDVs.	D. La documentación generada por el análisis enumera las regulaciones aplicables para la selección, operación e instrumentación de SDVs.
107	D.  That a plan is in place to implement the necessary modifications and/or acquire the necessary vessels to address the findings of the above evaluation of available fire vessels and if their capacity (water volume and jet range) are according to the conditions of a major event and number of facilities over the Campeche Sound.	D. Que se establezca un plan para implementar las modificaciones necesarias y / o adquirir los buques necesarios para hacer frente a los resultados de la evaluación anterior de los buques de incendio disponibles y si su capacidad (volumen de agua y rango de chorro) se ajustan a las condiciones de un evento importante y, el número de instalaciones en la Sonda de Campeche.
115	D.  That there are PEP policies, procedures or requirements that specify an operating strategy for not exceeding the permissible levels of H2S in combustible gas lines.	D. Que existen políticas, procedimientos o requisitos PEP que especifican una estrategia operativa para no exceder los niveles permisibles de H2S en las líneas de gas combustible.
123	D.  The study defined the performance criteria and locations for the installations of automatic flow control valves at applicable offshore facilities in the Campeche Sound.	D. El estudio definió los criterios de desempeño y ubicaciones para la instalación de válvulas automáticas para control de flujo en instalaciones costa afuera en la Sonda de Campeche aplicables.
131	E.  MOC requirements for lines that are sporadically used are in place.	E. Los requisitos de MOC para líneas que se usan esporádicamente están en su lugar.
139	E.  That the reports of inspections carried out after the enactment of the above requirements include sections dedicated to the inspection of bypass lines and dead legs.	E. Que los informes de las inspecciones realizadas después de la promulgación de los requisitos anteriores incluyen secciones dedicadas a la inspección de líneas de bypass y piernas muertas.
147	E.  The Strategic URE team has been made aware of the requirement to be the last persons to abandon the process center in the event of a major accident.	E. El equipo estratégico de URE ha sido informado del requisito de ser la última persona en abandonar el centro de proceso en caso de un accidente grave.
155	F.  MOC were conducted for changes in sporadically used lines and are documented.	F. MOC se llevaron a cabo para los cambios en las líneas utilizadas esporádicamente y se documentan.
163	F.  That the automatic flow control valves, or other process modifications, have been installed at installations identified by the study.	F. Que las válvulas automáticas para control de flujo han sido instaladas en instalaciones identificadas por el estudio. 
13	B.  A study by PEP or its subcontractors, to identify type, sources and effects of bacteria, and designate a tolerance value for bacteria (in terms of bacteria type, level, and exposure duration) in combustible gas systems, at offshore facilities in the Campeche Sound, was performed and documented.	B. Un estudio realizado por PEP o sus subcontratistas para identificar el tipo, las fuentes y los efectos de las bacterias y designar un valor de tolerancia para las bacterias (en términos de tipo de bacteria, nivel y duración de la exposición) de la Bahía de Campeche, se realizó y documentó.
21	B.  Analysis was conducted of critical evacuation scenarios to identify if additional evacuation routes should be installed.	B. Se realizó un análisis de los escenarios críticos de evacuación para identificar si se deben instalar rutas de evacuación adicionales.
29	B.  NRF-152-PEMEX-2013 or equivalent has been updated or replaced by a Technical Standard to include new types of actuators that are more resistance to fire and thermic radiation effects.	B. NRF-152-PEMEX-2013 o equivalente ha sido actualizado o reemplazado por una Norma Técnica para incluir nuevos tipos de actuadores que son más resistentes al fuego y efectos de radiación térmica.
37	B.  The criteria for the identification used in the census included the factors or age, service, pressure and consequence of failure.	B. Los criterios para la identificación utilizados en el censo incluyeron los factores como la edad, el servicio, la presión y la consecuencia de falla.
45	B.  The requirement exists for lifeboats/rafts to be stocked with medicine to prevent nausea.	B. Existe el requerimiento de que los botes salvavidas/balsas sean abastecidos con medicamentos para prevenir las náuseas.
53	C.  A study by PEP or its subcontractors, to evaluate the installation of automatic flow control valves, defining where these are required, at offshore facilities in the Campeche Sound, was performed and documented.	C. Se realizó y documento un estudio por PEP o sus subcontratistas, para evaluar la instalación de válvulas automáticas para control de flujo, definiendo en donde son requeridas, en instalaciones costa afuera en la Sonda de Campeche.
61	C.  PEMEX Norm NRF-028-PEMEX-2010 has been updated or replaced to include the requirement that any cold formed shell or head should be heat treated for stress relieving in accordance with ASME BPVC Section VIII, Div. 1, Part UCS-56.	C. Se ha actualizado o reemplazado la Norma NRF-028-PEMEX-2010 de PEMEX para incluir el requisito de que cualquier envoltura o tapa formada en frío debe ser tratado térmicamente para aliviar esfuerzos de acuerdo con ASME BPVC Sección VIII, Div. 1, parte UCS-56.
69	C.  Tests have been carried out in vessels identified in the census as critical sour service to determine proper heat treatments, per the Guia de Campo: Verificación de Normalización y Tratamiento Termico de Tapas de Recipientes a Presión.	C. Se han llevado a cabo pruebas en recipientes identificados en el censo como servicio crítico amargo para determinar los tratamientos térmicos adecuados, de acuerdo con la Guía de Campo: Verificación de Normalización y Tratamiento Térmico de Tapas de Recipientes a Presión.
77	C.  That the frequency at which facilities must go through total and partial shutdowns according to the Safety Integrity Level (SIL) of the SDVs has been established.	C. Que se ha establecido la frecuencia con la que las instalaciones deben ejecutar paradas totales y parciales de acuerdo con el Nivel de Integridad de Seguridad (SIL) de las SDV.
85	C.  The requirement exists for medicine to prevent nausea to be distributed to personnel at the time of boarding.	C. Existe el requerimiento de que la medicina prevenga que las náuseas se distribuyan al personal en el momento del embarque.
93	D.  A documented protocol on actions to be executed when a notification arrives depending on the type, level and duration of exceedance.	D. Un protocolo documentado sobre las acciones a ejecutar cuando llega una notificación, dependiendo del tipo, nivel y duración de la superación.
101	D.  Installation of additional evacuation routes, where identified in above analysis, was completed and that these routes are identified in emergency response plans and diagrams.	D. Se completó la instalación de rutas de evacuación adicionales, donde se identificaron en el análisis anterior, y que estas rutas son identificadas en los planes y diagramas de respuesta a emergencias.
109	D.  That simulation drills include surprise drills to test communication between the URE and CRAE.	D. Los ejercicios de simulación incluyen simulacros sorpresa para probar la comunicación entre la URE y el CRAE.
117	D.  The assignment of the person, position, or role responsible for the distribution of medicine to prevent nausea at the time of boarding is made.	D. La asignación de la persona, cargo o función responsable de la distribución de la medicina para prevenir las náuseas en el momento del embarque fue realizada.
125	D.  There is a documented technical basis for the instrumentation and medical personnel which are required to accompany ambulance helicopters when responding to medical emergencies.	D. Existe una base técnica documentada para la instrumentación y personal médico que se requieren para acompañar a los helicópteros de ambulancia cuando responden a emergencias médicas.
133	E.  Requirements for PEP and contractor specialists who supervise mechanical integrity activities include being knowledgeable in API 570, 571, 510, 574, 580, 581, and 653.	E. Requisitos para PEP y contratistas especialistas que supervisan las actividades de integridad mecánica incluyen estar bien informados en API 570, 571, 510, 574, 580, 581 y 653.
141	E.  That the strategy in PEP policies, procedures or requirements includes criteria for determining operating limits in elements susceptible to the damage mechanisms associated with H2S.	E. Que la estrategia en las políticas, procedimientos o requisitos PEP incluye criterios para determinar los límites operativos en elementos susceptibles a los mecanismos de daño asociados con H2S.
149	E.  The study included the participation of experts with documented experience in the operative policies and systems by PEP.	E. El estudio incluyo la participación de expertos con experiencia documentada en las políticas operativas y sistemas por PEP.
157	F.  Modifications were made to designate a tolerance level of bacteria in combustible gas systems to address the findings of the above study.	F. Se realizaron modificaciones para designar un nivel de tolerancia de bacterias en sistemas de gas combustible para abordar los hallazgos del estudio anterior.
165	F.  That the reports of inspections, carried out after the enactment of the above requirements, include a listing of the bypass lines and dead legs identified by the installation for inspection.	F. Que los informes de inspecciones, realizados después de la promulgación de los requisitos mencionados previamente, incluyan una lista de las líneas de bypass y las piernas muertas identificadas por la instalación para su inspección.
7	7 - A requirement is in place to prompt a management of change evaluation for any future modifications to the portion(s) of the documentation that are associated with the implemented action(s).	7 - Se dispone de un requisito para solicitar una evaluación de la gestión del cambio para cualquier modificación futura de la parte o partes de la documentación asociada con la(s) acción(es) implementada(s).
15	B.  A study to determine the operating limits of H2S was performed.	B. Se realizó un estudio para determinar los límites operativos de H2S.
23	B.  Criteria for sporadically used lines is documented.	B. Criterios para las líneas utilizadas esporádicamente están documentados.
31	B.  PEP policies, procedures, and requirements include language that prohibits the use of manual valves for flow control at all offshore installations in the Sound of Campeche.	B. Las Políticas, procedimientos, y requerimientos de PEP deben  incluir instrucciones que prohiban el uso de válvulas manuales para el control del flujo en todas las instalaciones costa afuera en la Sonda de Campeche.
39	B.  The operational emergency shutdown procedure includes communication protocol with all facilities involved in a process center based on the most recent operational context.	B. El procedimiento operativo para cierre de emergencia incluya un protocolo de comunicación con todas las instalaciones involucradas en un centro de proceso basado en el contexto operativo más reciente.
47	B.  The requirement for the response plans to include the provision of psychological treatment for evacuated personnel arriving from a major accident.	B. El requerimiento de que los planes de respuesta incluyan la provisión de tratamiento psicológico para los personales evacuados que llegan de un accidente mayor.
55	C.  Guidance on the information that should be included in the notification.	C. Orientación sobre la información que debe incluirse en la notificación.
63	C.  Process risk analysis team rosters included a certified corrosion expert.	C. Las listas de los equipos de análisis de riesgos del proceso incluyeron un experto certificado en corrosión.
71	C.  That an analysis on the feasibility of applying these selected designs in SDVs of the ESD system at inlets/outlets of the existing platforms and new projects (according to NRF-045-PEMEX-2010 and NRF-152-PEMEX-2013 or equivalent), was performed and documented.	C. Se realizó y documentó un análisis sobre la viabilidad de aplicar estos diseños seleccionados en SDVs del sistema ESD en las entradas/salidas de las plataformas y nuevos proyectos (según NRF-045-PEMEX-2010 y NRF-152-PEMEX-2013 o equivalente).
79	C.  That the requirements for selection of helmsmen are updated to reflect the results of the analysis.	C. Que los requisitos para la selección de timoneros se actualicen para reflejar los resultados del análisis.
87	C.  The study included the participation of experts with documented experience in corrosion and other damage mechanisms associated with H2S.	C. El estudio incluyó la participación de expertos con experiencia documentada en corrosión y otros mecanismos de daño asociados con el H2S.
95	D.  A program for abandon platform drills under pressure has been established.	D. Se ha establecido un programa para simulacros de abandono de la plataforma bajo presión.
103	D.  Requirements for PEP and contractor specialists who plan mechanical integrity activities include being knowledgeable in API 570, 571, 510, 574, 580, 581, and 653.	D. Requisitos para PEP y especialistas en contratistas que planifican actividades de integridad mecánica incluyen estar bien informados en API 570, 571, 510, 574, 580, 581 y 653.
111	D.  That the installed monitored system captures and maintains instant and cumulative data from the readings of H2S at the outlets of the sweetening plant.	D. Que el sistema monitoreado instalado captura y mantiene datos instantáneos y acumulativos de las lecturas de H2S en las salidas de la planta edulcorante.
119	D.  The determination of appropriate corrosion inhibitors was performed and documented.	D. Se realizó y documentó la determinación de inhibidores de corrosión apropiados.
127	E.  A requirement is in place to perform periodic navigations tests of lifeboats.	E. Se ha establecido un requisito para realizar pruebas periódicas de navegación de botes salvavidas.
135	E.  That evaluations of vessels showing lack of heat treatment were made with the participation of subject matter experts.	E. Que las evaluaciones de recipientes que muestran falta de tratamiento térmico se realizaron con la participación de expertos en la materia.
143	E.  The above determination included the participation of a specialist in corrosion with experience with corrosion inhibitors.	E. La determinación anterior incluyó la participación de un especialista en corrosión con experiencia con inhibidores de corrosión.
151	E.  Training material on lifeboat/raft use and boarding includes a discussion on the distribution of medicine to prevent nausea at the time of boarding.	E. El material de capacitación sobre el uso del bote salvavidas/balsa incluye una discusión sobre la distribución de medicamentos para prevenir las náuseas en el momento del embarque.
159	F.  Personnel access control procedure for arrivals from ships has been implemented for 24 hour control.	F. El procedimiento de control de acceso de personal para las llegadas de buques se ha implementado para un control de 24 horas.
167	F.  That the requirements for purchase documents include a section with the characterization of the fluid to be handled as part of the information to the vendor.	F. Que los requerimientos para los documentos de compra incluyan una sección con la caracterización del fluido a ser manejado como parte de la información al proveedor.
175	G.  A monitoring system is in place that will track the type and levels of bacteria and communicate exceedance of tolerable values so that control methods may be implemented to address deviations.	G. Existe un sistema de monitoreo que rastreará el tipo y los niveles de bacterias y comunicará la superación de valores tolerables para que los métodos de control puedan implementarse para abordar las desviaciones.
183	G.  That the reports of inspections, carried out after the enactment of the above requirements, include a listing of the methods and procedures used in the inspection of bypass lines and dead legs including locations where readings were taken and the data from the measurements.	G. Que los informes de inspecciones, realizados después de la promulgación de los requisitos anteriores, incluyan una lista de los métodos y procedimientos usados ??en la inspección de líneas de bypass y piernas muertas, incluyendo los lugares donde se tomaron lecturas y los datos de las mediciones.
191	H.  Manual valves, which were being used to control flow, have been either closed, opened, removed, or replaced, as recommended by the study.	H. Que las valvulas manuales, previamente que hayan sido cerradas, abiertas o removidas según los resultados del estudio
180	G.  Requirements for PEP and contractor specialists who supervise non-destructive testing activities include either certification in API 510, 570, and 653, as applicable; or certification to ASNT SNT-TC-1A, Level 2 in the applicable technique and knowledgeable in API 510, 570, and 653, as applicable.	G. Requisitos para PEP y contratistas especialistas que supervisan actividades de ensayos no destructivos incluyen certificación en API 510, 570 y 653, según corresponda; O certificación a ASNT SNT-TC-1A, Nivel 2 en la técnica aplicable y con conocimientos en API 510, 570 y 653, según corresponda.
188	G.  The response plan includes methods to contact and mobilize an ambulance helicopter in the event of an emergency situation.	G. El plan de respuesta incluye métodos para contactar y movilizar un helicóptero de ambulancia en caso de una situación de emergencia.
196	H.  The lifeboat for the Strategic URE team is identified in the emergency response plan.	H. El bote salvavidas del equipo Estratégico de URE se identifica en el plan de respuesta de emergencia.
204	I.  Periodic of evaluations of sweetening plant performance were conducted.	I. Se realizaron evaluaciones periódicas del rendimiento de la planta endulzante.
212	J.  The general understanding exists that personnel should use the lifejackets from their assigned room in case of an emergency.	\N
220	K.b.  If optimization has been implemented at the installation, then review applicable documentation to verify "a and b" below:  (b) The optimization, as implemented, has a track record of reducing the possibility of exceeding sweetening plant H2S permissible limits.	K.b. Si se ha implementado la optimización en la instalación, revise la documentación aplicable para verificar "a y b" a continuación: (b) La optimización, tal como se implementa, tiene un historial de reducción de la posibilidad de superar los límites permisibles de H2S de la planta endulzante.
228	None	Ninguno
6	6 - The documentation includes guidelines for the long term financial sustainability.	6 - La documentación incluye directrices para la sostenibilidad financiera a largo plazo.
14	B.  A study to determine the feasibility of having available helicopters for night shifts in strategic offshore facilities to provide a quick emergency response including medical emergencies has been conducted.	B. Se ha llevado a cabo un estudio para determinar la factibilidad de contar con helicópteros disponibles para los turnos nocturnos en las instalaciones estratégicas costa afuera para proporcionar una respuesta rápida de emergencia, incluyendo emergencias médicas.
22	B.  Analysis was conducted of determine if the available fire vessels and their capacity (water volume and jet range) are according to the conditions of a major event and number of facilities over the Campeche Sound.	B. Se realizó un análisis para determinar si las embarcaciones de incendios disponibles y su capacidad (volumen de agua y rango de chorro) son de acuerdo con las condiciones de un evento mayor y número de instalaciones en la Sonda de Campeche.
30	B.  PEP policies, procedures, and requirements have been updated with new requirements for the development of maintenance plans for SDV's.	B. Las políticas, procedimientos y requisitos del PEP se han actualizado con nuevos requisitos para el desarrollo de planes de mantenimiento para SDV.
38	B.  The criteria which defines the contracting basis for third parties includes sea survival training which enforces that the personnel who board lifeboats/rafts stay calm and use different ways to help individuals in the water during critical situations.	B. Los criterios que definen la base de contratación para terceros incluyen entrenamiento de supervivencia marina que hace que el personal que suba a botes o balsas permanezca tranquilo y use diferentes maneras de ayudar a las personas en el agua durante situaciones críticas.
46	B.  The requirement exists for the Emergency Response Plan, for major accident cases, to designate that the Strategic URE team are to be the last persons to abandon the process center.	B. Existe el requisito de que el Plan de Respuesta a Emergencias, para casos de accidentes graves, designe que el equipo de URE Estratégico debe ser la última persona en abandonar el centro de proceso.
54	C.  Abandon platform drills include communication to reinforce that personnel at the accommodation platform should use their assigned lifejackets.	C. Los simulacros de abandono de la plataforma incluyen la comunicación para reforzar que el personal en la plataforma de alojamiento debe usar sus chalecos salvavidas asignados.
62	C.  PEMEX Norm NRF-028-PEMEX-2010 has been updated or replaced to include the requirement that steel used in the design of pressure vessels for critical sour service in offshore facilities is normalized.	C. PEMEX Norma NRF-028-PEMEX-2010 ha sido actualizada o reemplazada para incluir el requisito de que el acero utilizado en el diseño de recipientes a presión para el servicio crítico agrio en instalaciones costa afuera sea normalizado.
70	C.  That a real-time monitoring system, to measure the levels of H2S in the combustible gas composition at the outlets of the sweetening, is installed.	C. Que se instale un sistema de monitoreo en tiempo real, para medir los niveles de H2S en la composición de gases combustibles en las salidas del edulcorante.
78	C.  That the operational emergency shutdown procedure requires installations have a periodic simulation program to test communication with all facilities involved in a process center based on the most recent operational context periodically. 	C. Que el procedimiento operativo de parada de emergencia requiera que las instalaciones tengan un programa de simulación periódica para comprobar la comunicación con todas las instalaciones involucradas en un centro de proceso basado en el contexto operativo más reciente. 
86	C.  The response plan includes the provision of psychological treatment for evacuated personnel arriving from a major accident.	C. El plan de respuesta incluye la provisión de tratamiento psicológico para el personal evacuado que llega de un accidente mayor.
94	D.  A formal procedure that requires the approval of engineering, construction and maintenance personnel prior to generating the purchase documents for SDV's and valves.	D. Un procedimiento formal que requiere la aprobación de ingeniería, construcción y mantenimiento Personal antes de generar los documentos de compra de SDV y válvulas.
102	D.  Requirements for monitoring of lines are in place to trigger the assessment.	D. Los requisitos para el monitoreo de líneas están establecidos para activar la evaluación.
110	D.  That the frequency at which SDV's need to be fully tested for operation and air tightness in accordance with NRF-045-PEMEX-2010 (or equivalent), IEC 61511, ISA-TR84.00.02 has been established.	D. Que se ha establecido la frecuencia con la que se debe probar completamente el funcionamiento y la hermeticidad de los SDV según NRF-045-PEMEX-2010 (o equivalente), IEC 61511, ISA-TR84.00.02.
118	D.  The census includes a tabulation of the following vessel data: designator, installation, general design information, summarized inspection results, and determination of critical sour service.	D. El censo incluye una tabulación de los siguientes datos del recipiente: designo, instalación, información general de diseño, resultados de inspección resumidos y determinación del servicio crítico amargo.
126	D.  Training at CASES centers include instructions and scenarios that reinforce diverse ways to help personnel in the water during critical situations.	D. La capacitación en los centros CASES incluye instrucciones y escenarios que refuerzan diversas maneras de ayudar al personal en el agua durante situaciones críticas.
134	E.  That a replacement policy for SDV's based on their useful life and PEP acceptance of failure risk and consequence has been established and documented.	E. Que se ha establecido y documentado una política de reemplazo para SDV basada en su vida útil y aceptación de PEP del riesgo de falla y consecuencia.
142	E.  That the technical specification P.9.0320.1:2015 (or equivalent) was updated or replaced, based on the criteria developed, to improve the detection of damage mechanisms associated with the combination of MIC and H2S.	E. Que la especificación técnica P.9.0320.1: 2015 (o equivalente) fue actualizada o sustituida, sobre la base de los criterios desarrollados, para mejorar la detección de mecanismos de daño asociados con la combinación de MIC y H2S.
150	E.  The technical basis above included the consideration of worst case scenarios to offshore installations.	E. La base técnica anterior incluía la consideración de los escenarios de peor caso para las instalaciones costa afuera.
158	F.  Periodic maintenance of corrosion coupon fitting and holder, and the periodic replacement of corrosion coupons is incorporated into the maintenance plan and budget.	F. El mantenimiento periódico del accesorio y soporte del cupón de corrosión y la sustitución periódica de los cupones de corrosión se incorporan en el plan de mantenimiento y en el presupuesto.
8	B.  A census that identifies lines of the combustible gas system, on process facilities offshore, operating sporadically was carried out and documented.	B. Se realizó y documentó un censo que identifica líneas del sistema de gas combustible, en instalaciones de proceso en alta mar, que operan esporádicamente.
16	B.  Actions to implement Recommendation REC B.3 have been completed.	B. Se han completado las acciones para implementar la recomendación REC B.3.
24	B.  Documented technical basis on the chosen location for adding corrosion coupons on the installation.	B. Bases técnicas documentadas en la ubicación elegida para añadir cupones de corrosión en la instalación.
32	B.  Requirements for PEP and contractor specialists who plan or supervise time-based inspection activities include being knowledgeable in API 510, 570, 571, 574, and 653.	B. Requisitos para PEP y especialistas en contratistas que planifican o supervisan actividades de inspección basadas en el tiempo incluyen estar bien informados en API 510, 570, 571, 574 y 653.
40	B.  The operational feasibility evaluation of the removal of unnecessary dead legs was performed and documented. 	B. Se realizó y documentó la evaluación de factibilidad operacional de la eliminación de piernas muertas innecesarias.
48	B.  The requirements exist that the survival training of Pemex personnel must include courses and simulations that reinforce remaining calm in lifeboats/rafts and provide practice and familiarization on diverse ways to assist personnel at peril in the water.	B. Los requisitos existen que el entrenamiento de supervivencia de personal de Pemex debe incluir cursos y simulaciones que refuerzan mantener la calma en botes/balsas y proporcionen práctica y familiarización en diversas formas de asistir a personal en el agua en peligro.
56	C.  Guidelines and requirements for personnel performing pre-startup safety review, to look for and review the information in the ASME stamp for critical sour service vessels and compare to the purchase documents for the vessel to verify that vessel matches the stamp.	C. Directrices y requisitos para la Revisión personal de seguridad antes de la puesta en marcha, para buscar y revisar la información en la estampa ASME para los recipientes en servicio crítico amargo y comparar con los documentos de compra para verificar que el recipiente coincide con la estampa.
64	C.  Require that, prior to issuing a purchase orders for SDV's and other valves, a characterization test of the fluid to be handled by these components has been made.	C. Requerir que, antes de emitir órdenes de compra para SDV y otras válvulas, se haya realizado una prueba de caracterización del fluido a ser manejado por estos componentes.
72	C.  That documentation shows that all offshore installations in the sound of Campeche were included in the census and that it identified locations where vessels were identified and where none exist.	C. Que la documentación muestra que todas las instalaciones costa afuera en la Sonda de Campeche fueron incluidas en el censo y que identificó los lugares donde fueron identificados los recipientes y donde no existe ninguno.
80	C.  The above procedure requires 24 hour personnel control.	C. El procedimiento anterior requiere control de personal las 24 horas.
88	C.  The study included the participation of experts with documented experience in the operative policies and systems by PEP.	C. El estudio incluyó la participación de expertos con experiencia documentada en las políticas y sistemas operativos de PEP.
96	D.  Additional corrosion coupons have been installed, where identified in the above technical basis, was completed.	D. Se han instalado cupones de corrosión adicionales, donde se identificaron en la base técnica anterior, se completó.
104	D.  Requirements that the inspection company includes, as part of the inspection plan, a listing of the methods proposed for the inspection of the bypass lines and dead legs.	D. Requisitos de que la empresa de inspección incluya, como parte del plan de inspección, una lista de los métodos propuestos para la inspección de las líneas de bypass y de las piernas muertas.
112	D.  That the operating and maintenance guidelines require that sporadic use lines, in the combustible gas system, are appropriately marked/flagged at all the installations.	D. Que las directrices de operación y mantenimiento requieren que las líneas de uso esporádico, en el sistema de gas combustible, estén debidamente marcadas / señalizadas en todas las instalaciones.
120	D.  The documented experience of the certified corrosion expert includes the identification of and consequent damage from MIC and other common damage mechanisms in the offshore facilities.	D. La experiencia documentada del experto certificado en corrosión incluye la identificación y el daño consiguiente del MIC y otros mecanismos de daños comunes en las instalaciones offshore.
128	E.  A requirement that engineering, construction and maintenance personnel review the results of the characterization of the fluid at the location where a new SDV or valve is to be installed prior to approving the purchase of such SDV or valve.	E. Requisito de que el personal de ingeniería, construcción y mantenimiento revisen los resultados de la caracterización del fluido en el lugar donde se instalará un nuevo SDV o válvula antes de aprobar la compra de dicho SDV o válvula.
136	E.  That requirements that COE members are trained as platform lifeboat helmsmen are in place. 	E. Que se hayan establecido los requerimientos de que los miembros de COE estén entrenados como timoneles de bote salvavidas plataforma. 
144	E.  The above procedure has been communicated to all process centers.	E. El procedimiento anterior se ha comunicado a todos los centros de proceso.
152	E. Pressure vessels which have been aquired to replace the vessels lost in the accidents have an ASME stamp and all associated documentation.	\N
160	F.  Requirements for PEP and contractor specialists who plan or supervise RBI for static equipment activities include certification in API 580 and knowledgeable in API 510, 570, 571, 574, 581, and 653.	F. Requisitos para PEP y contratistas especialistas que planifican o supervisan RBI para actividades de equipos estáticos incluyen certificación en API 580 y conocimientos en API 510, 570, 571, 574, 581 y 653.
168	F.  That the technical specification P.9.0320.1:2015 (or equivalent) was updated or replaced, based on the criteria developed, to include considerations on special conditions of the process such as dead legs and other situations that can contribute to damage mechanisms becoming more aggressive.	F. Que la especificación técnica P.9.0320.1: 2015 (o equivalente) fue actualizada o sustituida, sobre la base de los criterios desarrollados, para incluir consideraciones sobre condiciones especiales del proceso tales como piernas muertas y otras situaciones que pueden contribuir a mecanismos de daño cada vez más agresivo.
162	F.  Review the professional background of the individual supervising the analysis for the installation and/or the individual performing the analysis to determine appropriate experience and expertise.	F. Revisar los antecedentes profesionales del individuo que supervisa el análisis para la instalación y/o la persona que realiza el análisis para determinar la experiencia y la experiencia apropiadas.
170	F.  The lifeboats/rafts are stocked with medicine to prevent nausea.	F. Los botes salvavidas/balsas son abastecidos con medicamentos para prevenir las náuseas.
178	G.  Evidence that the evaluation of possible optimization methods was conducted with the participation of experts in sweetening processes.	G. Evidencia de que la evaluación de los posibles métodos de optimización se realizó con la participación de expertos en procesos de edulcoración.
186	G.  The general understanding exists on identifying sporadically used lines & deadlegs and that if process changes result in the above, an MOC is required.	\N
194	H.  SDVs and associated instrumentation are operating at the appropriate set points for the SDVs and locations of their instrumentation.	H. SDVs e instrumentos asociados están operando en las ubicaciones apropiadas como de determino en el análisis.
202	I.  Efforts to communicate awareness of the prohibited medications have been implemented.	I. Se han implementado esfuerzos para comunicar la conciencia de los medicamentos prohibidos.
210	J.  If optimization methods were not implemented, evaluation of alternative mitigation methods was documented.	J. Si no se implementaron métodos de optimización, se documentó la evaluación de métodos alternativos de mitigación.
218	K.  The requirement exists that a defined portion of the abandon platform drills be conducted closer to critical situations including lifeboat/raft identification, accessing, and boarding.	K. Existe el requerimiento de que una parte definida de los simulacros de abandono de la plataforma se lleve a cabo más cerca de situaciones críticas, incluyendo la identificación del bote salvavidas / balsa, el acceso y el embarque.
226	M.  Analysis was conducted of critical evacuation scenarios to identify strategic places where additional fire blankets should be placed.	M. Se realizó un análisis de los escenarios críticos de evacuación para identificar lugares estratégicos donde se deben colocar mantas ignifugas adicionales.
171	F.  The recommendations from the above determination were implemented and corrosion inhibitor injection equipment was added to combustible gas system.	F. Se implementaron las recomendaciones de la determinación anterior y se añadió equipo de inyección de inhibidores de corrosión al sistema de gas combustible.
179	G.  Installation of new emergency lighting, as required by above policies, procedures, and requirements was completed.	G. Se completó la instalación de nueva iluminación de emergencia, según lo requerido por las políticas, procedimientos y requisitos anteriores.
187	G.  The general understanding exists that the use of manual values for the regulation of flow should be avoided.	G. Que existe el entendimiento general de que se debe evitar el uso de válvulas manuales para la regulación del flujo.
195	H.  That the requirements for maintenance of SDV's include vendor recommended maintenance, for the specific models of SDV installed, for proper function of the internal elements of the SDV's.	H. Que los requisitos para el mantenimiento de SDV incluyen mantenimiento recomendado por el proveedor, para los modelos específicos de SDV instalados, para el correcto funcionamiento de los elementos internos de los SDV.
203	I.  Evidence that abandon platform drills which cover similar situations to the Permanente accident have been conducted.	I. Evidencia de que se han realizado simulacros de abandono de la plataforma que cubren situaciones similares al accidente Permanente.
211	J.  Modifications were made to address the findings of the above analysis of life jacket container requirements.	J. Se realizaron modificaciones para abordar las conclusiones del análisis anterior de los requisitos de contenedores de chalecos salvavidas.
219	K.a.  If optimization has been implemented at the installation, then review applicable documentation to verify "a and b" below:  (a) The technical basis for the optimization that determines that the mitigation is designed to reduce the possibility of exceeding sweetening plant H2S permissible limits.	K.a. Si se ha implementado la optimización en la instalación, revise la documentación aplicable para verificar "a y b" a continuación: (a) La base técnica para la optimización que determina que la mitigación está diseñada para reducir la posibilidad de superar los límites permisibles de H2S de la planta endulzante.
227	N.  Modifications were made to address the findings of the above evaluation of fire blanket requirements.	N. Se realizaron modificaciones para abordar los resultados de la evaluación anterior de los requisitos de manta ignifuga.
173	F.  The requirement for the response plans to include methods to contact and mobilize an ambulance helicopter in the event of an emergency situation.	F. El requerimiento de que los planes de respuesta incluyan métodos para contactar y movilizar un helicóptero de ambulancia en caso de una situación de emergencia.
181	G.  That requirements are in place to require that inspection plans include considerations to detailed inspections of sporadically used lines, as recommended by appropriate standards or international guidelines.	G. Que se requieren requisitos para exigir que los planes de inspección incluyan consideraciones a inspecciones detalladas de líneas usadas esporádicamente, como lo recomiendan las normas apropiadas o las directrices internacionales.
189	H.  A control method is in place to prevent levels of bacteria from exceeding tolerable levels.	H. Se ha establecido un método de control para evitar que los niveles de bacterias excedan los niveles tolerables.
197	H.  The plan above is intended to increase the awareness of all personnel who work at PEP installations.	H. El plan anterior tiene como objetivo aumentar la concienciación de todo el personal que trabaja en instalaciones PEP.
205	I.  That if no vendor instructions are provided, requirements for maintenance include PEP's policies for the mitigation of the deterioration of internal components for the SDV.	I. Que si no se proporcionan instrucciones del proveedor, los requisitos de mantenimiento incluyen las políticas de PEP para la mitigación del deterioro de los componentes internos para el SDV.
213	J.  The general understanding exists that the use of non-prescribed sleeping medication or medications that cause drowsiness is prohibited.	J. Existe la comprensión general de que el uso de medicación para dormir no prescrita o medicamentos que causan somnolencia está prohibido.
221	L.  Evidence that abandon platform drills closer to critical situations including lifeboat/raft identification, accessing, and boarding have been conducted.	L. Evidencia de que se han realizado simulacros de abandono de la plataforma que se aproximan a situaciones críticas como la identificación, acceso y embarque de bote salvavidas.
229	O.  Installation of additional fire blanket containers, where identified in above analysis, were completed and stocked, and that these containers are identified in emergency response plans and diagrams.	O. Se completó la instalación de contenedores adicionales para manta ignifuga y se abastecieron, en los lugares que se identificaron en el análisis anterior, y que estos contenedores se identifican en los planes y diagramas de respuesta a emergencias.
199	H.  The requirement for periodic review of the effects of corrosion inhibitors on dead legs is in place.	H. El requisito de revisión periódica de los efectos de los inhibidores de corrosión en las piernas muertas está en su lugar.
207	I.  The analysis included a risk evaluation of possible effects of the operation of manual valves downstream (partially open); in addition to a discussion of the scenarios that may inhibit the performance of the actuators of the emergency valves (e.g., fire and explosions that could impact the hydraulic and pneumatic functions).	I. El análisis incluyó una evaluación del riesgo de los posibles efectos de la operación de válvulas manuales aguas abajo (parcialmente abiertas); además de una discusión de los escenarios que pueden inhibir el funcionamiento de los actuadores de las válvulas de emergencia (por ejemplo, fuego y explosiones que podrían afectar las funciones hidráulicas y neumáticas).
215	K.  A strategy to prevent the unauthorized use of the lifeboat for the Strategic URE team during a major accident has been implemented.	K. Se ha implementado una estrategia para prevenir el uso no autorizado del bote salvavidas para el equipo Estratégico de URE durante un accidente grave.
223	L.  The Strategic URE team has been made aware of the lifeboat provided for their exclusive use.	L. El equipo Estratégico de URE ha sido informado del bote salvavidas proporcionado para su uso exclusivo.
231	Q.  For installations where fire blankets have been added, where there were one before, Incorporate into training material the use of fire blankets.	Q. Para las instalaciones donde se han añadido mantas ignifugas, donde no había una antes, incorporar en el material de capacitación el uso de mantas conrafuegos.
166	F.  That the requirements for maintenance plans of SDV's at inlets and outlets of the facilities include total and partial shutdown of the facilities based on the Safety Integrity Level (SIL) of the SDVs have been established and documented.	F. Que los requisitos para los planes de mantenimiento de SDV en las entradas y salidas de las instalaciones incluyen el cierre total y parcial de las instalaciones basadas en el Nivel de Integridad de Seguridad (SIL) de las SDVs se han establecido y documentado.
174	G.  A lifeboat to be used exclusively by the Strategic URE Team has been installed.	G. Se ha instalado un bote salvavidas para ser utilizado exclusivamente por el Equipo Estratégico de URE.
182	G.  That requirements for the frequency of maintenance activities of SDV's including full testing of SDVs for operation, air tightness in accordance with NRF-045-PEMEX-2010 (or equivalent), IEC 61511, ISA-TR84.00.02 has been established and documented.	G. Se han establecido y documentado los requisitos para la frecuencia de las actividades de mantenimiento de SDV, incluyendo las pruebas completas de SDV para operación, hermeticidad de acuerdo con NRF-045-PEMEX-2010 (o equivalente), IEC 61511, ISA-TR84.00.02.
190	H.  Evidence that a feasibility evaluation was conducted for the methods of optimization.	H. Evidencia de que se realizó una evaluación de factibilidad para los métodos de optimización.
198	H.  The requirement exists that a defined portion of the abandon platform drills be conducted to cover similar situations to the Permanente accident.	H. Existe el requerimiento de que una parte definida de los simulacros de abandono de la plataforma se lleve a cabo para cubrir situaciones similares al accidente Permanente.
206	I.  The analysis included a risk evaluation of possible effects of the operation of manual valves downstream (partially open); in addition to a discussion of the scenarios that may inhibit the performance of the actuators of the emergency valves (e.g., fire and explosions that could impact the hydraulic and pneumatic functions).	I. El análisis incluyó una evaluación del riesgo de los posibles efectos de la operación de válvulas manuales aguas abajo (parcialmente abiertas); además de una discusión de los escenarios que pueden inhibir el funcionamiento de los actuadores de las válvulas de emergencia (por ejemplo, fuego y explosiones que podrían afectar las funciones hidráulicas y neumáticas).
214	J.  The lifeboat for the Strategic URE team is clearly identified in the field.	J. El bote salvavidas del equipo Estratégico de URE se identifica claramente en el campo.
222	L.  Periodic checking and restocking of new life jacket containers is incorporated into the safety check plan and budget.	L. El control periódico y el reabastecimiento de los nuevos contenedores de chalecos salvavidas se incorpora en el plan de verificación de seguridad y presupuesto.
230	P.  Periodic checking and restocking of fire blanket containers is incorporated into the safety check plan and budget.	P. El control periódico y el reabastecimiento de los contenedores de mantas ignifugas se incorpora en el plan de verificación de seguridad y en el presupuesto.
176	G.  A program for abandon platform drills to cover similar situations to the Permanente accident, including at night, with no lights, and with severe accidents, has been established.	G. Se ha establecido un programa de simulacros de abandono de la plataforma para cubrir situaciones similares al accidente Permanente, incluso de noche, sin luces y con accidentes graves.
184	G.  The analysis determined the appropriate set points for the SDVs and locations of their instrumentation.	G. El análisis determino los lugares apropiados para los SDVs y su instrumentación.
192	H.  Periodic maintenance of new emergency lighting is incorporated into the maintenance plan and budget.	H. El mantenimiento periódico de la nueva iluminación de emergencia se incorpora en el plan de mantenimiento y presupuesto.
200	I.  Analysis was conducted of critical evacuation scenarios to identify strategic places where additional life jacket containers should be placed.	I. Se realizó un análisis de los escenarios críticos de evacuación para identificar lugares estratégicos donde se deben colocar contenedores adicionales de chalecos salvavidas.
208	I.  The lifeboat for the Strategic URE team is identified in the emergency response map.	I. El bote salvavidas del equipo Estratégico de URE se identifica en el mapa de respuesta de emergencia.
216	K.  Installation of additional life jacket containers, where identified in the above analysis, were completed and stocked, and that these containers are identified in emergency response plans and diagrams.	K.  La instalación de contenedores de chalecos salvavidas adicionales, que se identificaron en el análisis anterior, se completó y se abasteció, y que estos contenedores se identifican en planes y diagramas de respuesta de emergencia.
224	L. Training covers nausea medication distributions, when, and by whom.	L. Training covers nausea medication distributions, when, and by whom.
232	R.  Notify installation personnel of the additional evacuation routes and safety equipment locations.	R. Notificar al personal de instalación de las rutas de evacuación adicionales y la ubicación de los equipos de seguridad.
\.


--
-- Data for Name: field_inputs; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.field_inputs (id, item, applicability, item_status, input_user, input_date, input_comment, seq_num, next_responsible, next_action) FROM stdin;
5	10	2	\N	1	2018-01-01		0	1	
13	41	2	\N	1	2018-01-01		0	1	
21	64	3	\N	1	2018-01-01		0	1	
29	91	2	\N	1	2018-01-01		0	1	
37	114	1	2	1	2018-01-01		0	1	
45	130	1	\N	1	2018-01-01		0	1	
53	150	2	\N	1	2018-01-01		0	1	
61	170	3	4	1	2018-01-01		0	1	
69	191	2	\N	1	2018-01-01		0	1	
77	217	3	2	1	2018-01-01		0	1	
85	231	3	\N	1	2018-01-01		0	1	
93	247	2	\N	1	2018-01-01		0	1	
101	263	2	\N	1	2018-01-01		0	1	
109	280	2	\N	1	2018-01-01		0	1	
117	302	2	1	1	2018-01-01		0	1	
125	319	3	\N	1	2018-01-01		0	1	
133	341	3	1	1	2018-01-01		0	1	
141	354	2	\N	1	2018-01-01		0	1	
149	371	3	\N	1	2018-01-01		0	1	
157	385	3	\N	1	2018-01-01		0	1	
165	400	3	2	1	2018-01-01		0	1	
173	423	2	\N	1	2018-01-01		0	1	
181	438	3	\N	1	2018-01-01		0	1	
189	455	2	2	1	2018-01-01		0	1	
197	476	2	1	1	2018-01-01		0	1	
205	494	3	2	1	2018-01-01		0	1	
213	507	2	\N	1	2018-01-01		0	1	
221	522	1	\N	1	2018-01-01		0	1	
229	540	3	2	1	2018-01-01		0	1	
237	562	3	7	1	2018-01-01		0	1	
245	588	3	4	1	2018-01-01		0	1	
253	603	\N	5	1	2018-01-01		0	1	
261	629	2	2	1	2018-01-01		0	1	
269	654	1	\N	1	2018-01-01		0	1	
277	671	2	\N	1	2018-01-01		0	1	
285	697	2	2	1	2018-01-01		0	1	
293	720	2	\N	1	2018-01-01		0	1	
301	740	2	2	1	2018-01-01		0	1	
309	752	2	\N	1	2018-01-01		0	1	
317	776	3	\N	1	2018-01-01		0	1	
325	796	2	2	1	2018-01-01		0	1	
333	820	2	2	1	2018-01-01		0	1	
341	835	3	\N	1	2018-01-01		0	1	
349	847	2	\N	1	2018-01-01		0	1	
357	863	3	\N	1	2018-01-01		0	1	
365	879	2	\N	1	2018-01-01		0	1	
373	896	3	2	1	2018-01-01		0	1	
381	908	2	\N	1	2018-01-01		0	1	
389	930	3	2	1	2018-01-01		0	1	
397	947	3	7	1	2018-01-01		0	1	
405	968	2	\N	1	2018-01-01		0	1	
413	994	3	2	1	2018-01-01		0	1	
421	1018	3	6	1	2018-01-01		0	1	
429	1035	2	\N	1	2018-01-01		0	1	
437	1047	2	\N	1	2018-01-01		0	1	
445	1060	2	\N	1	2018-01-01		0	1	
453	1078	2	\N	1	2018-01-01		0	1	
461	1101	2	\N	1	2018-01-01		0	1	
469	1115	2	2	1	2018-01-01		0	1	
477	1136	2	\N	1	2018-01-01		0	1	
485	1160	2	\N	1	2018-01-01		0	1	
493	1181	2	\N	1	2018-01-01		0	1	
501	1200	2	\N	1	2018-01-01		0	1	
509	1215	2	\N	1	2018-01-01		0	1	
517	1232	2	\N	1	2018-01-01		0	1	
525	1247	3	\N	1	2018-01-01		0	1	
533	1267	2	\N	1	2018-01-01		0	1	
541	1297	3	2	1	2018-01-01		0	1	
549	1312	2	2	1	2018-01-01		0	1	
557	1333	2	\N	1	2018-01-01		0	1	
565	1353	3	\N	1	2018-01-01		0	1	
573	1372	2	\N	1	2018-01-01		0	1	
581	1391	2	\N	1	2018-01-01		0	1	
589	1411	3	2	1	2018-01-01		0	1	
597	1436	3	\N	1	2018-01-01		0	1	
605	1454	3	2	1	2018-01-01		0	1	
613	1478	2	1	1	2018-01-01		0	1	
621	1492	1	\N	1	2018-01-01		0	1	
629	1513	3	4	1	2018-01-01		0	1	
637	1535	2	1	1	2018-01-01		0	1	
645	1550	2	1	1	2018-01-01		0	1	
653	1571	3	2	1	2018-01-01		0	1	
661	1587	3	2	1	2018-01-01		0	1	
669	1610	2	\N	1	2018-01-01		0	1	
677	1635	3	\N	1	2018-01-01		0	1	
685	1659	3	2	1	2018-01-01		0	1	
693	1672	2	\N	1	2018-01-01		0	1	
701	1698	2	\N	1	2018-01-01		0	1	
709	1726	1	2	1	2018-01-01		0	1	
717	1738	2	\N	1	2018-01-01		0	1	
725	1767	1	\N	1	2018-01-01		0	1	
733	1788	2	\N	1	2018-01-01		0	1	
741	1804	2	\N	1	2018-01-01		0	1	
749	1830	3	\N	1	2018-01-01		0	1	
757	1859	3	2	1	2018-01-01		0	1	
765	1879	3	2	1	2018-01-01		0	1	
773	1894	3	2	1	2018-01-01		0	1	
781	1910	3	1	1	2018-01-01		0	1	
789	1931	1	\N	1	2018-01-01		0	1	
797	1948	3	2	1	2018-01-01		0	1	
2	4	2	2	1	2018-01-01		0	1	
1	2	3	\N	1	2018-01-01		0	1	
10	28	2	\N	1	2018-01-01		0	1	
18	55	3	2	1	2018-01-01		0	1	
9	23	2	\N	1	2018-01-01		0	1	
26	82	2	\N	1	2018-01-01		0	1	
34	100	3	\N	1	2018-01-01		0	1	
42	122	2	2	1	2018-01-01		0	1	
17	52	\N	7	1	2018-01-01		0	1	
50	142	2	\N	1	2018-01-01		0	1	
25	76	3	6	1	2018-01-01		0	1	
33	98	1	\N	1	2018-01-01		0	1	
41	121	3	\N	1	2018-01-01		0	1	
49	141	2	\N	1	2018-01-01		0	1	
57	155	2	\N	1	2018-01-01		0	1	
65	178	2	\N	1	2018-01-01		0	1	
73	203	2	\N	1	2018-01-01		0	1	
81	226	2	\N	1	2018-01-01		0	1	
89	240	3	2	1	2018-01-01		0	1	
97	254	2	\N	1	2018-01-01		0	1	
105	275	3	2	1	2018-01-01		0	1	
113	293	3	2	1	2018-01-01		0	1	
121	308	3	2	1	2018-01-01		0	1	
129	329	2	\N	1	2018-01-01		0	1	
137	349	3	2	1	2018-01-01		0	1	
145	361	3	2	1	2018-01-01		0	1	
153	379	1	2	1	2018-01-01		0	1	
161	393	2	\N	1	2018-01-01		0	1	
169	407	2	\N	1	2018-01-01		0	1	
177	431	2	\N	1	2018-01-01		0	1	
185	443	2	\N	1	2018-01-01		0	1	
193	463	3	\N	1	2018-01-01		0	1	
201	485	3	2	1	2018-01-01		0	1	
209	502	3	2	1	2018-01-01		0	1	
217	512	2	\N	1	2018-01-01		0	1	
225	530	3	2	1	2018-01-01		0	1	
233	555	3	2	1	2018-01-01		0	1	
241	577	3	\N	1	2018-01-01		0	1	
249	599	\N	2	1	2018-01-01		0	1	
257	615	2	2	1	2018-01-01		0	1	
265	641	3	2	1	2018-01-01		0	1	
273	661	2	\N	1	2018-01-01		0	1	
281	683	2	\N	1	2018-01-01		0	1	
289	705	3	2	1	2018-01-01		0	1	
297	730	1	2	1	2018-01-01		0	1	
305	747	3	2	1	2018-01-01		0	1	
313	770	3	2	1	2018-01-01		0	1	
321	784	2	\N	1	2018-01-01		0	1	
329	815	2	2	1	2018-01-01		0	1	
337	828	2	\N	1	2018-01-01		0	1	
345	842	1	\N	1	2018-01-01		0	1	
353	854	2	\N	1	2018-01-01		0	1	
361	867	1	\N	1	2018-01-01		0	1	
369	886	2	\N	1	2018-01-01		0	1	
377	903	3	2	1	2018-01-01		0	1	
385	918	2	\N	1	2018-01-01		0	1	
393	936	2	\N	1	2018-01-01		0	1	
401	957	2	\N	1	2018-01-01		0	1	
409	975	2	2	1	2018-01-01		0	1	
417	1009	3	2	1	2018-01-01		0	1	
425	1023	3	7	1	2018-01-01		0	1	
433	1040	3	1	1	2018-01-01		0	1	
441	1054	2	\N	1	2018-01-01		0	1	
449	1067	2	\N	1	2018-01-01		0	1	
457	1089	2	\N	1	2018-01-01		0	1	
465	1109	2	\N	1	2018-01-01		0	1	
473	1126	3	\N	1	2018-01-01		0	1	
481	1147	2	\N	1	2018-01-01		0	1	
489	1174	3	\N	1	2018-01-01		0	1	
497	1193	3	2	1	2018-01-01		0	1	
505	1206	3	\N	1	2018-01-01		0	1	
513	1223	3	\N	1	2018-01-01		0	1	
521	1237	2	\N	1	2018-01-01		0	1	
529	1255	2	\N	1	2018-01-01		0	1	
537	1282	2	\N	1	2018-01-01		0	1	
545	1306	2	\N	1	2018-01-01		0	1	
553	1327	2	\N	1	2018-01-01		0	1	
561	1345	3	\N	1	2018-01-01		0	1	
569	1366	3	2	1	2018-01-01		0	1	
577	1380	2	2	1	2018-01-01		0	1	
585	1403	2	1	1	2018-01-01		0	1	
593	1425	3	7	1	2018-01-01		0	1	
601	1443	2	\N	1	2018-01-01		0	1	
609	1464	2	\N	1	2018-01-01		0	1	
617	1485	2	\N	1	2018-01-01		0	1	
625	1506	3	\N	1	2018-01-01		0	1	
633	1525	2	\N	1	2018-01-01		0	1	
641	1542	2	2	1	2018-01-01		0	1	
649	1556	3	\N	1	2018-01-01		0	1	
657	1580	3	2	1	2018-01-01		0	1	
665	1599	3	2	1	2018-01-01		0	1	
673	1616	2	2	1	2018-01-01		0	1	
681	1654	3	\N	1	2018-01-01		0	1	
689	1666	2	\N	1	2018-01-01		0	1	
697	1689	2	\N	1	2018-01-01		0	1	
705	1718	3	\N	1	2018-01-01		0	1	
713	1730	2	\N	1	2018-01-01		0	1	
721	1754	1	\N	1	2018-01-01		0	1	
729	1775	2	\N	1	2018-01-01		0	1	
737	1795	2	\N	1	2018-01-01		0	1	
745	1814	2	\N	1	2018-01-01		0	1	
753	1848	3	\N	1	2018-01-01		0	1	
761	1870	\N	6	1	2018-01-01		0	1	
769	1884	1	\N	1	2018-01-01		0	1	
777	1903	2	\N	1	2018-01-01		0	1	
785	1923	3	\N	1	2018-01-01		0	1	
793	1938	1	\N	1	2018-01-01		0	1	
801	1957	2	\N	1	2018-01-01		0	1	
809	1976	2	\N	1	2018-01-01		0	1	
817	1992	2	\N	1	2018-01-01		0	1	
825	2008	2	\N	1	2018-01-01		0	1	
833	2027	3	\N	1	2018-01-01		0	1	
841	2044	2	\N	1	2018-01-01		0	1	
849	2063	1	\N	1	2018-01-01		0	1	
857	2082	3	2	1	2018-01-01		0	1	
865	2116	3	\N	1	2018-01-01		0	1	
873	2138	3	6	1	2018-01-01		0	1	
881	2155	3	\N	1	2018-01-01		0	1	
889	2189	1	2	1	2018-01-01		0	1	
897	2205	2	\N	1	2018-01-01		0	1	
905	2219	2	2	1	2018-01-01		0	1	
913	2245	2	\N	1	2018-01-01		0	1	
921	2269	2	1	1	2018-01-01		0	1	
8	19	2	\N	1	2018-01-01		0	1	
16	51	\N	2	1	2018-01-01		0	1	
24	75	2	\N	1	2018-01-01		0	1	
32	95	2	\N	1	2018-01-01		0	1	
40	120	2	\N	1	2018-01-01		0	1	
48	139	2	\N	1	2018-01-01		0	1	
56	154	1	2	1	2018-01-01		0	1	
64	175	3	2	1	2018-01-01		0	1	
72	201	3	6	1	2018-01-01		0	1	
80	225	2	\N	1	2018-01-01		0	1	
88	238	3	2	1	2018-01-01		0	1	
96	253	3	\N	1	2018-01-01		0	1	
104	274	2	\N	1	2018-01-01		0	1	
112	292	2	\N	1	2018-01-01		0	1	
120	307	\N	2	1	2018-01-01		0	1	
128	328	2	\N	1	2018-01-01		0	1	
136	345	1	\N	1	2018-01-01		0	1	
144	359	3	2	1	2018-01-01		0	1	
152	377	2	2	1	2018-01-01		0	1	
160	390	3	\N	1	2018-01-01		0	1	
168	406	2	\N	1	2018-01-01		0	1	
176	430	2	\N	1	2018-01-01		0	1	
184	442	2	\N	1	2018-01-01		0	1	
192	462	2	\N	1	2018-01-01		0	1	
200	484	3	5	1	2018-01-01		0	1	
208	501	3	\N	1	2018-01-01		0	1	
216	511	2	\N	1	2018-01-01		0	1	
224	528	3	7	1	2018-01-01		0	1	
232	554	2	\N	1	2018-01-01		0	1	
240	572	3	\N	1	2018-01-01		0	1	
248	594	2	\N	1	2018-01-01		0	1	
256	614	3	\N	1	2018-01-01		0	1	
264	636	3	\N	1	2018-01-01		0	1	
272	659	3	2	1	2018-01-01		0	1	
280	681	3	\N	1	2018-01-01		0	1	
288	703	2	\N	1	2018-01-01		0	1	
296	729	3	\N	1	2018-01-01		0	1	
304	746	2	\N	1	2018-01-01		0	1	
312	764	3	5	1	2018-01-01		0	1	
320	781	2	\N	1	2018-01-01		0	1	
328	806	2	2	1	2018-01-01		0	1	
336	825	3	7	1	2018-01-01		0	1	
344	841	2	2	1	2018-01-01		0	1	
352	852	3	\N	1	2018-01-01		0	1	
360	866	2	\N	1	2018-01-01		0	1	
368	884	2	\N	1	2018-01-01		0	1	
376	901	2	2	1	2018-01-01		0	1	
384	917	2	\N	1	2018-01-01		0	1	
392	934	1	\N	1	2018-01-01		0	1	
400	954	3	2	1	2018-01-01		0	1	
408	973	3	2	1	2018-01-01		0	1	
416	1002	2	1	1	2018-01-01		0	1	
424	1021	3	2	1	2018-01-01		0	1	
432	1038	3	2	1	2018-01-01		0	1	
440	1052	1	\N	1	2018-01-01		0	1	
448	1066	2	\N	1	2018-01-01		0	1	
456	1088	2	2	1	2018-01-01		0	1	
464	1108	2	\N	1	2018-01-01		0	1	
472	1120	2	\N	1	2018-01-01		0	1	
480	1143	2	\N	1	2018-01-01		0	1	
488	1169	3	2	1	2018-01-01		0	1	
496	1192	3	2	1	2018-01-01		0	1	
504	1203	2	\N	1	2018-01-01		0	1	
512	1222	3	\N	1	2018-01-01		0	1	
520	1236	2	1	1	2018-01-01		0	1	
528	1252	2	\N	1	2018-01-01		0	1	
536	1280	\N	2	1	2018-01-01		0	1	
544	1305	3	2	1	2018-01-01		0	1	
552	1326	2	\N	1	2018-01-01		0	1	
560	1342	3	6	1	2018-01-01		0	1	
568	1365	3	2	1	2018-01-01		0	1	
576	1377	2	1	1	2018-01-01		0	1	
584	1400	2	\N	1	2018-01-01		0	1	
592	1418	2	\N	1	2018-01-01		0	1	
600	1442	2	2	1	2018-01-01		0	1	
608	1460	3	2	1	2018-01-01		0	1	
616	1484	3	2	1	2018-01-01		0	1	
624	1498	1	\N	1	2018-01-01		0	1	
632	1523	2	2	1	2018-01-01		0	1	
640	1539	3	6	1	2018-01-01		0	1	
648	1555	2	\N	1	2018-01-01		0	1	
656	1578	\N	2	1	2018-01-01		0	1	
664	1598	2	\N	1	2018-01-01		0	1	
672	1615	3	2	1	2018-01-01		0	1	
680	1653	3	2	1	2018-01-01		0	1	
688	1663	2	2	1	2018-01-01		0	1	
696	1684	2	\N	1	2018-01-01		0	1	
704	1715	3	\N	1	2018-01-01		0	1	
712	1729	1	2	1	2018-01-01		0	1	
720	1748	2	1	1	2018-01-01		0	1	
728	1772	2	\N	1	2018-01-01		0	1	
736	1793	3	\N	1	2018-01-01		0	1	
744	1813	2	\N	1	2018-01-01		0	1	
752	1845	2	\N	1	2018-01-01		0	1	
760	1863	1	\N	1	2018-01-01		0	1	
768	1882	3	2	1	2018-01-01		0	1	
776	1902	3	\N	1	2018-01-01		0	1	
784	1919	1	\N	1	2018-01-01		0	1	
792	1936	2	\N	1	2018-01-01		0	1	
800	1954	2	\N	1	2018-01-01		0	1	
808	1974	2	\N	1	2018-01-01		0	1	
816	1988	2	4	1	2018-01-01		0	1	
824	2007	3	\N	1	2018-01-01		0	1	
832	2024	3	\N	1	2018-01-01		0	1	
840	2041	\N	2	1	2018-01-01		0	1	
848	2062	3	2	1	2018-01-01		0	1	
856	2079	2	\N	1	2018-01-01		0	1	
864	2115	2	\N	1	2018-01-01		0	1	
872	2136	2	\N	1	2018-01-01		0	1	
880	2152	3	\N	1	2018-01-01		0	1	
888	2182	3	\N	1	2018-01-01		0	1	
4	7	\N	2	1	2018-01-01		0	1	
12	36	3	2	1	2018-01-01		0	1	
20	62	3	2	1	2018-01-01		0	1	
28	88	3	7	1	2018-01-01		0	1	
36	112	3	\N	1	2018-01-01		0	1	
44	125	3	\N	1	2018-01-01		0	1	
52	148	1	\N	1	2018-01-01		0	1	
60	166	3	2	1	2018-01-01		0	1	
68	187	3	\N	1	2018-01-01		0	1	
76	216	3	\N	1	2018-01-01		0	1	
84	229	2	2	1	2018-01-01		0	1	
92	246	2	\N	1	2018-01-01		0	1	
100	259	2	\N	1	2018-01-01		0	1	
108	279	2	2	1	2018-01-01		0	1	
116	301	2	\N	1	2018-01-01		0	1	
124	315	\N	2	1	2018-01-01		0	1	
132	338	1	\N	1	2018-01-01		0	1	
140	353	3	6	1	2018-01-01		0	1	
148	367	1	\N	1	2018-01-01		0	1	
156	383	\N	2	1	2018-01-01		0	1	
164	399	3	2	1	2018-01-01		0	1	
172	416	3	2	1	2018-01-01		0	1	
180	437	2	\N	1	2018-01-01		0	1	
188	454	2	\N	1	2018-01-01		0	1	
196	475	2	2	1	2018-01-01		0	1	
204	493	2	\N	1	2018-01-01		0	1	
212	505	2	\N	1	2018-01-01		0	1	
220	520	2	\N	1	2018-01-01		0	1	
228	535	2	\N	1	2018-01-01		0	1	
236	561	2	\N	1	2018-01-01		0	1	
244	584	3	2	1	2018-01-01		0	1	
252	602	3	\N	1	2018-01-01		0	1	
260	626	2	\N	1	2018-01-01		0	1	
268	653	2	\N	1	2018-01-01		0	1	
276	669	2	7	1	2018-01-01		0	1	
284	689	3	\N	1	2018-01-01		0	1	
292	714	3	\N	1	2018-01-01		0	1	
300	736	2	\N	1	2018-01-01		0	1	
308	751	2	\N	1	2018-01-01		0	1	
316	774	3	\N	1	2018-01-01		0	1	
324	795	2	2	1	2018-01-01		0	1	
332	819	2	\N	1	2018-01-01		0	1	
340	834	3	2	1	2018-01-01		0	1	
348	845	3	2	1	2018-01-01		0	1	
356	859	2	1	1	2018-01-01		0	1	
364	878	3	2	1	2018-01-01		0	1	
372	894	3	2	1	2018-01-01		0	1	
380	907	3	2	1	2018-01-01		0	1	
388	928	2	\N	1	2018-01-01		0	1	
396	946	2	\N	1	2018-01-01		0	1	
404	964	2	\N	1	2018-01-01		0	1	
412	993	3	2	1	2018-01-01		0	1	
420	1017	3	2	1	2018-01-01		0	1	
428	1032	2	\N	1	2018-01-01		0	1	
436	1045	3	6	1	2018-01-01		0	1	
444	1058	3	\N	1	2018-01-01		0	1	
452	1072	2	\N	1	2018-01-01		0	1	
460	1099	2	2	1	2018-01-01		0	1	
468	1113	3	\N	1	2018-01-01		0	1	
476	1133	1	\N	1	2018-01-01		0	1	
484	1155	2	\N	1	2018-01-01		0	1	
492	1180	2	\N	1	2018-01-01		0	1	
500	1196	3	2	1	2018-01-01		0	1	
508	1209	2	2	1	2018-01-01		0	1	
516	1230	2	\N	1	2018-01-01		0	1	
524	1245	3	6	1	2018-01-01		0	1	
532	1265	1	2	1	2018-01-01		0	1	
540	1292	2	\N	1	2018-01-01		0	1	
548	1311	3	2	1	2018-01-01		0	1	
556	1332	2	\N	1	2018-01-01		0	1	
564	1351	2	\N	1	2018-01-01		0	1	
572	1371	2	\N	1	2018-01-01		0	1	
580	1390	2	\N	1	2018-01-01		0	1	
588	1407	2	\N	1	2018-01-01		0	1	
596	1433	2	\N	1	2018-01-01		0	1	
604	1452	2	\N	1	2018-01-01		0	1	
612	1477	2	\N	1	2018-01-01		0	1	
620	1491	2	2	1	2018-01-01		0	1	
628	1512	1	\N	1	2018-01-01		0	1	
636	1531	3	\N	1	2018-01-01		0	1	
644	1549	2	\N	1	2018-01-01		0	1	
652	1569	3	5	1	2018-01-01		0	1	
660	1584	3	2	1	2018-01-01		0	1	
668	1608	2	\N	1	2018-01-01		0	1	
676	1633	3	5	1	2018-01-01		0	1	
684	1658	2	\N	1	2018-01-01		0	1	
692	1671	1	\N	1	2018-01-01		0	1	
700	1696	3	\N	1	2018-01-01		0	1	
708	1724	2	\N	1	2018-01-01		0	1	
716	1736	3	2	1	2018-01-01		0	1	
724	1763	2	2	1	2018-01-01		0	1	
732	1787	2	\N	1	2018-01-01		0	1	
740	1798	3	2	1	2018-01-01		0	1	
748	1827	2	\N	1	2018-01-01		0	1	
756	1856	3	\N	1	2018-01-01		0	1	
764	1876	2	2	1	2018-01-01		0	1	
772	1891	3	2	1	2018-01-01		0	1	
780	1908	3	2	1	2018-01-01		0	1	
788	1930	3	2	1	2018-01-01		0	1	
796	1946	2	\N	1	2018-01-01		0	1	
804	1962	2	\N	1	2018-01-01		0	1	
812	1982	1	\N	1	2018-01-01		0	1	
820	2001	3	2	1	2018-01-01		0	1	
828	2017	3	2	1	2018-01-01		0	1	
836	2031	\N	2	1	2018-01-01		0	1	
844	2050	3	\N	1	2018-01-01		0	1	
852	2070	2	2	1	2018-01-01		0	1	
860	2097	2	\N	1	2018-01-01		0	1	
868	2127	3	6	1	2018-01-01		0	1	
876	2146	1	\N	1	2018-01-01		0	1	
884	2165	1	2	1	2018-01-01		0	1	
892	2195	2	\N	1	2018-01-01		0	1	
58	159	3	2	1	2018-01-01		0	1	
66	181	1	\N	1	2018-01-01		0	1	
74	204	2	\N	1	2018-01-01		0	1	
82	227	3	2	1	2018-01-01		0	1	
90	242	3	6	1	2018-01-01		0	1	
98	256	2	\N	1	2018-01-01		0	1	
106	276	2	1	1	2018-01-01		0	1	
114	297	3	4	1	2018-01-01		0	1	
122	310	2	\N	1	2018-01-01		0	1	
130	332	3	2	1	2018-01-01		0	1	
138	350	3	7	1	2018-01-01		0	1	
146	362	1	\N	1	2018-01-01		0	1	
154	380	2	2	1	2018-01-01		0	1	
162	396	1	\N	1	2018-01-01		0	1	
170	408	3	2	1	2018-01-01		0	1	
178	435	2	\N	1	2018-01-01		0	1	
186	446	2	2	1	2018-01-01		0	1	
194	467	2	2	1	2018-01-01		0	1	
202	487	2	\N	1	2018-01-01		0	1	
210	503	3	1	1	2018-01-01		0	1	
218	515	2	\N	1	2018-01-01		0	1	
226	533	2	\N	1	2018-01-01		0	1	
234	558	2	\N	1	2018-01-01		0	1	
242	581	3	1	1	2018-01-01		0	1	
250	600	1	\N	1	2018-01-01		0	1	
258	616	2	2	1	2018-01-01		0	1	
266	644	3	\N	1	2018-01-01		0	1	
274	667	2	\N	1	2018-01-01		0	1	
282	684	2	\N	1	2018-01-01		0	1	
290	711	2	\N	1	2018-01-01		0	1	
298	731	3	2	1	2018-01-01		0	1	
306	748	2	\N	1	2018-01-01		0	1	
314	772	3	\N	1	2018-01-01		0	1	
322	787	3	1	1	2018-01-01		0	1	
330	816	2	\N	1	2018-01-01		0	1	
338	830	2	\N	1	2018-01-01		0	1	
346	843	2	\N	1	2018-01-01		0	1	
354	855	2	\N	1	2018-01-01		0	1	
362	872	2	\N	1	2018-01-01		0	1	
370	890	2	\N	1	2018-01-01		0	1	
378	904	2	2	1	2018-01-01		0	1	
386	922	3	\N	1	2018-01-01		0	1	
394	939	3	2	1	2018-01-01		0	1	
402	958	2	2	1	2018-01-01		0	1	
410	985	3	\N	1	2018-01-01		0	1	
418	1014	2	2	1	2018-01-01		0	1	
426	1026	2	\N	1	2018-01-01		0	1	
434	1041	3	2	1	2018-01-01		0	1	
442	1055	1	2	1	2018-01-01		0	1	
450	1070	3	4	1	2018-01-01		0	1	
458	1091	3	\N	1	2018-01-01		0	1	
466	1110	3	2	1	2018-01-01		0	1	
474	1127	3	\N	1	2018-01-01		0	1	
482	1148	2	\N	1	2018-01-01		0	1	
490	1176	2	\N	1	2018-01-01		0	1	
498	1194	3	\N	1	2018-01-01		0	1	
506	1207	3	2	1	2018-01-01		0	1	
514	1226	2	2	1	2018-01-01		0	1	
522	1240	3	\N	1	2018-01-01		0	1	
530	1259	1	\N	1	2018-01-01		0	1	
538	1287	2	\N	1	2018-01-01		0	1	
546	1307	3	2	1	2018-01-01		0	1	
554	1328	3	2	1	2018-01-01		0	1	
562	1348	3	2	1	2018-01-01		0	1	
570	1367	3	1	1	2018-01-01		0	1	
578	1384	3	2	1	2018-01-01		0	1	
586	1405	3	2	1	2018-01-01		0	1	
594	1426	3	\N	1	2018-01-01		0	1	
602	1444	3	2	1	2018-01-01		0	1	
610	1465	3	\N	1	2018-01-01		0	1	
618	1487	2	1	1	2018-01-01		0	1	
626	1508	3	2	1	2018-01-01		0	1	
634	1526	2	2	1	2018-01-01		0	1	
642	1543	3	\N	1	2018-01-01		0	1	
650	1558	2	\N	1	2018-01-01		0	1	
658	1581	2	\N	1	2018-01-01		0	1	
666	1606	2	\N	1	2018-01-01		0	1	
674	1618	2	2	1	2018-01-01		0	1	
682	1655	2	\N	1	2018-01-01		0	1	
690	1667	2	\N	1	2018-01-01		0	1	
698	1690	2	\N	1	2018-01-01		0	1	
706	1721	3	\N	1	2018-01-01		0	1	
714	1734	3	\N	1	2018-01-01		0	1	
722	1757	2	2	1	2018-01-01		0	1	
730	1778	3	2	1	2018-01-01		0	1	
738	1796	3	7	1	2018-01-01		0	1	
746	1819	1	\N	1	2018-01-01		0	1	
754	1851	2	\N	1	2018-01-01		0	1	
762	1872	2	\N	1	2018-01-01		0	1	
770	1885	2	\N	1	2018-01-01		0	1	
778	1904	2	\N	1	2018-01-01		0	1	
786	1927	3	2	1	2018-01-01		0	1	
794	1939	3	2	1	2018-01-01		0	1	
802	1958	3	2	1	2018-01-01		0	1	
810	1979	2	\N	1	2018-01-01		0	1	
818	1997	3	6	1	2018-01-01		0	1	
826	2010	3	2	1	2018-01-01		0	1	
834	2028	3	2	1	2018-01-01		0	1	
842	2045	2	\N	1	2018-01-01		0	1	
850	2066	3	2	1	2018-01-01		0	1	
858	2083	2	\N	1	2018-01-01		0	1	
866	2125	2	\N	1	2018-01-01		0	1	
874	2143	2	\N	1	2018-01-01		0	1	
882	2157	3	\N	1	2018-01-01		0	1	
890	2190	2	\N	1	2018-01-01		0	1	
898	2206	2	\N	1	2018-01-01		0	1	
906	2220	3	2	1	2018-01-01		0	1	
914	2247	3	2	1	2018-01-01		0	1	
922	2270	2	\N	1	2018-01-01		0	1	
930	2308	3	2	1	2018-01-01		0	1	
938	2325	3	2	1	2018-01-01		0	1	
946	2348	1	\N	1	2018-01-01		0	1	
7	17	3	2	1	2018-01-01		0	1	
15	49	3	\N	1	2018-01-01		0	1	
23	70	2	\N	1	2018-01-01		0	1	
31	94	2	\N	1	2018-01-01		0	1	
39	118	3	\N	1	2018-01-01		0	1	
47	137	1	2	1	2018-01-01		0	1	
55	152	3	\N	1	2018-01-01		0	1	
63	173	3	\N	1	2018-01-01		0	1	
71	200	3	2	1	2018-01-01		0	1	
79	224	2	\N	1	2018-01-01		0	1	
87	234	1	2	1	2018-01-01		0	1	
95	252	3	2	1	2018-01-01		0	1	
103	272	2	\N	1	2018-01-01		0	1	
111	291	3	2	1	2018-01-01		0	1	
119	306	2	1	1	2018-01-01		0	1	
127	326	2	\N	1	2018-01-01		0	1	
135	344	2	\N	1	2018-01-01		0	1	
143	356	2	\N	1	2018-01-01		0	1	
151	376	3	6	1	2018-01-01		0	1	
159	389	2	1	1	2018-01-01		0	1	
167	405	2	\N	1	2018-01-01		0	1	
175	425	2	\N	1	2018-01-01		0	1	
183	441	2	\N	1	2018-01-01		0	1	
191	461	2	\N	1	2018-01-01		0	1	
199	482	3	2	1	2018-01-01		0	1	
207	500	3	\N	1	2018-01-01		0	1	
215	510	2	\N	1	2018-01-01		0	1	
223	526	2	2	1	2018-01-01		0	1	
231	553	3	2	1	2018-01-01		0	1	
239	570	2	\N	1	2018-01-01		0	1	
247	593	2	\N	1	2018-01-01		0	1	
255	610	3	2	1	2018-01-01		0	1	
263	634	2	\N	1	2018-01-01		0	1	
271	656	2	1	1	2018-01-01		0	1	
279	678	3	2	1	2018-01-01		0	1	
287	702	1	\N	1	2018-01-01		0	1	
295	728	2	\N	1	2018-01-01		0	1	
303	744	2	\N	1	2018-01-01		0	1	
311	756	2	\N	1	2018-01-01		0	1	
319	779	1	2	1	2018-01-01		0	1	
327	800	3	7	1	2018-01-01		0	1	
335	823	1	\N	1	2018-01-01		0	1	
343	837	2	\N	1	2018-01-01		0	1	
351	851	2	2	1	2018-01-01		0	1	
359	865	3	2	1	2018-01-01		0	1	
367	883	2	2	1	2018-01-01		0	1	
375	899	2	4	1	2018-01-01		0	1	
383	914	2	\N	1	2018-01-01		0	1	
391	933	3	2	1	2018-01-01		0	1	
399	952	3	\N	1	2018-01-01		0	1	
407	971	2	\N	1	2018-01-01		0	1	
415	1001	2	\N	1	2018-01-01		0	1	
423	1020	2	\N	1	2018-01-01		0	1	
431	1037	2	\N	1	2018-01-01		0	1	
439	1051	2	\N	1	2018-01-01		0	1	
447	1063	3	2	1	2018-01-01		0	1	
455	1082	3	2	1	2018-01-01		0	1	
463	1104	2	\N	1	2018-01-01		0	1	
471	1119	2	\N	1	2018-01-01		0	1	
479	1141	2	\N	1	2018-01-01		0	1	
487	1166	3	2	1	2018-01-01		0	1	
495	1187	2	1	1	2018-01-01		0	1	
503	1202	2	\N	1	2018-01-01		0	1	
511	1218	2	1	1	2018-01-01		0	1	
519	1234	2	2	1	2018-01-01		0	1	
527	1250	3	\N	1	2018-01-01		0	1	
535	1279	1	\N	1	2018-01-01		0	1	
543	1304	3	\N	1	2018-01-01		0	1	
551	1323	2	\N	1	2018-01-01		0	1	
559	1339	3	2	1	2018-01-01		0	1	
567	1363	2	\N	1	2018-01-01		0	1	
575	1374	\N	7	1	2018-01-01		0	1	
583	1398	3	\N	1	2018-01-01		0	1	
591	1417	3	\N	1	2018-01-01		0	1	
599	1441	3	1	1	2018-01-01		0	1	
607	1458	3	2	1	2018-01-01		0	1	
615	1481	\N	6	1	2018-01-01		0	1	
623	1496	2	\N	1	2018-01-01		0	1	
631	1522	1	\N	1	2018-01-01		0	1	
639	1538	2	\N	1	2018-01-01		0	1	
647	1553	2	\N	1	2018-01-01		0	1	
655	1575	2	\N	1	2018-01-01		0	1	
663	1592	2	\N	1	2018-01-01		0	1	
671	1614	2	\N	1	2018-01-01		0	1	
679	1640	2	\N	1	2018-01-01		0	1	
687	1662	2	\N	1	2018-01-01		0	1	
695	1682	3	\N	1	2018-01-01		0	1	
703	1709	2	2	1	2018-01-01		0	1	
711	1728	3	2	1	2018-01-01		0	1	
719	1747	3	4	1	2018-01-01		0	1	
727	1769	3	\N	1	2018-01-01		0	1	
735	1791	3	2	1	2018-01-01		0	1	
743	1810	2	\N	1	2018-01-01		0	1	
751	1843	2	\N	1	2018-01-01		0	1	
759	1862	2	\N	1	2018-01-01		0	1	
767	1881	3	2	1	2018-01-01		0	1	
775	1900	2	\N	1	2018-01-01		0	1	
783	1913	2	\N	1	2018-01-01		0	1	
791	1935	2	\N	1	2018-01-01		0	1	
799	1951	2	\N	1	2018-01-01		0	1	
6	15	2	\N	1	2018-01-01		0	1	
14	42	2	\N	1	2018-01-01		0	1	
22	66	3	2	1	2018-01-01		0	1	
30	92	2	\N	1	2018-01-01		0	1	
38	117	3	2	1	2018-01-01		0	1	
46	133	2	\N	1	2018-01-01		0	1	
54	151	3	6	1	2018-01-01		0	1	
62	172	2	\N	1	2018-01-01		0	1	
70	192	2	\N	1	2018-01-01		0	1	
78	221	2	\N	1	2018-01-01		0	1	
86	232	3	\N	1	2018-01-01		0	1	
94	250	2	\N	1	2018-01-01		0	1	
102	265	3	2	1	2018-01-01		0	1	
110	284	3	\N	1	2018-01-01		0	1	
118	303	2	\N	1	2018-01-01		0	1	
126	323	2	\N	1	2018-01-01		0	1	
134	343	2	\N	1	2018-01-01		0	1	
3	5	2	\N	1	2018-01-01		0	1	
142	355	1	\N	1	2018-01-01		0	1	
11	34	2	\N	1	2018-01-01		0	1	
19	56	3	2	1	2018-01-01		0	1	
150	375	3	\N	1	2018-01-01		0	1	
27	83	3	6	1	2018-01-01		0	1	
35	103	3	\N	1	2018-01-01		0	1	
158	388	2	\N	1	2018-01-01		0	1	
43	123	2	\N	1	2018-01-01		0	1	
166	401	2	\N	1	2018-01-01		0	1	
51	143	2	1	1	2018-01-01		0	1	
174	424	3	\N	1	2018-01-01		0	1	
59	161	3	2	1	2018-01-01		0	1	
182	440	3	2	1	2018-01-01		0	1	
67	182	3	\N	1	2018-01-01		0	1	
190	456	2	2	1	2018-01-01		0	1	
75	209	3	2	1	2018-01-01		0	1	
198	480	3	1	1	2018-01-01		0	1	
83	228	3	\N	1	2018-01-01		0	1	
206	498	1	\N	1	2018-01-01		0	1	
91	244	3	2	1	2018-01-01		0	1	
214	509	3	\N	1	2018-01-01		0	1	
99	258	2	2	1	2018-01-01		0	1	
222	524	\N	2	1	2018-01-01		0	1	
230	547	2	\N	1	2018-01-01		0	1	
238	569	3	2	1	2018-01-01		0	1	
246	592	3	\N	1	2018-01-01		0	1	
254	604	2	\N	1	2018-01-01		0	1	
262	632	3	\N	1	2018-01-01		0	1	
270	655	3	4	1	2018-01-01		0	1	
278	675	2	2	1	2018-01-01		0	1	
286	701	2	1	1	2018-01-01		0	1	
294	723	2	6	1	2018-01-01		0	1	
302	741	3	7	1	2018-01-01		0	1	
310	753	2	\N	1	2018-01-01		0	1	
318	777	2	\N	1	2018-01-01		0	1	
326	798	2	\N	1	2018-01-01		0	1	
334	822	1	\N	1	2018-01-01		0	1	
342	836	2	2	1	2018-01-01		0	1	
350	850	3	6	1	2018-01-01		0	1	
358	864	2	2	1	2018-01-01		0	1	
366	882	3	\N	1	2018-01-01		0	1	
374	897	3	\N	1	2018-01-01		0	1	
382	911	2	\N	1	2018-01-01		0	1	
107	278	2	\N	1	2018-01-01		0	1	
115	300	2	\N	1	2018-01-01		0	1	
123	311	3	2	1	2018-01-01		0	1	
131	336	2	2	1	2018-01-01		0	1	
139	352	1	2	1	2018-01-01		0	1	
390	931	3	\N	1	2018-01-01		0	1	
147	365	1	\N	1	2018-01-01		0	1	
398	951	1	\N	1	2018-01-01		0	1	
155	381	3	6	1	2018-01-01		0	1	
406	969	1	2	1	2018-01-01		0	1	
163	397	2	\N	1	2018-01-01		0	1	
414	999	3	1	1	2018-01-01		0	1	
171	412	3	2	1	2018-01-01		0	1	
422	1019	2	1	1	2018-01-01		0	1	
179	436	3	2	1	2018-01-01		0	1	
430	1036	3	6	1	2018-01-01		0	1	
187	453	2	\N	1	2018-01-01		0	1	
438	1049	\N	2	1	2018-01-01		0	1	
195	470	2	\N	1	2018-01-01		0	1	
446	1061	2	\N	1	2018-01-01		0	1	
203	488	2	\N	1	2018-01-01		0	1	
454	1081	3	7	1	2018-01-01		0	1	
211	504	2	\N	1	2018-01-01		0	1	
462	1102	3	\N	1	2018-01-01		0	1	
219	517	1	2	1	2018-01-01		0	1	
470	1118	3	\N	1	2018-01-01		0	1	
227	534	3	2	1	2018-01-01		0	1	
478	1138	2	\N	1	2018-01-01		0	1	
235	559	2	2	1	2018-01-01		0	1	
486	1161	3	2	1	2018-01-01		0	1	
243	583	3	2	1	2018-01-01		0	1	
494	1186	3	\N	1	2018-01-01		0	1	
251	601	2	\N	1	2018-01-01		0	1	
502	1201	3	6	1	2018-01-01		0	1	
259	619	3	2	1	2018-01-01		0	1	
510	1217	3	\N	1	2018-01-01		0	1	
267	645	3	4	1	2018-01-01		0	1	
275	668	2	\N	1	2018-01-01		0	1	
283	688	2	\N	1	2018-01-01		0	1	
291	713	2	\N	1	2018-01-01		0	1	
299	732	3	1	1	2018-01-01		0	1	
307	750	3	2	1	2018-01-01		0	1	
315	773	3	5	1	2018-01-01		0	1	
323	790	2	\N	1	2018-01-01		0	1	
331	817	2	\N	1	2018-01-01		0	1	
339	833	1	\N	1	2018-01-01		0	1	
347	844	2	\N	1	2018-01-01		0	1	
355	856	3	7	1	2018-01-01		0	1	
363	877	3	\N	1	2018-01-01		0	1	
371	892	3	\N	1	2018-01-01		0	1	
379	906	3	\N	1	2018-01-01		0	1	
387	927	2	\N	1	2018-01-01		0	1	
395	942	2	2	1	2018-01-01		0	1	
403	961	2	\N	1	2018-01-01		0	1	
411	988	2	\N	1	2018-01-01		0	1	
419	1015	2	\N	1	2018-01-01		0	1	
427	1029	3	4	1	2018-01-01		0	1	
435	1044	3	1	1	2018-01-01		0	1	
443	1056	2	\N	1	2018-01-01		0	1	
451	1071	2	\N	1	2018-01-01		0	1	
459	1098	3	6	1	2018-01-01		0	1	
467	1112	2	2	1	2018-01-01		0	1	
475	1129	3	2	1	2018-01-01		0	1	
483	1151	2	1	1	2018-01-01		0	1	
491	1178	2	\N	1	2018-01-01		0	1	
499	1195	2	\N	1	2018-01-01		0	1	
507	1208	3	6	1	2018-01-01		0	1	
515	1228	2	\N	1	2018-01-01		0	1	
523	1243	1	2	1	2018-01-01		0	1	
531	1263	2	\N	1	2018-01-01		0	1	
539	1290	3	\N	1	2018-01-01		0	1	
547	1308	2	1	1	2018-01-01		0	1	
555	1331	3	\N	1	2018-01-01		0	1	
563	1349	3	6	1	2018-01-01		0	1	
571	1368	3	2	1	2018-01-01		0	1	
579	1385	2	2	1	2018-01-01		0	1	
587	1406	2	\N	1	2018-01-01		0	1	
595	1428	1	\N	1	2018-01-01		0	1	
603	1446	2	\N	1	2018-01-01		0	1	
611	1476	2	\N	1	2018-01-01		0	1	
619	1490	3	2	1	2018-01-01		0	1	
627	1511	3	\N	1	2018-01-01		0	1	
635	1528	3	2	1	2018-01-01		0	1	
643	1546	2	\N	1	2018-01-01		0	1	
651	1560	2	1	1	2018-01-01		0	1	
659	1583	3	1	1	2018-01-01		0	1	
667	1607	2	\N	1	2018-01-01		0	1	
675	1619	3	2	1	2018-01-01		0	1	
683	1656	2	\N	1	2018-01-01		0	1	
691	1669	3	\N	1	2018-01-01		0	1	
699	1694	2	\N	1	2018-01-01		0	1	
707	1723	2	1	1	2018-01-01		0	1	
715	1735	3	2	1	2018-01-01		0	1	
723	1758	2	2	1	2018-01-01		0	1	
731	1779	3	\N	1	2018-01-01		0	1	
739	1797	2	\N	1	2018-01-01		0	1	
747	1823	2	2	1	2018-01-01		0	1	
755	1852	3	1	1	2018-01-01		0	1	
763	1875	3	2	1	2018-01-01		0	1	
771	1886	2	\N	1	2018-01-01		0	1	
779	1907	2	1	1	2018-01-01		0	1	
787	1929	2	\N	1	2018-01-01		0	1	
795	1940	3	\N	1	2018-01-01		0	1	
803	1960	2	\N	1	2018-01-01		0	1	
811	1980	2	\N	1	2018-01-01		0	1	
819	1998	1	\N	1	2018-01-01		0	1	
827	2014	2	1	1	2018-01-01		0	1	
835	2029	2	\N	1	2018-01-01		0	1	
843	2047	2	1	1	2018-01-01		0	1	
851	2069	2	\N	1	2018-01-01		0	1	
859	2094	3	\N	1	2018-01-01		0	1	
867	2126	3	2	1	2018-01-01		0	1	
875	2144	2	2	1	2018-01-01		0	1	
883	2164	3	2	1	2018-01-01		0	1	
891	2194	3	2	1	2018-01-01		0	1	
899	2211	3	2	1	2018-01-01		0	1	
907	2222	2	\N	1	2018-01-01		0	1	
915	2252	3	1	1	2018-01-01		0	1	
923	2271	3	\N	1	2018-01-01		0	1	
931	2312	3	2	1	2018-01-01		0	1	
939	2326	1	2	1	2018-01-01		0	1	
947	2349	2	\N	1	2018-01-01		0	1	
955	2370	2	\N	1	2018-01-01		0	1	
963	2388	2	\N	1	2018-01-01		0	1	
971	2408	3	\N	1	2018-01-01		0	1	
979	2426	3	\N	1	2018-01-01		0	1	
987	2438	1	\N	1	2018-01-01		0	1	
995	2475	3	2	1	2018-01-01		0	1	
1003	2485	1	\N	1	2018-01-01		0	1	
1011	2520	2	\N	1	2018-01-01		0	1	
1019	2544	3	2	1	2018-01-01		0	1	
1027	2570	2	\N	1	2018-01-01		0	1	
1035	2589	3	6	1	2018-01-01		0	1	
1043	2609	\N	2	1	2018-01-01		0	1	
1051	2644	2	\N	1	2018-01-01		0	1	
1059	2657	3	2	1	2018-01-01		0	1	
1067	2672	2	\N	1	2018-01-01		0	1	
1075	2699	1	\N	1	2018-01-01		0	1	
1083	2721	3	2	1	2018-01-01		0	1	
1091	2741	3	6	1	2018-01-01		0	1	
1099	2749	2	\N	1	2018-01-01		0	1	
1107	2779	2	2	1	2018-01-01		0	1	
1115	2794	2	\N	1	2018-01-01		0	1	
1123	2816	1	2	1	2018-01-01		0	1	
1131	2832	2	\N	1	2018-01-01		0	1	
1139	2862	3	2	1	2018-01-01		0	1	
1147	2880	2	\N	1	2018-01-01		0	1	
1155	2895	2	\N	1	2018-01-01		0	1	
1163	2911	2	2	1	2018-01-01		0	1	
1171	2937	2	\N	1	2018-01-01		0	1	
1179	2959	2	\N	1	2018-01-01		0	1	
1187	2974	3	\N	1	2018-01-01		0	1	
1195	2994	1	\N	1	2018-01-01		0	1	
1203	3014	3	2	1	2018-01-01		0	1	
1211	3035	2	\N	1	2018-01-01		0	1	
1219	3050	3	2	1	2018-01-01		0	1	
1227	3071	2	\N	1	2018-01-01		0	1	
1235	3089	2	\N	1	2018-01-01		0	1	
1243	3103	2	\N	1	2018-01-01		0	1	
1251	3130	2	\N	1	2018-01-01		0	1	
1259	3145	3	\N	1	2018-01-01		0	1	
1267	3167	2	\N	1	2018-01-01		0	1	
1275	3192	3	\N	1	2018-01-01		0	1	
1283	3210	3	6	1	2018-01-01		0	1	
1291	3226	2	\N	1	2018-01-01		0	1	
1299	3243	3	\N	1	2018-01-01		0	1	
1307	3260	2	2	1	2018-01-01		0	1	
1315	3273	3	1	1	2018-01-01		0	1	
1323	3292	3	\N	1	2018-01-01		0	1	
1331	3307	2	2	1	2018-01-01		0	1	
1339	3336	3	\N	1	2018-01-01		0	1	
1347	3356	3	\N	1	2018-01-01		0	1	
1355	3378	2	\N	1	2018-01-01		0	1	
1363	3405	2	2	1	2018-01-01		0	1	
518	1233	3	2	1	2018-01-01		0	1	
526	1249	2	1	1	2018-01-01		0	1	
534	1275	2	\N	1	2018-01-01		0	1	
542	1303	3	\N	1	2018-01-01		0	1	
550	1316	3	2	1	2018-01-01		0	1	
558	1338	2	\N	1	2018-01-01		0	1	
566	1361	2	\N	1	2018-01-01		0	1	
574	1373	3	2	1	2018-01-01		0	1	
582	1397	3	2	1	2018-01-01		0	1	
590	1416	3	\N	1	2018-01-01		0	1	
598	1437	3	2	1	2018-01-01		0	1	
606	1457	1	\N	1	2018-01-01		0	1	
614	1480	2	\N	1	2018-01-01		0	1	
622	1495	2	\N	1	2018-01-01		0	1	
630	1518	2	2	1	2018-01-01		0	1	
638	1536	2	\N	1	2018-01-01		0	1	
646	1552	2	\N	1	2018-01-01		0	1	
654	1573	3	2	1	2018-01-01		0	1	
662	1588	3	\N	1	2018-01-01		0	1	
670	1613	3	2	1	2018-01-01		0	1	
678	1638	3	\N	1	2018-01-01		0	1	
686	1660	3	2	1	2018-01-01		0	1	
694	1673	2	1	1	2018-01-01		0	1	
702	1702	1	2	1	2018-01-01		0	1	
710	1727	3	\N	1	2018-01-01		0	1	
718	1739	3	2	1	2018-01-01		0	1	
726	1768	3	\N	1	2018-01-01		0	1	
734	1790	2	\N	1	2018-01-01		0	1	
742	1805	\N	2	1	2018-01-01		0	1	
750	1840	2	2	1	2018-01-01		0	1	
758	1860	1	\N	1	2018-01-01		0	1	
766	1880	2	\N	1	2018-01-01		0	1	
774	1896	2	\N	1	2018-01-01		0	1	
782	1912	2	1	1	2018-01-01		0	1	
790	1932	2	\N	1	2018-01-01		0	1	
798	1949	2	\N	1	2018-01-01		0	1	
806	1969	2	\N	1	2018-01-01		0	1	
814	1985	3	1	1	2018-01-01		0	1	
822	2005	3	\N	1	2018-01-01		0	1	
830	2021	2	\N	1	2018-01-01		0	1	
838	2034	2	2	1	2018-01-01		0	1	
846	2056	2	\N	1	2018-01-01		0	1	
854	2077	2	1	1	2018-01-01		0	1	
862	2109	2	\N	1	2018-01-01		0	1	
870	2134	3	6	1	2018-01-01		0	1	
878	2150	2	1	1	2018-01-01		0	1	
886	2172	2	\N	1	2018-01-01		0	1	
894	2199	2	2	1	2018-01-01		0	1	
902	2215	3	\N	1	2018-01-01		0	1	
910	2239	2	7	1	2018-01-01		0	1	
918	2260	3	2	1	2018-01-01		0	1	
926	2281	3	\N	1	2018-01-01		0	1	
934	2317	3	2	1	2018-01-01		0	1	
942	2333	2	\N	1	2018-01-01		0	1	
950	2357	1	\N	1	2018-01-01		0	1	
958	2374	3	2	1	2018-01-01		0	1	
966	2396	1	\N	1	2018-01-01		0	1	
974	2415	3	\N	1	2018-01-01		0	1	
982	2431	2	\N	1	2018-01-01		0	1	
990	2456	3	\N	1	2018-01-01		0	1	
998	2479	3	\N	1	2018-01-01		0	1	
1006	2502	2	2	1	2018-01-01		0	1	
1014	2527	2	\N	1	2018-01-01		0	1	
1022	2558	2	\N	1	2018-01-01		0	1	
1030	2576	3	2	1	2018-01-01		0	1	
1038	2592	3	2	1	2018-01-01		0	1	
1046	2615	2	\N	1	2018-01-01		0	1	
1054	2649	3	6	1	2018-01-01		0	1	
1062	2665	2	\N	1	2018-01-01		0	1	
1070	2681	2	\N	1	2018-01-01		0	1	
1078	2705	2	\N	1	2018-01-01		0	1	
1086	2730	2	\N	1	2018-01-01		0	1	
1094	2744	3	6	1	2018-01-01		0	1	
1102	2759	2	2	1	2018-01-01		0	1	
1110	2787	3	\N	1	2018-01-01		0	1	
1118	2804	2	\N	1	2018-01-01		0	1	
1126	2820	1	\N	1	2018-01-01		0	1	
1134	2840	2	\N	1	2018-01-01		0	1	
1142	2869	2	2	1	2018-01-01		0	1	
1150	2886	2	\N	1	2018-01-01		0	1	
1158	2901	3	\N	1	2018-01-01		0	1	
1166	2915	3	\N	1	2018-01-01		0	1	
1174	2944	2	\N	1	2018-01-01		0	1	
1182	2963	2	1	1	2018-01-01		0	1	
1190	2981	3	\N	1	2018-01-01		0	1	
1198	3004	3	\N	1	2018-01-01		0	1	
1206	3026	2	2	1	2018-01-01		0	1	
1214	3042	2	1	1	2018-01-01		0	1	
1222	3060	2	\N	1	2018-01-01		0	1	
1230	3079	2	\N	1	2018-01-01		0	1	
1238	3092	2	\N	1	2018-01-01		0	1	
1246	3113	2	1	1	2018-01-01		0	1	
1254	3135	2	2	1	2018-01-01		0	1	
1262	3150	3	2	1	2018-01-01		0	1	
1270	3175	2	\N	1	2018-01-01		0	1	
1278	3199	2	\N	1	2018-01-01		0	1	
1286	3218	2	\N	1	2018-01-01		0	1	
1294	3231	\N	7	1	2018-01-01		0	1	
1302	3246	2	2	1	2018-01-01		0	1	
1310	3267	2	\N	1	2018-01-01		0	1	
1318	3279	2	\N	1	2018-01-01		0	1	
1326	3296	3	\N	1	2018-01-01		0	1	
1334	3316	2	\N	1	2018-01-01		0	1	
1342	3343	3	2	1	2018-01-01		0	1	
1350	3362	2	2	1	2018-01-01		0	1	
1358	3386	2	\N	1	2018-01-01		0	1	
1366	3412	3	2	1	2018-01-01		0	1	
1374	3432	3	2	1	2018-01-01		0	1	
1382	3449	3	\N	1	2018-01-01		0	1	
1390	3472	3	2	1	2018-01-01		0	1	
1398	3493	2	1	1	2018-01-01		0	1	
1406	3517	2	2	1	2018-01-01		0	1	
807	1973	3	\N	1	2018-01-01		0	1	
815	1987	3	7	1	2018-01-01		0	1	
823	2006	1	\N	1	2018-01-01		0	1	
831	2022	3	\N	1	2018-01-01		0	1	
839	2039	2	\N	1	2018-01-01		0	1	
847	2059	2	\N	1	2018-01-01		0	1	
855	2078	2	2	1	2018-01-01		0	1	
863	2110	2	\N	1	2018-01-01		0	1	
871	2135	1	\N	1	2018-01-01		0	1	
879	2151	2	\N	1	2018-01-01		0	1	
887	2174	2	\N	1	2018-01-01		0	1	
895	2203	2	\N	1	2018-01-01		0	1	
903	2216	2	\N	1	2018-01-01		0	1	
911	2240	2	\N	1	2018-01-01		0	1	
919	2264	2	\N	1	2018-01-01		0	1	
927	2284	3	2	1	2018-01-01		0	1	
935	2318	3	2	1	2018-01-01		0	1	
943	2334	2	\N	1	2018-01-01		0	1	
951	2358	2	\N	1	2018-01-01		0	1	
959	2376	1	\N	1	2018-01-01		0	1	
967	2397	3	1	1	2018-01-01		0	1	
975	2417	3	2	1	2018-01-01		0	1	
983	2434	2	2	1	2018-01-01		0	1	
991	2467	3	2	1	2018-01-01		0	1	
999	2481	1	\N	1	2018-01-01		0	1	
1007	2510	3	\N	1	2018-01-01		0	1	
1015	2532	\N	2	1	2018-01-01		0	1	
1023	2564	3	\N	1	2018-01-01		0	1	
1031	2580	2	2	1	2018-01-01		0	1	
1039	2595	3	2	1	2018-01-01		0	1	
1047	2619	2	\N	1	2018-01-01		0	1	
1055	2652	3	2	1	2018-01-01		0	1	
1063	2666	3	6	1	2018-01-01		0	1	
1071	2684	2	\N	1	2018-01-01		0	1	
1079	2706	2	\N	1	2018-01-01		0	1	
1087	2733	2	2	1	2018-01-01		0	1	
1095	2745	2	\N	1	2018-01-01		0	1	
1103	2760	2	1	1	2018-01-01		0	1	
1111	2788	3	7	1	2018-01-01		0	1	
1119	2807	2	\N	1	2018-01-01		0	1	
1127	2822	3	6	1	2018-01-01		0	1	
1135	2842	2	1	1	2018-01-01		0	1	
1143	2871	3	6	1	2018-01-01		0	1	
1151	2887	1	\N	1	2018-01-01		0	1	
1159	2902	2	\N	1	2018-01-01		0	1	
1167	2929	3	\N	1	2018-01-01		0	1	
1175	2945	3	2	1	2018-01-01		0	1	
1183	2964	2	2	1	2018-01-01		0	1	
1191	2983	2	\N	1	2018-01-01		0	1	
1199	3005	2	\N	1	2018-01-01		0	1	
1207	3029	3	5	1	2018-01-01		0	1	
1215	3043	3	2	1	2018-01-01		0	1	
1223	3065	3	2	1	2018-01-01		0	1	
1231	3080	2	1	1	2018-01-01		0	1	
1239	3094	2	\N	1	2018-01-01		0	1	
1247	3114	2	\N	1	2018-01-01		0	1	
1255	3137	3	\N	1	2018-01-01		0	1	
1263	3154	3	\N	1	2018-01-01		0	1	
1271	3179	2	\N	1	2018-01-01		0	1	
1279	3203	3	\N	1	2018-01-01		0	1	
1287	3221	2	\N	1	2018-01-01		0	1	
1295	3233	1	\N	1	2018-01-01		0	1	
1303	3248	3	2	1	2018-01-01		0	1	
1311	3268	3	2	1	2018-01-01		0	1	
1319	3281	2	2	1	2018-01-01		0	1	
1327	3297	3	2	1	2018-01-01		0	1	
1335	3319	3	2	1	2018-01-01		0	1	
1343	3348	2	\N	1	2018-01-01		0	1	
1351	3363	3	2	1	2018-01-01		0	1	
1359	3388	2	\N	1	2018-01-01		0	1	
1367	3419	3	2	1	2018-01-01		0	1	
1375	3433	2	\N	1	2018-01-01		0	1	
1383	3450	1	\N	1	2018-01-01		0	1	
1391	3473	3	\N	1	2018-01-01		0	1	
1399	3494	3	2	1	2018-01-01		0	1	
1407	3522	2	\N	1	2018-01-01		0	1	
1415	3548	3	2	1	2018-01-01		0	1	
1423	3579	1	2	1	2018-01-01		0	1	
1431	3595	3	\N	1	2018-01-01		0	1	
1439	3612	1	\N	1	2018-01-01		0	1	
1447	3628	2	\N	1	2018-01-01		0	1	
1455	3645	2	2	1	2018-01-01		0	1	
1463	3674	3	2	1	2018-01-01		0	1	
1471	3697	2	\N	1	2018-01-01		0	1	
1479	3713	3	2	1	2018-01-01		0	1	
1487	3733	3	2	1	2018-01-01		0	1	
1495	3750	2	\N	1	2018-01-01		0	1	
1503	3773	2	\N	1	2018-01-01		0	1	
1511	3788	3	\N	1	2018-01-01		0	1	
1519	3802	2	2	1	2018-01-01		0	1	
1527	3823	2	\N	1	2018-01-01		0	1	
1535	3851	2	2	1	2018-01-01		0	1	
1543	3867	3	5	1	2018-01-01		0	1	
1551	3882	3	5	1	2018-01-01		0	1	
1559	3897	3	2	1	2018-01-01		0	1	
1567	3910	3	2	1	2018-01-01		0	1	
1575	3934	3	2	1	2018-01-01		0	1	
1583	3951	3	2	1	2018-01-01		0	1	
1591	3965	2	2	1	2018-01-01		0	1	
1599	3992	3	2	1	2018-01-01		0	1	
1607	4012	2	\N	1	2018-01-01		0	1	
1615	4030	3	\N	1	2018-01-01		0	1	
1623	4051	2	\N	1	2018-01-01		0	1	
1631	4070	2	\N	1	2018-01-01		0	1	
1639	4095	2	2	1	2018-01-01		0	1	
1647	4112	3	\N	1	2018-01-01		0	1	
1655	4126	3	6	1	2018-01-01		0	1	
1663	4156	2	2	1	2018-01-01		0	1	
1671	4172	3	\N	1	2018-01-01		0	1	
1679	4195	2	\N	1	2018-01-01		0	1	
1687	4218	2	\N	1	2018-01-01		0	1	
1695	4239	2	2	1	2018-01-01		0	1	
2259	5601	2	2	1	2018-01-01		0	1	
900	2212	2	\N	1	2018-01-01		0	1	
908	2234	3	\N	1	2018-01-01		0	1	
916	2256	2	\N	1	2018-01-01		0	1	
924	2275	2	\N	1	2018-01-01		0	1	
932	2313	2	\N	1	2018-01-01		0	1	
940	2328	1	\N	1	2018-01-01		0	1	
948	2352	2	\N	1	2018-01-01		0	1	
956	2371	3	\N	1	2018-01-01		0	1	
964	2392	2	2	1	2018-01-01		0	1	
972	2411	3	2	1	2018-01-01		0	1	
980	2428	3	6	1	2018-01-01		0	1	
988	2439	2	\N	1	2018-01-01		0	1	
996	2477	3	\N	1	2018-01-01		0	1	
1004	2492	2	\N	1	2018-01-01		0	1	
1012	2524	1	2	1	2018-01-01		0	1	
1020	2546	2	1	1	2018-01-01		0	1	
1028	2571	2	\N	1	2018-01-01		0	1	
1036	2590	2	4	1	2018-01-01		0	1	
1044	2611	2	\N	1	2018-01-01		0	1	
1052	2645	3	5	1	2018-01-01		0	1	
1060	2659	2	\N	1	2018-01-01		0	1	
1068	2675	3	1	1	2018-01-01		0	1	
1076	2702	1	\N	1	2018-01-01		0	1	
1084	2724	3	\N	1	2018-01-01		0	1	
1092	2742	2	\N	1	2018-01-01		0	1	
1100	2753	3	6	1	2018-01-01		0	1	
1108	2780	2	\N	1	2018-01-01		0	1	
1116	2801	2	2	1	2018-01-01		0	1	
1124	2817	3	\N	1	2018-01-01		0	1	
1132	2835	3	\N	1	2018-01-01		0	1	
1140	2865	2	\N	1	2018-01-01		0	1	
1148	2882	2	\N	1	2018-01-01		0	1	
1156	2897	2	2	1	2018-01-01		0	1	
1164	2912	3	4	1	2018-01-01		0	1	
1172	2941	2	\N	1	2018-01-01		0	1	
1180	2960	2	1	1	2018-01-01		0	1	
1188	2975	3	2	1	2018-01-01		0	1	
1196	2999	3	2	1	2018-01-01		0	1	
1204	3015	2	2	1	2018-01-01		0	1	
1212	3037	2	\N	1	2018-01-01		0	1	
1220	3053	2	\N	1	2018-01-01		0	1	
1228	3076	3	2	1	2018-01-01		0	1	
1236	3090	3	\N	1	2018-01-01		0	1	
1244	3109	3	7	1	2018-01-01		0	1	
1252	3133	2	\N	1	2018-01-01		0	1	
1260	3146	3	\N	1	2018-01-01		0	1	
1268	3169	3	\N	1	2018-01-01		0	1	
1276	3194	3	\N	1	2018-01-01		0	1	
1284	3213	3	2	1	2018-01-01		0	1	
1292	3227	3	6	1	2018-01-01		0	1	
1300	3244	2	\N	1	2018-01-01		0	1	
1308	3262	2	\N	1	2018-01-01		0	1	
1316	3274	3	\N	1	2018-01-01		0	1	
1324	3294	3	\N	1	2018-01-01		0	1	
1332	3308	2	1	1	2018-01-01		0	1	
1340	3337	2	\N	1	2018-01-01		0	1	
1348	3357	3	\N	1	2018-01-01		0	1	
1356	3379	2	\N	1	2018-01-01		0	1	
1364	3409	3	2	1	2018-01-01		0	1	
1372	3429	2	1	1	2018-01-01		0	1	
1380	3445	2	\N	1	2018-01-01		0	1	
1388	3470	2	\N	1	2018-01-01		0	1	
1396	3480	2	\N	1	2018-01-01		0	1	
1404	3506	3	4	1	2018-01-01		0	1	
1412	3542	2	\N	1	2018-01-01		0	1	
1420	3560	3	6	1	2018-01-01		0	1	
1428	3592	2	2	1	2018-01-01		0	1	
1436	3605	2	2	1	2018-01-01		0	1	
1444	3621	1	\N	1	2018-01-01		0	1	
1452	3639	3	\N	1	2018-01-01		0	1	
1460	3661	2	\N	1	2018-01-01		0	1	
1468	3684	1	2	1	2018-01-01		0	1	
1476	3706	3	2	1	2018-01-01		0	1	
1484	3727	3	1	1	2018-01-01		0	1	
1492	3744	2	\N	1	2018-01-01		0	1	
1500	3758	2	\N	1	2018-01-01		0	1	
1508	3780	2	\N	1	2018-01-01		0	1	
1516	3797	2	\N	1	2018-01-01		0	1	
1524	3810	2	\N	1	2018-01-01		0	1	
1532	3836	2	\N	1	2018-01-01		0	1	
1540	3863	2	\N	1	2018-01-01		0	1	
1548	3874	\N	2	1	2018-01-01		0	1	
1556	3889	3	6	1	2018-01-01		0	1	
1564	3903	2	2	1	2018-01-01		0	1	
1572	3925	1	\N	1	2018-01-01		0	1	
1580	3942	2	\N	1	2018-01-01		0	1	
1588	3961	2	2	1	2018-01-01		0	1	
1596	3982	3	2	1	2018-01-01		0	1	
1604	4003	3	\N	1	2018-01-01		0	1	
1612	4020	2	2	1	2018-01-01		0	1	
1620	4047	3	2	1	2018-01-01		0	1	
1628	4060	3	2	1	2018-01-01		0	1	
1636	4086	2	\N	1	2018-01-01		0	1	
1644	4106	2	\N	1	2018-01-01		0	1	
1652	4117	2	2	1	2018-01-01		0	1	
1660	4143	\N	6	1	2018-01-01		0	1	
1668	4167	3	2	1	2018-01-01		0	1	
1676	4184	2	\N	1	2018-01-01		0	1	
1684	4209	3	\N	1	2018-01-01		0	1	
1692	4233	3	\N	1	2018-01-01		0	1	
1700	4253	2	\N	1	2018-01-01		0	1	
1708	4278	2	\N	1	2018-01-01		0	1	
1716	4301	2	\N	1	2018-01-01		0	1	
1724	4319	3	2	1	2018-01-01		0	1	
1732	4341	2	\N	1	2018-01-01		0	1	
1740	4361	2	\N	1	2018-01-01		0	1	
1748	4374	2	\N	1	2018-01-01		0	1	
1756	4392	2	\N	1	2018-01-01		0	1	
1764	4409	3	\N	1	2018-01-01		0	1	
1772	4422	2	\N	1	2018-01-01		0	1	
1780	4436	3	2	1	2018-01-01		0	1	
896	2204	2	\N	1	2018-01-01		0	1	
904	2217	2	\N	1	2018-01-01		0	1	
912	2241	2	\N	1	2018-01-01		0	1	
920	2268	3	1	1	2018-01-01		0	1	
928	2302	1	\N	1	2018-01-01		0	1	
936	2320	3	\N	1	2018-01-01		0	1	
944	2336	2	\N	1	2018-01-01		0	1	
952	2360	2	\N	1	2018-01-01		0	1	
960	2377	2	\N	1	2018-01-01		0	1	
968	2399	3	\N	1	2018-01-01		0	1	
976	2420	3	\N	1	2018-01-01		0	1	
984	2435	2	\N	1	2018-01-01		0	1	
992	2468	3	2	1	2018-01-01		0	1	
1000	2482	3	\N	1	2018-01-01		0	1	
1008	2514	2	2	1	2018-01-01		0	1	
1016	2535	3	\N	1	2018-01-01		0	1	
1024	2565	2	\N	1	2018-01-01		0	1	
1032	2582	2	\N	1	2018-01-01		0	1	
1040	2598	2	\N	1	2018-01-01		0	1	
1048	2628	3	2	1	2018-01-01		0	1	
1056	2653	2	2	1	2018-01-01		0	1	
1064	2668	2	\N	1	2018-01-01		0	1	
1072	2685	2	\N	1	2018-01-01		0	1	
1080	2711	2	\N	1	2018-01-01		0	1	
1088	2735	2	\N	1	2018-01-01		0	1	
1096	2746	2	2	1	2018-01-01		0	1	
1104	2766	2	2	1	2018-01-01		0	1	
1112	2790	2	\N	1	2018-01-01		0	1	
1120	2813	2	2	1	2018-01-01		0	1	
1128	2823	3	7	1	2018-01-01		0	1	
1136	2843	2	\N	1	2018-01-01		0	1	
1144	2872	2	2	1	2018-01-01		0	1	
1152	2889	2	2	1	2018-01-01		0	1	
1160	2905	3	6	1	2018-01-01		0	1	
1168	2932	2	\N	1	2018-01-01		0	1	
1176	2949	3	2	1	2018-01-01		0	1	
1184	2968	2	2	1	2018-01-01		0	1	
1192	2985	2	\N	1	2018-01-01		0	1	
1200	3008	3	2	1	2018-01-01		0	1	
1208	3030	2	\N	1	2018-01-01		0	1	
1216	3045	3	7	1	2018-01-01		0	1	
1224	3067	1	2	1	2018-01-01		0	1	
1232	3084	3	2	1	2018-01-01		0	1	
1240	3099	2	\N	1	2018-01-01		0	1	
1248	3118	2	\N	1	2018-01-01		0	1	
1256	3138	2	\N	1	2018-01-01		0	1	
1264	3158	1	\N	1	2018-01-01		0	1	
1272	3180	3	6	1	2018-01-01		0	1	
1280	3205	1	2	1	2018-01-01		0	1	
1288	3222	2	2	1	2018-01-01		0	1	
1296	3234	3	6	1	2018-01-01		0	1	
1304	3249	3	\N	1	2018-01-01		0	1	
1312	3269	2	\N	1	2018-01-01		0	1	
1320	3283	2	\N	1	2018-01-01		0	1	
1328	3298	2	\N	1	2018-01-01		0	1	
1336	3322	2	\N	1	2018-01-01		0	1	
1344	3350	2	\N	1	2018-01-01		0	1	
1352	3367	2	\N	1	2018-01-01		0	1	
1360	3393	2	2	1	2018-01-01		0	1	
1368	3422	3	2	1	2018-01-01		0	1	
1376	3434	3	2	1	2018-01-01		0	1	
1384	3455	3	7	1	2018-01-01		0	1	
1392	3474	2	2	1	2018-01-01		0	1	
1400	3497	2	\N	1	2018-01-01		0	1	
1408	3524	3	\N	1	2018-01-01		0	1	
1416	3549	2	1	1	2018-01-01		0	1	
1424	3581	2	\N	1	2018-01-01		0	1	
1432	3596	1	2	1	2018-01-01		0	1	
1440	3613	3	6	1	2018-01-01		0	1	
1448	3630	2	\N	1	2018-01-01		0	1	
1456	3647	1	2	1	2018-01-01		0	1	
1464	3675	2	\N	1	2018-01-01		0	1	
1472	3698	3	\N	1	2018-01-01		0	1	
1480	3716	3	2	1	2018-01-01		0	1	
1488	3735	2	\N	1	2018-01-01		0	1	
1496	3751	2	2	1	2018-01-01		0	1	
1504	3775	\N	2	1	2018-01-01		0	1	
1512	3789	3	4	1	2018-01-01		0	1	
1520	3803	2	\N	1	2018-01-01		0	1	
1528	3824	\N	2	1	2018-01-01		0	1	
1536	3854	3	1	1	2018-01-01		0	1	
1544	3868	2	1	1	2018-01-01		0	1	
1552	3883	3	\N	1	2018-01-01		0	1	
1560	3899	2	2	1	2018-01-01		0	1	
1568	3913	2	\N	1	2018-01-01		0	1	
1576	3936	3	\N	1	2018-01-01		0	1	
1584	3953	3	\N	1	2018-01-01		0	1	
1592	3968	2	\N	1	2018-01-01		0	1	
1600	3993	3	2	1	2018-01-01		0	1	
1608	4013	3	\N	1	2018-01-01		0	1	
1616	4031	2	\N	1	2018-01-01		0	1	
1624	4054	2	2	1	2018-01-01		0	1	
1632	4078	2	\N	1	2018-01-01		0	1	
1640	4100	2	\N	1	2018-01-01		0	1	
1648	4113	2	\N	1	2018-01-01		0	1	
1656	4127	3	\N	1	2018-01-01		0	1	
1664	4158	3	\N	1	2018-01-01		0	1	
1672	4178	3	2	1	2018-01-01		0	1	
1680	4197	2	2	1	2018-01-01		0	1	
1688	4220	2	\N	1	2018-01-01		0	1	
1696	4240	2	\N	1	2018-01-01		0	1	
1704	4261	3	2	1	2018-01-01		0	1	
1712	4293	3	2	1	2018-01-01		0	1	
1720	4312	3	6	1	2018-01-01		0	1	
1728	4325	2	\N	1	2018-01-01		0	1	
1736	4351	2	\N	1	2018-01-01		0	1	
1744	4368	2	\N	1	2018-01-01		0	1	
1752	4384	3	2	1	2018-01-01		0	1	
1760	4404	2	\N	1	2018-01-01		0	1	
1768	4416	2	\N	1	2018-01-01		0	1	
1776	4427	3	2	1	2018-01-01		0	1	
1784	4444	2	\N	1	2018-01-01		0	1	
929	2307	2	\N	1	2018-01-01		0	1	
937	2323	2	\N	1	2018-01-01		0	1	
945	2337	3	\N	1	2018-01-01		0	1	
953	2365	2	\N	1	2018-01-01		0	1	
961	2383	1	\N	1	2018-01-01		0	1	
969	2404	\N	7	1	2018-01-01		0	1	
977	2422	2	\N	1	2018-01-01		0	1	
985	2436	3	\N	1	2018-01-01		0	1	
993	2469	3	1	1	2018-01-01		0	1	
1001	2483	3	\N	1	2018-01-01		0	1	
1009	2515	2	\N	1	2018-01-01		0	1	
1017	2537	3	2	1	2018-01-01		0	1	
1025	2566	2	2	1	2018-01-01		0	1	
1033	2583	1	2	1	2018-01-01		0	1	
1041	2600	3	6	1	2018-01-01		0	1	
1049	2629	3	1	1	2018-01-01		0	1	
1057	2655	2	\N	1	2018-01-01		0	1	
1065	2669	2	\N	1	2018-01-01		0	1	
1073	2689	3	\N	1	2018-01-01		0	1	
1081	2714	3	6	1	2018-01-01		0	1	
1089	2736	2	\N	1	2018-01-01		0	1	
1097	2747	2	\N	1	2018-01-01		0	1	
1105	2771	2	\N	1	2018-01-01		0	1	
1113	2791	2	\N	1	2018-01-01		0	1	
1121	2814	3	6	1	2018-01-01		0	1	
1129	2828	3	\N	1	2018-01-01		0	1	
1137	2855	3	\N	1	2018-01-01		0	1	
1145	2873	3	2	1	2018-01-01		0	1	
1153	2891	2	\N	1	2018-01-01		0	1	
1161	2906	2	\N	1	2018-01-01		0	1	
1169	2935	2	\N	1	2018-01-01		0	1	
1177	2951	2	\N	1	2018-01-01		0	1	
1185	2969	3	\N	1	2018-01-01		0	1	
1193	2989	2	\N	1	2018-01-01		0	1	
1201	3009	2	\N	1	2018-01-01		0	1	
1209	3031	3	2	1	2018-01-01		0	1	
1217	3047	3	6	1	2018-01-01		0	1	
1225	3068	2	\N	1	2018-01-01		0	1	
1233	3085	3	2	1	2018-01-01		0	1	
1241	3100	\N	2	1	2018-01-01		0	1	
1249	3123	2	\N	1	2018-01-01		0	1	
1257	3141	3	\N	1	2018-01-01		0	1	
1265	3161	2	1	1	2018-01-01		0	1	
1273	3185	3	2	1	2018-01-01		0	1	
1281	3206	2	\N	1	2018-01-01		0	1	
1289	3224	2	\N	1	2018-01-01		0	1	
1297	3235	2	\N	1	2018-01-01		0	1	
1305	3252	3	2	1	2018-01-01		0	1	
1313	3270	3	\N	1	2018-01-01		0	1	
1321	3286	2	\N	1	2018-01-01		0	1	
1329	3300	3	6	1	2018-01-01		0	1	
1337	3328	2	\N	1	2018-01-01		0	1	
1345	3352	3	\N	1	2018-01-01		0	1	
1353	3372	3	6	1	2018-01-01		0	1	
1361	3397	2	1	1	2018-01-01		0	1	
1369	3423	2	\N	1	2018-01-01		0	1	
1377	3440	3	\N	1	2018-01-01		0	1	
1385	3462	3	2	1	2018-01-01		0	1	
1393	3475	3	6	1	2018-01-01		0	1	
1401	3498	2	\N	1	2018-01-01		0	1	
1409	3530	3	2	1	2018-01-01		0	1	
1417	3551	2	\N	1	2018-01-01		0	1	
1425	3582	3	\N	1	2018-01-01		0	1	
1433	3601	3	2	1	2018-01-01		0	1	
1441	3614	2	1	1	2018-01-01		0	1	
1449	3631	\N	2	1	2018-01-01		0	1	
1457	3649	3	\N	1	2018-01-01		0	1	
1465	3677	2	\N	1	2018-01-01		0	1	
1473	3700	3	\N	1	2018-01-01		0	1	
1481	3722	2	2	1	2018-01-01		0	1	
1489	3738	3	5	1	2018-01-01		0	1	
1497	3752	3	\N	1	2018-01-01		0	1	
1505	3776	3	2	1	2018-01-01		0	1	
1513	3790	3	2	1	2018-01-01		0	1	
1521	3804	1	\N	1	2018-01-01		0	1	
1529	3825	3	\N	1	2018-01-01		0	1	
1537	3857	2	\N	1	2018-01-01		0	1	
1545	3869	\N	5	1	2018-01-01		0	1	
1553	3884	3	2	1	2018-01-01		0	1	
1561	3900	2	\N	1	2018-01-01		0	1	
1569	3919	2	2	1	2018-01-01		0	1	
1577	3937	3	\N	1	2018-01-01		0	1	
1585	3954	2	\N	1	2018-01-01		0	1	
1593	3969	2	\N	1	2018-01-01		0	1	
1601	3996	3	2	1	2018-01-01		0	1	
1609	4017	3	2	1	2018-01-01		0	1	
1617	4033	3	2	1	2018-01-01		0	1	
1625	4055	3	2	1	2018-01-01		0	1	
1633	4079	3	2	1	2018-01-01		0	1	
1641	4101	\N	5	1	2018-01-01		0	1	
1649	4114	2	\N	1	2018-01-01		0	1	
1657	4129	2	1	1	2018-01-01		0	1	
1665	4159	2	\N	1	2018-01-01		0	1	
1673	4181	\N	2	1	2018-01-01		0	1	
1681	4199	3	7	1	2018-01-01		0	1	
1689	4221	1	2	1	2018-01-01		0	1	
1697	4241	2	\N	1	2018-01-01		0	1	
1705	4268	3	\N	1	2018-01-01		0	1	
1713	4296	2	\N	1	2018-01-01		0	1	
1721	4313	3	2	1	2018-01-01		0	1	
1729	4326	3	\N	1	2018-01-01		0	1	
1737	4352	2	\N	1	2018-01-01		0	1	
1745	4369	2	\N	1	2018-01-01		0	1	
1753	4385	2	\N	1	2018-01-01		0	1	
1761	4405	3	2	1	2018-01-01		0	1	
1769	4418	2	\N	1	2018-01-01		0	1	
1777	4428	3	\N	1	2018-01-01		0	1	
1785	4446	3	2	1	2018-01-01		0	1	
1793	4462	2	\N	1	2018-01-01		0	1	
1801	4476	2	1	1	2018-01-01		0	1	
1809	4494	1	2	1	2018-01-01		0	1	
1817	4521	3	2	1	2018-01-01		0	1	
954	2369	2	2	1	2018-01-01		0	1	
962	2387	2	\N	1	2018-01-01		0	1	
970	2407	2	\N	1	2018-01-01		0	1	
978	2424	3	2	1	2018-01-01		0	1	
986	2437	3	6	1	2018-01-01		0	1	
994	2471	2	\N	1	2018-01-01		0	1	
1002	2484	3	2	1	2018-01-01		0	1	
1010	2517	2	\N	1	2018-01-01		0	1	
1018	2538	2	\N	1	2018-01-01		0	1	
1026	2569	2	2	1	2018-01-01		0	1	
1034	2584	2	2	1	2018-01-01		0	1	
1042	2605	3	6	1	2018-01-01		0	1	
1050	2639	2	2	1	2018-01-01		0	1	
1058	2656	3	6	1	2018-01-01		0	1	
1066	2671	1	\N	1	2018-01-01		0	1	
1074	2694	2	1	1	2018-01-01		0	1	
1082	2717	2	\N	1	2018-01-01		0	1	
1090	2738	3	6	1	2018-01-01		0	1	
1098	2748	3	\N	1	2018-01-01		0	1	
1106	2774	2	\N	1	2018-01-01		0	1	
1114	2793	3	7	1	2018-01-01		0	1	
1122	2815	2	1	1	2018-01-01		0	1	
1130	2831	2	\N	1	2018-01-01		0	1	
1138	2861	2	\N	1	2018-01-01		0	1	
1146	2874	2	\N	1	2018-01-01		0	1	
1154	2893	2	\N	1	2018-01-01		0	1	
1162	2909	2	2	1	2018-01-01		0	1	
1170	2936	3	\N	1	2018-01-01		0	1	
1178	2957	3	\N	1	2018-01-01		0	1	
1186	2970	2	\N	1	2018-01-01		0	1	
1194	2993	2	\N	1	2018-01-01		0	1	
1202	3013	2	\N	1	2018-01-01		0	1	
1210	3033	2	\N	1	2018-01-01		0	1	
1218	3048	2	\N	1	2018-01-01		0	1	
1226	3070	3	\N	1	2018-01-01		0	1	
1234	3088	2	\N	1	2018-01-01		0	1	
1242	3101	3	2	1	2018-01-01		0	1	
1250	3125	3	\N	1	2018-01-01		0	1	
1258	3142	2	\N	1	2018-01-01		0	1	
1266	3165	3	2	1	2018-01-01		0	1	
1274	3191	2	\N	1	2018-01-01		0	1	
1282	3209	2	\N	1	2018-01-01		0	1	
1290	3225	2	\N	1	2018-01-01		0	1	
1298	3239	3	2	1	2018-01-01		0	1	
1306	3254	3	\N	1	2018-01-01		0	1	
1314	3272	3	\N	1	2018-01-01		0	1	
1322	3288	3	2	1	2018-01-01		0	1	
1330	3304	2	\N	1	2018-01-01		0	1	
1338	3335	2	\N	1	2018-01-01		0	1	
1346	3353	3	\N	1	2018-01-01		0	1	
1354	3373	3	\N	1	2018-01-01		0	1	
1362	3398	3	6	1	2018-01-01		0	1	
1370	3426	2	\N	1	2018-01-01		0	1	
1378	3442	2	2	1	2018-01-01		0	1	
1386	3463	3	6	1	2018-01-01		0	1	
1394	3477	3	\N	1	2018-01-01		0	1	
1402	3500	2	2	1	2018-01-01		0	1	
1410	3532	3	2	1	2018-01-01		0	1	
1418	3554	2	\N	1	2018-01-01		0	1	
1426	3584	2	\N	1	2018-01-01		0	1	
1434	3602	3	2	1	2018-01-01		0	1	
1442	3615	3	\N	1	2018-01-01		0	1	
1450	3636	2	\N	1	2018-01-01		0	1	
1458	3651	1	\N	1	2018-01-01		0	1	
1466	3680	2	\N	1	2018-01-01		0	1	
1474	3702	2	\N	1	2018-01-01		0	1	
1482	3725	2	\N	1	2018-01-01		0	1	
1490	3741	2	2	1	2018-01-01		0	1	
1498	3754	2	\N	1	2018-01-01		0	1	
1506	3778	3	2	1	2018-01-01		0	1	
1514	3792	3	\N	1	2018-01-01		0	1	
1522	3805	3	2	1	2018-01-01		0	1	
1530	3827	3	2	1	2018-01-01		0	1	
1538	3860	2	\N	1	2018-01-01		0	1	
1546	3870	2	\N	1	2018-01-01		0	1	
1554	3886	2	\N	1	2018-01-01		0	1	
1562	3901	2	\N	1	2018-01-01		0	1	
1570	3921	3	2	1	2018-01-01		0	1	
1578	3938	2	1	1	2018-01-01		0	1	
1586	3956	3	\N	1	2018-01-01		0	1	
1594	3974	2	\N	1	2018-01-01		0	1	
1602	4000	2	2	1	2018-01-01		0	1	
1610	4018	2	\N	1	2018-01-01		0	1	
1618	4040	2	\N	1	2018-01-01		0	1	
1626	4056	3	5	1	2018-01-01		0	1	
1634	4083	1	\N	1	2018-01-01		0	1	
1642	4104	3	2	1	2018-01-01		0	1	
1650	4115	3	2	1	2018-01-01		0	1	
1658	4131	2	\N	1	2018-01-01		0	1	
1666	4162	1	\N	1	2018-01-01		0	1	
1674	4182	3	7	1	2018-01-01		0	1	
1682	4200	3	1	1	2018-01-01		0	1	
1690	4222	3	\N	1	2018-01-01		0	1	
1698	4244	2	1	1	2018-01-01		0	1	
1706	4276	1	\N	1	2018-01-01		0	1	
1714	4297	1	2	1	2018-01-01		0	1	
1722	4315	3	2	1	2018-01-01		0	1	
1730	4331	1	2	1	2018-01-01		0	1	
1738	4355	2	\N	1	2018-01-01		0	1	
1746	4370	2	\N	1	2018-01-01		0	1	
1754	4386	3	\N	1	2018-01-01		0	1	
1762	4406	2	2	1	2018-01-01		0	1	
1770	4419	3	\N	1	2018-01-01		0	1	
1778	4429	2	\N	1	2018-01-01		0	1	
1786	4449	3	2	1	2018-01-01		0	1	
1794	4467	2	\N	1	2018-01-01		0	1	
1802	4479	2	\N	1	2018-01-01		0	1	
1810	4495	3	2	1	2018-01-01		0	1	
1818	4522	2	\N	1	2018-01-01		0	1	
1826	4538	3	2	1	2018-01-01		0	1	
1834	4555	2	\N	1	2018-01-01		0	1	
1842	4577	3	6	1	2018-01-01		0	1	
1371	3428	2	2	1	2018-01-01		0	1	
1379	3443	3	2	1	2018-01-01		0	1	
1387	3466	2	\N	1	2018-01-01		0	1	
1395	3478	3	\N	1	2018-01-01		0	1	
1403	3502	3	\N	1	2018-01-01		0	1	
1411	3541	2	2	1	2018-01-01		0	1	
1419	3557	3	\N	1	2018-01-01		0	1	
1427	3588	2	2	1	2018-01-01		0	1	
1435	3604	3	\N	1	2018-01-01		0	1	
1443	3616	3	\N	1	2018-01-01		0	1	
1451	3638	3	\N	1	2018-01-01		0	1	
1459	3652	2	\N	1	2018-01-01		0	1	
1467	3683	2	\N	1	2018-01-01		0	1	
1475	3704	3	2	1	2018-01-01		0	1	
1483	3726	2	1	1	2018-01-01		0	1	
1491	3742	3	\N	1	2018-01-01		0	1	
1499	3755	2	\N	1	2018-01-01		0	1	
1507	3779	2	\N	1	2018-01-01		0	1	
1515	3796	2	\N	1	2018-01-01		0	1	
1523	3806	1	\N	1	2018-01-01		0	1	
1531	3828	2	\N	1	2018-01-01		0	1	
1539	3862	3	2	1	2018-01-01		0	1	
1547	3871	2	\N	1	2018-01-01		0	1	
1555	3888	2	2	1	2018-01-01		0	1	
1563	3902	3	\N	1	2018-01-01		0	1	
1571	3924	3	2	1	2018-01-01		0	1	
1579	3939	3	2	1	2018-01-01		0	1	
1587	3959	2	\N	1	2018-01-01		0	1	
1595	3977	2	\N	1	2018-01-01		0	1	
1603	4002	2	\N	1	2018-01-01		0	1	
1611	4019	2	2	1	2018-01-01		0	1	
1619	4043	2	\N	1	2018-01-01		0	1	
1627	4059	3	2	1	2018-01-01		0	1	
1635	4084	2	1	1	2018-01-01		0	1	
1643	4105	3	2	1	2018-01-01		0	1	
1651	4116	2	\N	1	2018-01-01		0	1	
1659	4138	2	\N	1	2018-01-01		0	1	
1667	4166	2	\N	1	2018-01-01		0	1	
1675	4183	2	\N	1	2018-01-01		0	1	
1683	4204	\N	2	1	2018-01-01		0	1	
1691	4229	2	\N	1	2018-01-01		0	1	
1699	4252	2	\N	1	2018-01-01		0	1	
1707	4277	2	\N	1	2018-01-01		0	1	
1715	4300	\N	2	1	2018-01-01		0	1	
1723	4317	2	\N	1	2018-01-01		0	1	
1731	4338	2	\N	1	2018-01-01		0	1	
1739	4358	3	2	1	2018-01-01		0	1	
1747	4371	2	\N	1	2018-01-01		0	1	
1755	4391	3	2	1	2018-01-01		0	1	
1763	4407	2	\N	1	2018-01-01		0	1	
1771	4421	3	4	1	2018-01-01		0	1	
1779	4430	2	\N	1	2018-01-01		0	1	
1787	4451	3	\N	1	2018-01-01		0	1	
1795	4468	2	\N	1	2018-01-01		0	1	
1803	4482	3	7	1	2018-01-01		0	1	
1811	4502	3	2	1	2018-01-01		0	1	
1819	4523	3	2	1	2018-01-01		0	1	
1827	4542	2	\N	1	2018-01-01		0	1	
1835	4559	3	2	1	2018-01-01		0	1	
1843	4578	2	\N	1	2018-01-01		0	1	
1851	4594	2	2	1	2018-01-01		0	1	
1859	4604	2	1	1	2018-01-01		0	1	
1867	4633	1	2	1	2018-01-01		0	1	
1875	4664	2	\N	1	2018-01-01		0	1	
1883	4691	3	2	1	2018-01-01		0	1	
1891	4711	2	\N	1	2018-01-01		0	1	
1899	4736	3	2	1	2018-01-01		0	1	
1907	4753	2	\N	1	2018-01-01		0	1	
1915	4771	2	\N	1	2018-01-01		0	1	
1923	4789	2	\N	1	2018-01-01		0	1	
1931	4805	2	2	1	2018-01-01		0	1	
1939	4818	2	\N	1	2018-01-01		0	1	
1947	4841	2	\N	1	2018-01-01		0	1	
1955	4856	1	2	1	2018-01-01		0	1	
1963	4881	2	\N	1	2018-01-01		0	1	
1971	4895	2	\N	1	2018-01-01		0	1	
1979	4909	2	\N	1	2018-01-01		0	1	
1987	4936	2	\N	1	2018-01-01		0	1	
1995	4965	2	\N	1	2018-01-01		0	1	
2003	4978	2	\N	1	2018-01-01		0	1	
2011	5001	2	\N	1	2018-01-01		0	1	
2019	5017	2	\N	1	2018-01-01		0	1	
2027	5034	3	2	1	2018-01-01		0	1	
2035	5053	3	2	1	2018-01-01		0	1	
2043	5067	2	\N	1	2018-01-01		0	1	
2051	5085	2	\N	1	2018-01-01		0	1	
2059	5106	3	2	1	2018-01-01		0	1	
2067	5120	2	\N	1	2018-01-01		0	1	
2075	5138	2	\N	1	2018-01-01		0	1	
2083	5157	3	2	1	2018-01-01		0	1	
2091	5181	2	\N	1	2018-01-01		0	1	
2099	5200	\N	5	1	2018-01-01		0	1	
2107	5226	2	\N	1	2018-01-01		0	1	
2115	5243	2	\N	1	2018-01-01		0	1	
2123	5276	2	\N	1	2018-01-01		0	1	
2131	5301	2	\N	1	2018-01-01		0	1	
2139	5321	\N	6	1	2018-01-01		0	1	
2147	5340	2	2	1	2018-01-01		0	1	
2155	5360	2	\N	1	2018-01-01		0	1	
2163	5382	3	5	1	2018-01-01		0	1	
2171	5393	3	6	1	2018-01-01		0	1	
2179	5412	3	\N	1	2018-01-01		0	1	
2187	5430	2	\N	1	2018-01-01		0	1	
2195	5450	3	2	1	2018-01-01		0	1	
2203	5465	3	\N	1	2018-01-01		0	1	
2211	5483	3	2	1	2018-01-01		0	1	
2219	5502	2	\N	1	2018-01-01		0	1	
2227	5526	3	1	1	2018-01-01		0	1	
2235	5549	2	2	1	2018-01-01		0	1	
2243	5563	3	\N	1	2018-01-01		0	1	
2251	5584	1	\N	1	2018-01-01		0	1	
805	1967	3	\N	1	2018-01-01		0	1	
813	1984	3	\N	1	2018-01-01		0	1	
821	2002	2	2	1	2018-01-01		0	1	
829	2020	3	7	1	2018-01-01		0	1	
837	2033	2	1	1	2018-01-01		0	1	
845	2054	3	6	1	2018-01-01		0	1	
853	2075	2	\N	1	2018-01-01		0	1	
861	2101	2	\N	1	2018-01-01		0	1	
869	2131	2	\N	1	2018-01-01		0	1	
877	2148	3	2	1	2018-01-01		0	1	
885	2169	2	\N	1	2018-01-01		0	1	
893	2198	2	\N	1	2018-01-01		0	1	
901	2214	3	2	1	2018-01-01		0	1	
909	2236	3	\N	1	2018-01-01		0	1	
917	2258	3	2	1	2018-01-01		0	1	
925	2278	2	1	1	2018-01-01		0	1	
933	2315	3	\N	1	2018-01-01		0	1	
941	2331	3	2	1	2018-01-01		0	1	
949	2353	2	\N	1	2018-01-01		0	1	
957	2373	3	2	1	2018-01-01		0	1	
965	2395	3	2	1	2018-01-01		0	1	
973	2412	2	\N	1	2018-01-01		0	1	
981	2429	3	\N	1	2018-01-01		0	1	
989	2447	3	7	1	2018-01-01		0	1	
997	2478	2	2	1	2018-01-01		0	1	
1005	2494	3	\N	1	2018-01-01		0	1	
1013	2525	2	1	1	2018-01-01		0	1	
1021	2547	2	\N	1	2018-01-01		0	1	
1029	2575	3	\N	1	2018-01-01		0	1	
1037	2591	3	7	1	2018-01-01		0	1	
1045	2614	2	\N	1	2018-01-01		0	1	
1053	2646	1	\N	1	2018-01-01		0	1	
1061	2660	2	\N	1	2018-01-01		0	1	
1069	2678	1	\N	1	2018-01-01		0	1	
1077	2703	1	\N	1	2018-01-01		0	1	
1085	2726	2	\N	1	2018-01-01		0	1	
1093	2743	2	1	1	2018-01-01		0	1	
1101	2758	1	2	1	2018-01-01		0	1	
1109	2784	3	\N	1	2018-01-01		0	1	
1117	2803	3	\N	1	2018-01-01		0	1	
1125	2819	3	2	1	2018-01-01		0	1	
1133	2836	2	2	1	2018-01-01		0	1	
1141	2867	3	\N	1	2018-01-01		0	1	
1149	2885	3	6	1	2018-01-01		0	1	
1157	2898	3	\N	1	2018-01-01		0	1	
1165	2914	2	\N	1	2018-01-01		0	1	
1173	2942	2	\N	1	2018-01-01		0	1	
1181	2962	3	2	1	2018-01-01		0	1	
1189	2980	2	\N	1	2018-01-01		0	1	
1197	3003	3	2	1	2018-01-01		0	1	
1205	3024	\N	2	1	2018-01-01		0	1	
1213	3039	1	\N	1	2018-01-01		0	1	
1221	3057	2	\N	1	2018-01-01		0	1	
1229	3078	2	\N	1	2018-01-01		0	1	
1237	3091	2	\N	1	2018-01-01		0	1	
1245	3110	1	\N	1	2018-01-01		0	1	
1253	3134	2	\N	1	2018-01-01		0	1	
1261	3147	2	\N	1	2018-01-01		0	1	
1269	3170	2	\N	1	2018-01-01		0	1	
1277	3196	1	\N	1	2018-01-01		0	1	
1285	3215	2	\N	1	2018-01-01		0	1	
1293	3230	2	2	1	2018-01-01		0	1	
1301	3245	2	\N	1	2018-01-01		0	1	
1309	3264	3	4	1	2018-01-01		0	1	
1317	3277	2	\N	1	2018-01-01		0	1	
1325	3295	3	\N	1	2018-01-01		0	1	
1333	3312	3	2	1	2018-01-01		0	1	
1341	3341	2	\N	1	2018-01-01		0	1	
1349	3359	2	\N	1	2018-01-01		0	1	
1357	3380	3	\N	1	2018-01-01		0	1	
1365	3411	3	\N	1	2018-01-01		0	1	
1373	3431	2	\N	1	2018-01-01		0	1	
1381	3448	2	\N	1	2018-01-01		0	1	
1389	3471	3	2	1	2018-01-01		0	1	
1397	3481	2	\N	1	2018-01-01		0	1	
1405	3508	2	2	1	2018-01-01		0	1	
1413	3546	3	\N	1	2018-01-01		0	1	
1421	3569	2	\N	1	2018-01-01		0	1	
1429	3593	3	2	1	2018-01-01		0	1	
1437	3607	2	\N	1	2018-01-01		0	1	
1445	3622	2	\N	1	2018-01-01		0	1	
1453	3640	3	2	1	2018-01-01		0	1	
1461	3667	3	2	1	2018-01-01		0	1	
1469	3687	2	\N	1	2018-01-01		0	1	
1477	3711	2	2	1	2018-01-01		0	1	
1485	3731	2	\N	1	2018-01-01		0	1	
1493	3745	2	2	1	2018-01-01		0	1	
1501	3759	3	3	1	2018-01-01		0	1	
1509	3784	2	\N	1	2018-01-01		0	1	
1517	3800	3	2	1	2018-01-01		0	1	
1525	3813	2	\N	1	2018-01-01		0	1	
1533	3837	3	6	1	2018-01-01		0	1	
1541	3864	2	2	1	2018-01-01		0	1	
1549	3875	2	\N	1	2018-01-01		0	1	
1557	3891	2	\N	1	2018-01-01		0	1	
1565	3904	2	4	1	2018-01-01		0	1	
1573	3926	\N	6	1	2018-01-01		0	1	
1581	3945	3	\N	1	2018-01-01		0	1	
1589	3963	3	2	1	2018-01-01		0	1	
1597	3984	3	2	1	2018-01-01		0	1	
1605	4006	3	4	1	2018-01-01		0	1	
1613	4022	2	\N	1	2018-01-01		0	1	
1621	4048	3	4	1	2018-01-01		0	1	
1629	4064	3	2	1	2018-01-01		0	1	
1637	4090	2	2	1	2018-01-01		0	1	
1645	4110	3	5	1	2018-01-01		0	1	
1653	4118	3	2	1	2018-01-01		0	1	
1661	4144	2	\N	1	2018-01-01		0	1	
1669	4169	2	\N	1	2018-01-01		0	1	
1677	4189	2	\N	1	2018-01-01		0	1	
1685	4216	\N	2	1	2018-01-01		0	1	
1693	4235	2	\N	1	2018-01-01		0	1	
1414	3547	3	2	1	2018-01-01		0	1	
1422	3577	2	\N	1	2018-01-01		0	1	
1430	3594	2	\N	1	2018-01-01		0	1	
1438	3608	2	1	1	2018-01-01		0	1	
1446	3624	1	\N	1	2018-01-01		0	1	
1454	3643	3	6	1	2018-01-01		0	1	
1462	3670	3	2	1	2018-01-01		0	1	
1470	3692	3	2	1	2018-01-01		0	1	
1478	3712	3	2	1	2018-01-01		0	1	
1486	3732	2	\N	1	2018-01-01		0	1	
1494	3747	3	\N	1	2018-01-01		0	1	
1502	3765	1	\N	1	2018-01-01		0	1	
1510	3787	2	\N	1	2018-01-01		0	1	
1518	3801	3	2	1	2018-01-01		0	1	
1526	3821	3	2	1	2018-01-01		0	1	
1534	3844	2	\N	1	2018-01-01		0	1	
1542	3866	2	\N	1	2018-01-01		0	1	
1550	3879	2	\N	1	2018-01-01		0	1	
1558	3895	2	2	1	2018-01-01		0	1	
1566	3909	1	2	1	2018-01-01		0	1	
1574	3928	2	\N	1	2018-01-01		0	1	
1582	3950	3	\N	1	2018-01-01		0	1	
1590	3964	1	\N	1	2018-01-01		0	1	
1598	3987	3	4	1	2018-01-01		0	1	
1606	4009	2	\N	1	2018-01-01		0	1	
1614	4025	2	\N	1	2018-01-01		0	1	
1622	4049	1	2	1	2018-01-01		0	1	
1630	4066	2	\N	1	2018-01-01		0	1	
1638	4094	2	\N	1	2018-01-01		0	1	
1646	4111	3	2	1	2018-01-01		0	1	
1654	4123	2	2	1	2018-01-01		0	1	
1662	4151	2	\N	1	2018-01-01		0	1	
1670	4171	3	2	1	2018-01-01		0	1	
1678	4191	2	2	1	2018-01-01		0	1	
1686	4217	2	\N	1	2018-01-01		0	1	
1694	4236	2	\N	1	2018-01-01		0	1	
1702	4257	2	\N	1	2018-01-01		0	1	
1710	4283	3	2	1	2018-01-01		0	1	
1718	4305	3	2	1	2018-01-01		0	1	
1726	4322	2	\N	1	2018-01-01		0	1	
1734	4345	3	2	1	2018-01-01		0	1	
1742	4365	\N	2	1	2018-01-01		0	1	
1750	4379	3	\N	1	2018-01-01		0	1	
1758	4399	3	\N	1	2018-01-01		0	1	
1766	4411	3	1	1	2018-01-01		0	1	
1774	4425	2	\N	1	2018-01-01		0	1	
1782	4439	3	2	1	2018-01-01		0	1	
1790	4457	2	\N	1	2018-01-01		0	1	
1798	4473	3	2	1	2018-01-01		0	1	
1806	4489	3	2	1	2018-01-01		0	1	
1814	4511	2	2	1	2018-01-01		0	1	
1822	4529	2	\N	1	2018-01-01		0	1	
1830	4546	2	\N	1	2018-01-01		0	1	
1838	4566	1	2	1	2018-01-01		0	1	
1846	4583	2	\N	1	2018-01-01		0	1	
1854	4598	3	2	1	2018-01-01		0	1	
1862	4618	3	\N	1	2018-01-01		0	1	
1870	4645	3	2	1	2018-01-01		0	1	
1878	4679	2	\N	1	2018-01-01		0	1	
1886	4698	2	\N	1	2018-01-01		0	1	
1894	4722	3	\N	1	2018-01-01		0	1	
1902	4743	3	\N	1	2018-01-01		0	1	
1910	4759	3	\N	1	2018-01-01		0	1	
1918	4774	3	2	1	2018-01-01		0	1	
1926	4793	3	2	1	2018-01-01		0	1	
1934	4809	3	2	1	2018-01-01		0	1	
1942	4825	2	\N	1	2018-01-01		0	1	
1950	4846	2	\N	1	2018-01-01		0	1	
1958	4863	2	1	1	2018-01-01		0	1	
1966	4886	2	\N	1	2018-01-01		0	1	
1974	4898	1	\N	1	2018-01-01		0	1	
1982	4913	2	\N	1	2018-01-01		0	1	
1990	4950	3	\N	1	2018-01-01		0	1	
1998	4971	2	\N	1	2018-01-01		0	1	
2006	4986	3	\N	1	2018-01-01		0	1	
2014	5006	2	\N	1	2018-01-01		0	1	
2022	5025	2	2	1	2018-01-01		0	1	
2030	5041	3	2	1	2018-01-01		0	1	
2038	5059	2	\N	1	2018-01-01		0	1	
2046	5073	2	\N	1	2018-01-01		0	1	
2054	5092	2	\N	1	2018-01-01		0	1	
2062	5110	2	\N	1	2018-01-01		0	1	
2070	5127	2	\N	1	2018-01-01		0	1	
2078	5148	2	\N	1	2018-01-01		0	1	
2086	5165	2	2	1	2018-01-01		0	1	
2094	5186	3	\N	1	2018-01-01		0	1	
2102	5217	2	\N	1	2018-01-01		0	1	
2110	5230	2	\N	1	2018-01-01		0	1	
2118	5247	2	\N	1	2018-01-01		0	1	
2126	5284	3	7	1	2018-01-01		0	1	
2134	5306	1	2	1	2018-01-01		0	1	
2142	5330	2	\N	1	2018-01-01		0	1	
2150	5346	2	\N	1	2018-01-01		0	1	
2158	5368	2	\N	1	2018-01-01		0	1	
2166	5385	3	2	1	2018-01-01		0	1	
2174	5399	2	\N	1	2018-01-01		0	1	
2182	5417	2	2	1	2018-01-01		0	1	
2190	5442	2	2	1	2018-01-01		0	1	
2198	5460	2	\N	1	2018-01-01		0	1	
2206	5471	2	\N	1	2018-01-01		0	1	
2214	5488	3	2	1	2018-01-01		0	1	
2222	5507	3	2	1	2018-01-01		0	1	
2230	5532	2	2	1	2018-01-01		0	1	
2238	5555	3	1	1	2018-01-01		0	1	
2246	5570	1	2	1	2018-01-01		0	1	
2254	5594	3	\N	1	2018-01-01		0	1	
2262	5609	3	7	1	2018-01-01		0	1	
2270	5630	3	2	1	2018-01-01		0	1	
2278	5649	2	2	1	2018-01-01		0	1	
2286	5671	3	2	1	2018-01-01		0	1	
2294	5693	3	6	1	2018-01-01		0	1	
2302	5723	3	6	1	2018-01-01		0	1	
1825	4535	2	\N	1	2018-01-01		0	1	
1833	4554	3	\N	1	2018-01-01		0	1	
1841	4576	3	7	1	2018-01-01		0	1	
1849	4591	2	\N	1	2018-01-01		0	1	
1857	4602	3	2	1	2018-01-01		0	1	
1865	4626	2	\N	1	2018-01-01		0	1	
1873	4653	3	2	1	2018-01-01		0	1	
1881	4682	2	1	1	2018-01-01		0	1	
1889	4708	2	\N	1	2018-01-01		0	1	
1897	4732	2	\N	1	2018-01-01		0	1	
1905	4749	2	\N	1	2018-01-01		0	1	
1913	4767	2	\N	1	2018-01-01		0	1	
1921	4787	1	\N	1	2018-01-01		0	1	
1929	4801	3	\N	1	2018-01-01		0	1	
1937	4816	3	\N	1	2018-01-01		0	1	
1945	4836	2	2	1	2018-01-01		0	1	
1953	4850	2	2	1	2018-01-01		0	1	
1961	4872	2	\N	1	2018-01-01		0	1	
1969	4891	2	2	1	2018-01-01		0	1	
1977	4903	2	\N	1	2018-01-01		0	1	
1985	4933	2	2	1	2018-01-01		0	1	
1993	4961	3	\N	1	2018-01-01		0	1	
2001	4976	2	2	1	2018-01-01		0	1	
2009	4995	3	\N	1	2018-01-01		0	1	
2017	5011	2	\N	1	2018-01-01		0	1	
2025	5029	2	\N	1	2018-01-01		0	1	
2033	5048	2	\N	1	2018-01-01		0	1	
2041	5064	3	\N	1	2018-01-01		0	1	
2049	5078	2	\N	1	2018-01-01		0	1	
2057	5104	2	1	1	2018-01-01		0	1	
2065	5118	2	\N	1	2018-01-01		0	1	
2073	5134	3	2	1	2018-01-01		0	1	
2081	5154	2	\N	1	2018-01-01		0	1	
2089	5176	3	\N	1	2018-01-01		0	1	
2097	5195	2	\N	1	2018-01-01		0	1	
2105	5224	3	2	1	2018-01-01		0	1	
2113	5239	\N	2	1	2018-01-01		0	1	
2121	5259	3	\N	1	2018-01-01		0	1	
2129	5294	2	1	1	2018-01-01		0	1	
2137	5315	3	\N	1	2018-01-01		0	1	
2145	5337	3	\N	1	2018-01-01		0	1	
2153	5356	1	\N	1	2018-01-01		0	1	
2161	5378	2	\N	1	2018-01-01		0	1	
2169	5389	2	2	1	2018-01-01		0	1	
2177	5407	2	2	1	2018-01-01		0	1	
2185	5422	2	2	1	2018-01-01		0	1	
2193	5446	1	\N	1	2018-01-01		0	1	
2201	5463	3	2	1	2018-01-01		0	1	
2209	5478	2	\N	1	2018-01-01		0	1	
2217	5495	3	2	1	2018-01-01		0	1	
2225	5518	2	2	1	2018-01-01		0	1	
2233	5545	2	\N	1	2018-01-01		0	1	
2241	5560	3	\N	1	2018-01-01		0	1	
2249	5580	2	\N	1	2018-01-01		0	1	
2257	5598	3	2	1	2018-01-01		0	1	
2265	5618	3	\N	1	2018-01-01		0	1	
2273	5636	3	\N	1	2018-01-01		0	1	
2281	5658	3	2	1	2018-01-01		0	1	
2289	5680	2	\N	1	2018-01-01		0	1	
2297	5700	1	\N	1	2018-01-01		0	1	
2305	5727	3	\N	1	2018-01-01		0	1	
2313	5755	2	\N	1	2018-01-01		0	1	
2321	5773	1	\N	1	2018-01-01		0	1	
2329	5795	1	\N	1	2018-01-01		0	1	
2337	5808	3	6	1	2018-01-01		0	1	
2345	5820	2	\N	1	2018-01-01		0	1	
2353	5836	1	2	1	2018-01-01		0	1	
2361	5849	2	\N	1	2018-01-01		0	1	
2369	5883	3	2	1	2018-01-01		0	1	
2377	5899	2	\N	1	2018-01-01		0	1	
2385	5915	3	2	1	2018-01-01		0	1	
2393	5924	3	\N	1	2018-01-01		0	1	
2401	5941	2	\N	1	2018-01-01		0	1	
2409	5955	3	\N	1	2018-01-01		0	1	
2417	5972	3	2	1	2018-01-01		0	1	
2425	5994	3	2	1	2018-01-01		0	1	
2433	6017	2	\N	1	2018-01-01		0	1	
2441	6034	2	2	1	2018-01-01		0	1	
2449	6049	3	\N	1	2018-01-01		0	1	
2457	6063	3	2	1	2018-01-01		0	1	
2465	6083	3	2	1	2018-01-01		0	1	
2473	6108	3	\N	1	2018-01-01		0	1	
2481	6124	2	\N	1	2018-01-01		0	1	
2489	6136	3	\N	1	2018-01-01		0	1	
2497	6156	2	\N	1	2018-01-01		0	1	
2505	6168	2	\N	1	2018-01-01		0	1	
2513	6191	2	\N	1	2018-01-01		0	1	
2521	6207	2	\N	1	2018-01-01		0	1	
2529	6224	2	1	1	2018-01-01		0	1	
2537	6241	3	\N	1	2018-01-01		0	1	
2545	6258	3	\N	1	2018-01-01		0	1	
2553	6277	2	\N	1	2018-01-01		0	1	
2561	6293	2	\N	1	2018-01-01		0	1	
2569	6311	2	\N	1	2018-01-01		0	1	
2577	6336	2	\N	1	2018-01-01		0	1	
2585	6353	2	\N	1	2018-01-01		0	1	
2593	6368	3	2	1	2018-01-01		0	1	
2601	6396	3	\N	1	2018-01-01		0	1	
2609	6411	2	\N	1	2018-01-01		0	1	
2617	6429	3	6	1	2018-01-01		0	1	
2625	6449	3	\N	1	2018-01-01		0	1	
2633	6470	3	\N	1	2018-01-01		0	1	
2641	6485	2	\N	1	2018-01-01		0	1	
2649	6499	3	\N	1	2018-01-01		0	1	
2657	6524	2	\N	1	2018-01-01		0	1	
2665	6547	2	\N	1	2018-01-01		0	1	
2673	6562	2	\N	1	2018-01-01		0	1	
2681	6581	3	2	1	2018-01-01		0	1	
2689	6606	2	\N	1	2018-01-01		0	1	
2697	6634	3	\N	1	2018-01-01		0	1	
2705	6650	3	\N	1	2018-01-01		0	1	
1701	4255	3	6	1	2018-01-01		0	1	
1709	4281	3	6	1	2018-01-01		0	1	
1717	4302	2	2	1	2018-01-01		0	1	
1725	4320	2	\N	1	2018-01-01		0	1	
1733	4342	3	2	1	2018-01-01		0	1	
1741	4362	3	\N	1	2018-01-01		0	1	
1749	4378	2	\N	1	2018-01-01		0	1	
1757	4394	1	2	1	2018-01-01		0	1	
1765	4410	2	\N	1	2018-01-01		0	1	
1773	4424	2	\N	1	2018-01-01		0	1	
1781	4437	2	\N	1	2018-01-01		0	1	
1789	4454	2	1	1	2018-01-01		0	1	
1797	4472	2	\N	1	2018-01-01		0	1	
1805	4484	2	\N	1	2018-01-01		0	1	
1813	4507	3	\N	1	2018-01-01		0	1	
1821	4527	3	\N	1	2018-01-01		0	1	
1829	4544	1	2	1	2018-01-01		0	1	
1837	4562	3	2	1	2018-01-01		0	1	
1845	4582	2	\N	1	2018-01-01		0	1	
1853	4596	2	\N	1	2018-01-01		0	1	
1861	4615	\N	2	1	2018-01-01		0	1	
1869	4641	2	\N	1	2018-01-01		0	1	
1877	4678	2	\N	1	2018-01-01		0	1	
1885	4697	3	6	1	2018-01-01		0	1	
1893	4718	3	\N	1	2018-01-01		0	1	
1901	4742	3	2	1	2018-01-01		0	1	
1909	4757	3	\N	1	2018-01-01		0	1	
1917	4773	2	\N	1	2018-01-01		0	1	
1925	4792	2	\N	1	2018-01-01		0	1	
1933	4808	3	7	1	2018-01-01		0	1	
1941	4821	2	\N	1	2018-01-01		0	1	
1949	4845	2	\N	1	2018-01-01		0	1	
1957	4862	2	\N	1	2018-01-01		0	1	
1965	4884	2	1	1	2018-01-01		0	1	
1973	4897	2	\N	1	2018-01-01		0	1	
1981	4912	3	2	1	2018-01-01		0	1	
1989	4949	2	\N	1	2018-01-01		0	1	
1997	4968	2	\N	1	2018-01-01		0	1	
2005	4983	2	\N	1	2018-01-01		0	1	
2013	5005	3	\N	1	2018-01-01		0	1	
2021	5024	2	\N	1	2018-01-01		0	1	
2029	5040	3	2	1	2018-01-01		0	1	
2037	5057	3	\N	1	2018-01-01		0	1	
2045	5072	2	\N	1	2018-01-01		0	1	
2053	5088	1	\N	1	2018-01-01		0	1	
2061	5109	3	\N	1	2018-01-01		0	1	
2069	5124	2	2	1	2018-01-01		0	1	
2077	5144	2	\N	1	2018-01-01		0	1	
2085	5163	1	2	1	2018-01-01		0	1	
2093	5185	1	2	1	2018-01-01		0	1	
2101	5202	2	1	1	2018-01-01		0	1	
2109	5228	3	5	1	2018-01-01		0	1	
2117	5245	2	\N	1	2018-01-01		0	1	
2125	5282	3	6	1	2018-01-01		0	1	
2133	5304	2	\N	1	2018-01-01		0	1	
2141	5329	3	2	1	2018-01-01		0	1	
2149	5345	3	\N	1	2018-01-01		0	1	
2157	5367	3	2	1	2018-01-01		0	1	
2165	5384	2	\N	1	2018-01-01		0	1	
2173	5395	2	\N	1	2018-01-01		0	1	
2181	5416	2	\N	1	2018-01-01		0	1	
2189	5440	2	\N	1	2018-01-01		0	1	
2197	5459	2	\N	1	2018-01-01		0	1	
2205	5470	2	\N	1	2018-01-01		0	1	
2213	5487	2	\N	1	2018-01-01		0	1	
2221	5505	2	2	1	2018-01-01		0	1	
2229	5528	1	\N	1	2018-01-01		0	1	
2237	5552	3	2	1	2018-01-01		0	1	
2245	5566	3	\N	1	2018-01-01		0	1	
2253	5593	\N	2	1	2018-01-01		0	1	
2261	5607	3	2	1	2018-01-01		0	1	
2269	5625	3	\N	1	2018-01-01		0	1	
2277	5646	2	\N	1	2018-01-01		0	1	
2285	5668	3	2	1	2018-01-01		0	1	
2293	5691	2	2	1	2018-01-01		0	1	
2301	5721	2	\N	1	2018-01-01		0	1	
2309	5740	2	1	1	2018-01-01		0	1	
2317	5764	2	\N	1	2018-01-01		0	1	
2325	5790	3	\N	1	2018-01-01		0	1	
2333	5801	2	\N	1	2018-01-01		0	1	
2341	5816	2	2	1	2018-01-01		0	1	
2349	5827	3	\N	1	2018-01-01		0	1	
2357	5844	1	2	1	2018-01-01		0	1	
2365	5872	3	2	1	2018-01-01		0	1	
2373	5893	3	\N	1	2018-01-01		0	1	
2381	5909	3	\N	1	2018-01-01		0	1	
2389	5919	3	2	1	2018-01-01		0	1	
2397	5932	2	\N	1	2018-01-01		0	1	
2405	5950	3	2	1	2018-01-01		0	1	
2413	5965	2	\N	1	2018-01-01		0	1	
2421	5984	2	\N	1	2018-01-01		0	1	
2429	6001	3	1	1	2018-01-01		0	1	
2437	6026	3	2	1	2018-01-01		0	1	
2445	6040	3	2	1	2018-01-01		0	1	
2453	6057	2	2	1	2018-01-01		0	1	
2461	6073	2	2	1	2018-01-01		0	1	
2469	6099	2	2	1	2018-01-01		0	1	
2477	6117	1	\N	1	2018-01-01		0	1	
2485	6128	3	6	1	2018-01-01		0	1	
2493	6148	2	\N	1	2018-01-01		0	1	
2501	6162	2	\N	1	2018-01-01		0	1	
2509	6177	2	\N	1	2018-01-01		0	1	
2517	6197	2	\N	1	2018-01-01		0	1	
2525	6214	2	\N	1	2018-01-01		0	1	
2533	6234	2	\N	1	2018-01-01		0	1	
2541	6247	3	2	1	2018-01-01		0	1	
2549	6265	2	\N	1	2018-01-01		0	1	
2557	6288	1	\N	1	2018-01-01		0	1	
2565	6306	3	\N	1	2018-01-01		0	1	
2573	6322	1	2	1	2018-01-01		0	1	
2581	6342	2	7	1	2018-01-01		0	1	
2589	6358	2	1	1	2018-01-01		0	1	
1850	4593	3	6	1	2018-01-01		0	1	
1858	4603	3	\N	1	2018-01-01		0	1	
1866	4630	3	7	1	2018-01-01		0	1	
1874	4655	2	\N	1	2018-01-01		0	1	
1882	4683	2	\N	1	2018-01-01		0	1	
1890	4710	3	2	1	2018-01-01		0	1	
1898	4733	3	2	1	2018-01-01		0	1	
1906	4751	1	\N	1	2018-01-01		0	1	
1914	4768	2	\N	1	2018-01-01		0	1	
1922	4788	3	\N	1	2018-01-01		0	1	
1930	4804	2	\N	1	2018-01-01		0	1	
1938	4817	3	2	1	2018-01-01		0	1	
1946	4840	3	\N	1	2018-01-01		0	1	
1954	4854	3	\N	1	2018-01-01		0	1	
1962	4876	1	\N	1	2018-01-01		0	1	
1970	4892	2	\N	1	2018-01-01		0	1	
1978	4908	3	2	1	2018-01-01		0	1	
1986	4934	2	\N	1	2018-01-01		0	1	
1994	4963	2	2	1	2018-01-01		0	1	
2002	4977	3	\N	1	2018-01-01		0	1	
2010	5000	3	\N	1	2018-01-01		0	1	
2018	5012	2	\N	1	2018-01-01		0	1	
2026	5031	3	\N	1	2018-01-01		0	1	
2034	5052	2	\N	1	2018-01-01		0	1	
2042	5066	3	\N	1	2018-01-01		0	1	
2050	5080	2	\N	1	2018-01-01		0	1	
2058	5105	2	\N	1	2018-01-01		0	1	
2066	5119	2	\N	1	2018-01-01		0	1	
2074	5136	3	2	1	2018-01-01		0	1	
2082	5156	3	7	1	2018-01-01		0	1	
2090	5177	2	\N	1	2018-01-01		0	1	
2098	5197	3	2	1	2018-01-01		0	1	
2106	5225	3	2	1	2018-01-01		0	1	
2114	5240	3	\N	1	2018-01-01		0	1	
2122	5273	3	2	1	2018-01-01		0	1	
2130	5300	2	\N	1	2018-01-01		0	1	
2138	5318	3	\N	1	2018-01-01		0	1	
2146	5339	2	\N	1	2018-01-01		0	1	
2154	5358	3	6	1	2018-01-01		0	1	
2162	5379	3	6	1	2018-01-01		0	1	
2170	5392	3	2	1	2018-01-01		0	1	
2178	5409	2	\N	1	2018-01-01		0	1	
2186	5427	2	\N	1	2018-01-01		0	1	
2194	5449	3	\N	1	2018-01-01		0	1	
2202	5464	3	2	1	2018-01-01		0	1	
2210	5482	3	6	1	2018-01-01		0	1	
2218	5499	1	\N	1	2018-01-01		0	1	
2226	5522	3	\N	1	2018-01-01		0	1	
2234	5546	3	\N	1	2018-01-01		0	1	
2242	5562	3	2	1	2018-01-01		0	1	
2250	5581	3	\N	1	2018-01-01		0	1	
2258	5599	2	\N	1	2018-01-01		0	1	
2266	5619	2	1	1	2018-01-01		0	1	
2274	5639	2	1	1	2018-01-01		0	1	
2282	5661	1	2	1	2018-01-01		0	1	
2290	5682	3	2	1	2018-01-01		0	1	
2298	5701	3	\N	1	2018-01-01		0	1	
2306	5728	2	\N	1	2018-01-01		0	1	
2314	5756	3	2	1	2018-01-01		0	1	
2322	5779	3	\N	1	2018-01-01		0	1	
2330	5796	3	1	1	2018-01-01		0	1	
2338	5811	3	\N	1	2018-01-01		0	1	
2346	5821	2	1	1	2018-01-01		0	1	
2354	5837	2	\N	1	2018-01-01		0	1	
2362	5853	2	\N	1	2018-01-01		0	1	
2370	5888	2	\N	1	2018-01-01		0	1	
2378	5900	2	1	1	2018-01-01		0	1	
2386	5916	2	2	1	2018-01-01		0	1	
2394	5925	2	2	1	2018-01-01		0	1	
2402	5942	1	2	1	2018-01-01		0	1	
2410	5956	2	\N	1	2018-01-01		0	1	
2418	5974	3	\N	1	2018-01-01		0	1	
2426	5995	2	2	1	2018-01-01		0	1	
2434	6018	1	\N	1	2018-01-01		0	1	
2442	6035	3	\N	1	2018-01-01		0	1	
2450	6050	2	\N	1	2018-01-01		0	1	
2458	6067	3	\N	1	2018-01-01		0	1	
2466	6085	3	2	1	2018-01-01		0	1	
2474	6111	2	2	1	2018-01-01		0	1	
2482	6125	1	2	1	2018-01-01		0	1	
2490	6143	2	\N	1	2018-01-01		0	1	
2498	6157	3	2	1	2018-01-01		0	1	
2506	6172	3	\N	1	2018-01-01		0	1	
2514	6192	2	\N	1	2018-01-01		0	1	
2522	6209	3	\N	1	2018-01-01		0	1	
2530	6227	1	\N	1	2018-01-01		0	1	
2538	6242	2	\N	1	2018-01-01		0	1	
2546	6261	2	\N	1	2018-01-01		0	1	
2554	6280	2	\N	1	2018-01-01		0	1	
2562	6300	2	\N	1	2018-01-01		0	1	
2570	6314	3	2	1	2018-01-01		0	1	
2578	6339	2	\N	1	2018-01-01		0	1	
2586	6354	2	\N	1	2018-01-01		0	1	
2594	6370	2	1	1	2018-01-01		0	1	
2602	6398	3	2	1	2018-01-01		0	1	
2610	6415	2	\N	1	2018-01-01		0	1	
2618	6430	2	\N	1	2018-01-01		0	1	
2626	6453	2	\N	1	2018-01-01		0	1	
2634	6471	2	\N	1	2018-01-01		0	1	
2642	6486	3	2	1	2018-01-01		0	1	
2650	6505	\N	2	1	2018-01-01		0	1	
2658	6529	2	\N	1	2018-01-01		0	1	
2666	6548	2	\N	1	2018-01-01		0	1	
2674	6565	1	2	1	2018-01-01		0	1	
2682	6583	3	2	1	2018-01-01		0	1	
2690	6614	3	7	1	2018-01-01		0	1	
2698	6637	2	\N	1	2018-01-01		0	1	
2706	6651	2	\N	1	2018-01-01		0	1	
2714	6673	2	2	1	2018-01-01		0	1	
2722	6690	3	2	1	2018-01-01		0	1	
2730	6713	2	\N	1	2018-01-01		0	1	
2738	6732	3	\N	1	2018-01-01		0	1	
1788	4452	2	2	1	2018-01-01		0	1	
1796	4469	3	2	1	2018-01-01		0	1	
1804	4483	3	\N	1	2018-01-01		0	1	
1812	4506	2	2	1	2018-01-01		0	1	
1820	4524	3	\N	1	2018-01-01		0	1	
1828	4543	2	\N	1	2018-01-01		0	1	
1836	4561	3	\N	1	2018-01-01		0	1	
1844	4581	2	\N	1	2018-01-01		0	1	
1852	4595	2	\N	1	2018-01-01		0	1	
1860	4606	2	\N	1	2018-01-01		0	1	
1868	4634	3	\N	1	2018-01-01		0	1	
1876	4668	2	\N	1	2018-01-01		0	1	
1884	4693	2	\N	1	2018-01-01		0	1	
1892	4712	2	\N	1	2018-01-01		0	1	
1900	4738	3	1	1	2018-01-01		0	1	
1908	4756	2	\N	1	2018-01-01		0	1	
1916	4772	3	2	1	2018-01-01		0	1	
1924	4791	3	5	1	2018-01-01		0	1	
1932	4806	3	\N	1	2018-01-01		0	1	
1940	4820	2	2	1	2018-01-01		0	1	
1948	4843	2	\N	1	2018-01-01		0	1	
1956	4859	3	\N	1	2018-01-01		0	1	
1964	4883	2	\N	1	2018-01-01		0	1	
1972	4896	2	\N	1	2018-01-01		0	1	
1980	4911	3	2	1	2018-01-01		0	1	
1988	4944	3	\N	1	2018-01-01		0	1	
1996	4966	3	2	1	2018-01-01		0	1	
2004	4982	2	1	1	2018-01-01		0	1	
2012	5002	3	2	1	2018-01-01		0	1	
2020	5021	3	2	1	2018-01-01		0	1	
2028	5037	3	2	1	2018-01-01		0	1	
2036	5056	2	\N	1	2018-01-01		0	1	
2044	5071	2	\N	1	2018-01-01		0	1	
2052	5086	2	\N	1	2018-01-01		0	1	
2060	5107	2	2	1	2018-01-01		0	1	
2068	5123	2	\N	1	2018-01-01		0	1	
2076	5139	1	\N	1	2018-01-01		0	1	
2084	5161	3	2	1	2018-01-01		0	1	
2092	5183	3	\N	1	2018-01-01		0	1	
2100	5201	3	2	1	2018-01-01		0	1	
2108	5227	3	2	1	2018-01-01		0	1	
2116	5244	1	\N	1	2018-01-01		0	1	
2124	5278	2	1	1	2018-01-01		0	1	
2132	5303	2	\N	1	2018-01-01		0	1	
2140	5323	2	\N	1	2018-01-01		0	1	
2148	5343	2	1	1	2018-01-01		0	1	
2156	5363	1	\N	1	2018-01-01		0	1	
2164	5383	3	4	1	2018-01-01		0	1	
2172	5394	2	\N	1	2018-01-01		0	1	
2180	5413	3	\N	1	2018-01-01		0	1	
2188	5437	3	6	1	2018-01-01		0	1	
2196	5455	2	\N	1	2018-01-01		0	1	
2204	5466	2	\N	1	2018-01-01		0	1	
2212	5485	2	\N	1	2018-01-01		0	1	
2220	5503	2	\N	1	2018-01-01		0	1	
2228	5527	1	\N	1	2018-01-01		0	1	
2236	5551	3	2	1	2018-01-01		0	1	
2244	5565	2	\N	1	2018-01-01		0	1	
2252	5586	2	1	1	2018-01-01		0	1	
2260	5605	2	2	1	2018-01-01		0	1	
2268	5623	3	2	1	2018-01-01		0	1	
2276	5641	3	2	1	2018-01-01		0	1	
2284	5663	3	\N	1	2018-01-01		0	1	
2292	5690	2	\N	1	2018-01-01		0	1	
2300	5718	2	\N	1	2018-01-01		0	1	
2308	5737	2	\N	1	2018-01-01		0	1	
2316	5763	3	1	1	2018-01-01		0	1	
2324	5786	2	\N	1	2018-01-01		0	1	
2332	5800	3	2	1	2018-01-01		0	1	
2340	5815	2	\N	1	2018-01-01		0	1	
2348	5826	2	2	1	2018-01-01		0	1	
2356	5843	2	\N	1	2018-01-01		0	1	
2364	5870	3	1	1	2018-01-01		0	1	
2372	5891	3	6	1	2018-01-01		0	1	
2380	5906	2	\N	1	2018-01-01		0	1	
2388	5918	2	2	1	2018-01-01		0	1	
2396	5931	2	2	1	2018-01-01		0	1	
2404	5949	3	\N	1	2018-01-01		0	1	
2412	5962	2	\N	1	2018-01-01		0	1	
2420	5980	3	\N	1	2018-01-01		0	1	
2428	6000	3	6	1	2018-01-01		0	1	
2436	6024	2	\N	1	2018-01-01		0	1	
2444	6039	2	\N	1	2018-01-01		0	1	
2452	6055	3	6	1	2018-01-01		0	1	
2460	6072	2	\N	1	2018-01-01		0	1	
2468	6087	2	2	1	2018-01-01		0	1	
2476	6116	2	2	1	2018-01-01		0	1	
2484	6127	3	\N	1	2018-01-01		0	1	
2492	6145	2	1	1	2018-01-01		0	1	
2500	6161	3	2	1	2018-01-01		0	1	
2508	6175	3	\N	1	2018-01-01		0	1	
2516	6194	2	\N	1	2018-01-01		0	1	
2524	6212	3	\N	1	2018-01-01		0	1	
2532	6232	1	\N	1	2018-01-01		0	1	
2540	6245	\N	7	1	2018-01-01		0	1	
2548	6263	3	\N	1	2018-01-01		0	1	
2556	6284	2	\N	1	2018-01-01		0	1	
2564	6304	2	\N	1	2018-01-01		0	1	
2572	6319	3	\N	1	2018-01-01		0	1	
2580	6341	2	\N	1	2018-01-01		0	1	
2588	6357	2	\N	1	2018-01-01		0	1	
2596	6379	2	\N	1	2018-01-01		0	1	
2604	6400	3	2	1	2018-01-01		0	1	
2612	6418	2	2	1	2018-01-01		0	1	
2620	6435	2	\N	1	2018-01-01		0	1	
2628	6457	2	\N	1	2018-01-01		0	1	
2636	6473	2	\N	1	2018-01-01		0	1	
2644	6490	3	2	1	2018-01-01		0	1	
2652	6508	3	2	1	2018-01-01		0	1	
2660	6537	2	\N	1	2018-01-01		0	1	
2668	6552	2	\N	1	2018-01-01		0	1	
2676	6573	2	2	1	2018-01-01		0	1	
2310	5741	2	\N	1	2018-01-01		0	1	
2318	5765	2	\N	1	2018-01-01		0	1	
2326	5791	2	\N	1	2018-01-01		0	1	
2334	5802	1	\N	1	2018-01-01		0	1	
2342	5817	1	\N	1	2018-01-01		0	1	
2350	5828	2	1	1	2018-01-01		0	1	
2358	5845	3	2	1	2018-01-01		0	1	
2366	5873	2	\N	1	2018-01-01		0	1	
2374	5894	2	\N	1	2018-01-01		0	1	
2382	5910	3	2	1	2018-01-01		0	1	
2390	5920	3	2	1	2018-01-01		0	1	
2398	5935	2	\N	1	2018-01-01		0	1	
2406	5951	2	\N	1	2018-01-01		0	1	
2414	5966	2	\N	1	2018-01-01		0	1	
2422	5988	3	1	1	2018-01-01		0	1	
2430	6005	3	2	1	2018-01-01		0	1	
2438	6030	2	2	1	2018-01-01		0	1	
2446	6042	3	2	1	2018-01-01		0	1	
2454	6059	1	\N	1	2018-01-01		0	1	
2462	6077	3	2	1	2018-01-01		0	1	
2470	6100	2	\N	1	2018-01-01		0	1	
2478	6118	3	\N	1	2018-01-01		0	1	
2486	6129	3	\N	1	2018-01-01		0	1	
2494	6149	2	\N	1	2018-01-01		0	1	
2502	6164	2	\N	1	2018-01-01		0	1	
2510	6179	2	\N	1	2018-01-01		0	1	
2518	6199	2	\N	1	2018-01-01		0	1	
2526	6218	2	\N	1	2018-01-01		0	1	
2534	6236	3	2	1	2018-01-01		0	1	
2542	6250	2	\N	1	2018-01-01		0	1	
2550	6266	3	\N	1	2018-01-01		0	1	
2558	6289	3	1	1	2018-01-01		0	1	
2566	6307	2	\N	1	2018-01-01		0	1	
2574	6324	2	1	1	2018-01-01		0	1	
2582	6343	1	\N	1	2018-01-01		0	1	
2590	6359	1	2	1	2018-01-01		0	1	
2598	6388	3	2	1	2018-01-01		0	1	
2606	6403	2	\N	1	2018-01-01		0	1	
2614	6422	2	\N	1	2018-01-01		0	1	
2622	6440	3	7	1	2018-01-01		0	1	
2630	6464	2	\N	1	2018-01-01		0	1	
2638	6476	3	\N	1	2018-01-01		0	1	
2646	6493	2	1	1	2018-01-01		0	1	
2654	6516	2	\N	1	2018-01-01		0	1	
2662	6540	2	\N	1	2018-01-01		0	1	
2670	6557	2	\N	1	2018-01-01		0	1	
2678	6575	3	\N	1	2018-01-01		0	1	
2686	6592	3	2	1	2018-01-01		0	1	
2694	6622	3	\N	1	2018-01-01		0	1	
2702	6645	2	\N	1	2018-01-01		0	1	
2710	6664	2	\N	1	2018-01-01		0	1	
2718	6681	2	\N	1	2018-01-01		0	1	
2726	6699	3	\N	1	2018-01-01		0	1	
2734	6724	2	\N	1	2018-01-01		0	1	
2742	6743	2	\N	1	2018-01-01		0	1	
2750	6759	3	2	1	2018-01-01		0	1	
2758	6768	2	\N	1	2018-01-01		0	1	
2766	6788	3	\N	1	2018-01-01		0	1	
2774	6807	2	\N	1	2018-01-01		0	1	
2782	6834	2	\N	1	2018-01-01		0	1	
2790	6848	3	\N	1	2018-01-01		0	1	
2798	6865	\N	2	1	2018-01-01		0	1	
2806	6890	2	\N	1	2018-01-01		0	1	
2814	6914	1	2	1	2018-01-01		0	1	
2822	6937	2	\N	1	2018-01-01		0	1	
2830	6959	2	\N	1	2018-01-01		0	1	
2838	6986	2	\N	1	2018-01-01		0	1	
2846	7005	3	2	1	2018-01-01		0	1	
2854	7034	2	2	1	2018-01-01		0	1	
2862	7046	1	2	1	2018-01-01		0	1	
2870	7069	1	\N	1	2018-01-01		0	1	
2878	7088	3	7	1	2018-01-01		0	1	
2886	7100	2	1	1	2018-01-01		0	1	
2894	7116	2	\N	1	2018-01-01		0	1	
2902	7132	2	\N	1	2018-01-01		0	1	
2910	7156	2	\N	1	2018-01-01		0	1	
2918	7173	2	\N	1	2018-01-01		0	1	
2926	7190	3	2	1	2018-01-01		0	1	
2934	7217	3	\N	1	2018-01-01		0	1	
2942	7237	2	\N	1	2018-01-01		0	1	
2950	7256	3	2	1	2018-01-01		0	1	
2958	7283	2	\N	1	2018-01-01		0	1	
2966	7298	2	\N	1	2018-01-01		0	1	
2974	7325	3	\N	1	2018-01-01		0	1	
2982	7348	3	6	1	2018-01-01		0	1	
2990	7366	3	2	1	2018-01-01		0	1	
2998	7384	1	\N	1	2018-01-01		0	1	
3006	7401	2	\N	1	2018-01-01		0	1	
3014	7412	2	\N	1	2018-01-01		0	1	
3022	7430	3	2	1	2018-01-01		0	1	
3030	7443	2	\N	1	2018-01-01		0	1	
3038	7462	2	\N	1	2018-01-01		0	1	
3046	7479	2	\N	1	2018-01-01		0	1	
3054	7496	3	\N	1	2018-01-01		0	1	
3062	7518	3	2	1	2018-01-01		0	1	
3070	7537	2	\N	1	2018-01-01		0	1	
3078	7557	2	1	1	2018-01-01		0	1	
3086	7574	3	\N	1	2018-01-01		0	1	
3094	7590	3	1	1	2018-01-01		0	1	
3102	7617	2	\N	1	2018-01-01		0	1	
3110	7640	2	\N	1	2018-01-01		0	1	
3118	7665	2	\N	1	2018-01-01		0	1	
3126	7690	3	\N	1	2018-01-01		0	1	
3134	7713	3	3	1	2018-01-01		0	1	
3142	7736	3	\N	1	2018-01-01		0	1	
3150	7756	1	2	1	2018-01-01		0	1	
3158	7774	2	\N	1	2018-01-01		0	1	
3166	7787	3	2	1	2018-01-01		0	1	
3174	7805	2	\N	1	2018-01-01		0	1	
3182	7825	2	\N	1	2018-01-01		0	1	
3190	7844	2	2	1	2018-01-01		0	1	
1703	4260	2	\N	1	2018-01-01		0	1	
1711	4292	2	\N	1	2018-01-01		0	1	
1719	4307	3	6	1	2018-01-01		0	1	
1727	4323	3	2	1	2018-01-01		0	1	
1735	4348	2	1	1	2018-01-01		0	1	
1743	4366	1	\N	1	2018-01-01		0	1	
1751	4382	2	\N	1	2018-01-01		0	1	
1759	4403	3	6	1	2018-01-01		0	1	
1767	4412	2	\N	1	2018-01-01		0	1	
1775	4426	3	7	1	2018-01-01		0	1	
1783	4440	2	\N	1	2018-01-01		0	1	
1791	4458	2	2	1	2018-01-01		0	1	
1799	4474	2	\N	1	2018-01-01		0	1	
1807	4491	3	\N	1	2018-01-01		0	1	
1815	4512	3	1	1	2018-01-01		0	1	
1823	4532	3	2	1	2018-01-01		0	1	
1831	4550	3	2	1	2018-01-01		0	1	
1839	4571	2	\N	1	2018-01-01		0	1	
1847	4584	3	2	1	2018-01-01		0	1	
1855	4600	2	\N	1	2018-01-01		0	1	
1863	4620	3	\N	1	2018-01-01		0	1	
1871	4650	3	1	1	2018-01-01		0	1	
1879	4680	2	\N	1	2018-01-01		0	1	
1887	4700	2	\N	1	2018-01-01		0	1	
1895	4723	2	2	1	2018-01-01		0	1	
1903	4744	2	\N	1	2018-01-01		0	1	
1911	4761	2	\N	1	2018-01-01		0	1	
1919	4777	2	2	1	2018-01-01		0	1	
1927	4797	2	\N	1	2018-01-01		0	1	
1935	4810	2	2	1	2018-01-01		0	1	
1943	4833	3	5	1	2018-01-01		0	1	
1951	4848	2	\N	1	2018-01-01		0	1	
1959	4866	3	\N	1	2018-01-01		0	1	
1967	4889	3	2	1	2018-01-01		0	1	
1975	4899	2	\N	1	2018-01-01		0	1	
1983	4921	1	\N	1	2018-01-01		0	1	
1991	4952	2	\N	1	2018-01-01		0	1	
1999	4973	3	2	1	2018-01-01		0	1	
2007	4993	2	\N	1	2018-01-01		0	1	
2015	5009	2	\N	1	2018-01-01		0	1	
2023	5027	3	\N	1	2018-01-01		0	1	
2031	5044	2	2	1	2018-01-01		0	1	
2039	5060	3	2	1	2018-01-01		0	1	
2047	5074	2	\N	1	2018-01-01		0	1	
2055	5093	\N	2	1	2018-01-01		0	1	
2063	5112	3	\N	1	2018-01-01		0	1	
2071	5128	2	\N	1	2018-01-01		0	1	
2079	5150	2	1	1	2018-01-01		0	1	
2087	5167	3	2	1	2018-01-01		0	1	
2095	5188	3	\N	1	2018-01-01		0	1	
2103	5220	2	\N	1	2018-01-01		0	1	
2111	5234	2	2	1	2018-01-01		0	1	
2119	5252	3	2	1	2018-01-01		0	1	
2127	5291	3	6	1	2018-01-01		0	1	
2135	5309	3	7	1	2018-01-01		0	1	
2143	5331	3	\N	1	2018-01-01		0	1	
2151	5349	3	\N	1	2018-01-01		0	1	
2159	5372	2	1	1	2018-01-01		0	1	
2167	5386	2	2	1	2018-01-01		0	1	
2175	5402	2	\N	1	2018-01-01		0	1	
2183	5419	3	2	1	2018-01-01		0	1	
2191	5443	3	2	1	2018-01-01		0	1	
2199	5461	2	2	1	2018-01-01		0	1	
2207	5476	2	\N	1	2018-01-01		0	1	
2215	5490	3	2	1	2018-01-01		0	1	
2223	5508	2	6	1	2018-01-01		0	1	
2231	5536	3	6	1	2018-01-01		0	1	
2239	5557	2	\N	1	2018-01-01		0	1	
2247	5573	1	\N	1	2018-01-01		0	1	
2255	5596	2	\N	1	2018-01-01		0	1	
2263	5613	2	\N	1	2018-01-01		0	1	
2271	5632	3	2	1	2018-01-01		0	1	
2279	5652	3	\N	1	2018-01-01		0	1	
2287	5676	2	2	1	2018-01-01		0	1	
2295	5695	1	\N	1	2018-01-01		0	1	
2303	5724	2	1	1	2018-01-01		0	1	
2311	5745	1	\N	1	2018-01-01		0	1	
2319	5767	3	2	1	2018-01-01		0	1	
2327	5792	3	2	1	2018-01-01		0	1	
2335	5803	2	\N	1	2018-01-01		0	1	
2343	5818	1	2	1	2018-01-01		0	1	
2351	5829	3	2	1	2018-01-01		0	1	
2359	5846	2	\N	1	2018-01-01		0	1	
2367	5876	2	\N	1	2018-01-01		0	1	
2375	5897	2	\N	1	2018-01-01		0	1	
2383	5912	2	1	1	2018-01-01		0	1	
2391	5921	2	\N	1	2018-01-01		0	1	
2399	5936	2	2	1	2018-01-01		0	1	
2407	5952	3	\N	1	2018-01-01		0	1	
2415	5968	3	2	1	2018-01-01		0	1	
2423	5991	2	\N	1	2018-01-01		0	1	
2431	6015	2	\N	1	2018-01-01		0	1	
2439	6031	3	1	1	2018-01-01		0	1	
2447	6044	2	\N	1	2018-01-01		0	1	
2455	6060	3	5	1	2018-01-01		0	1	
2463	6080	3	6	1	2018-01-01		0	1	
2471	6101	3	6	1	2018-01-01		0	1	
2479	6120	3	\N	1	2018-01-01		0	1	
2487	6130	3	2	1	2018-01-01		0	1	
2495	6150	3	6	1	2018-01-01		0	1	
2503	6165	3	2	1	2018-01-01		0	1	
2511	6188	3	2	1	2018-01-01		0	1	
2519	6201	2	\N	1	2018-01-01		0	1	
2527	6220	2	2	1	2018-01-01		0	1	
2535	6237	2	\N	1	2018-01-01		0	1	
2543	6251	2	2	1	2018-01-01		0	1	
2551	6269	3	\N	1	2018-01-01		0	1	
2559	6290	3	6	1	2018-01-01		0	1	
2567	6308	3	2	1	2018-01-01		0	1	
2575	6327	3	2	1	2018-01-01		0	1	
2583	6348	2	\N	1	2018-01-01		0	1	
2591	6363	2	\N	1	2018-01-01		0	1	
2599	6392	2	\N	1	2018-01-01		0	1	
2267	5622	3	6	1	2018-01-01		0	1	
2275	5640	2	\N	1	2018-01-01		0	1	
2283	5662	2	\N	1	2018-01-01		0	1	
2291	5686	3	2	1	2018-01-01		0	1	
2299	5710	1	\N	1	2018-01-01		0	1	
2307	5735	1	\N	1	2018-01-01		0	1	
2315	5760	2	\N	1	2018-01-01		0	1	
2323	5783	1	2	1	2018-01-01		0	1	
2331	5798	2	\N	1	2018-01-01		0	1	
2339	5812	2	\N	1	2018-01-01		0	1	
2347	5822	3	2	1	2018-01-01		0	1	
2355	5838	3	2	1	2018-01-01		0	1	
2363	5857	1	\N	1	2018-01-01		0	1	
2371	5890	2	2	1	2018-01-01		0	1	
2379	5904	2	\N	1	2018-01-01		0	1	
2387	5917	3	7	1	2018-01-01		0	1	
2395	5926	2	2	1	2018-01-01		0	1	
2403	5946	3	2	1	2018-01-01		0	1	
2411	5961	3	4	1	2018-01-01		0	1	
2419	5976	2	\N	1	2018-01-01		0	1	
2427	5996	1	\N	1	2018-01-01		0	1	
2435	6021	2	\N	1	2018-01-01		0	1	
2443	6038	2	\N	1	2018-01-01		0	1	
2451	6053	2	\N	1	2018-01-01		0	1	
2459	6070	2	\N	1	2018-01-01		0	1	
2467	6086	2	2	1	2018-01-01		0	1	
2475	6113	2	\N	1	2018-01-01		0	1	
2483	6126	3	2	1	2018-01-01		0	1	
2491	6144	3	\N	1	2018-01-01		0	1	
2499	6160	3	5	1	2018-01-01		0	1	
2507	6173	2	2	1	2018-01-01		0	1	
2515	6193	2	\N	1	2018-01-01		0	1	
2523	6211	3	2	1	2018-01-01		0	1	
2531	6231	3	2	1	2018-01-01		0	1	
2539	6244	3	\N	1	2018-01-01		0	1	
2547	6262	2	\N	1	2018-01-01		0	1	
2555	6282	2	\N	1	2018-01-01		0	1	
2563	6302	3	\N	1	2018-01-01		0	1	
2571	6316	3	6	1	2018-01-01		0	1	
2579	6340	2	\N	1	2018-01-01		0	1	
2587	6356	2	\N	1	2018-01-01		0	1	
2595	6373	2	\N	1	2018-01-01		0	1	
2603	6399	2	\N	1	2018-01-01		0	1	
2611	6417	2	\N	1	2018-01-01		0	1	
2619	6433	2	\N	1	2018-01-01		0	1	
2627	6455	3	\N	1	2018-01-01		0	1	
2635	6472	3	\N	1	2018-01-01		0	1	
2643	6488	2	\N	1	2018-01-01		0	1	
2651	6506	2	2	1	2018-01-01		0	1	
2659	6532	3	2	1	2018-01-01		0	1	
2667	6551	3	2	1	2018-01-01		0	1	
2675	6569	2	1	1	2018-01-01		0	1	
2683	6584	1	\N	1	2018-01-01		0	1	
2691	6616	3	6	1	2018-01-01		0	1	
2699	6640	3	\N	1	2018-01-01		0	1	
2707	6652	3	2	1	2018-01-01		0	1	
2715	6675	2	\N	1	2018-01-01		0	1	
2723	6691	3	\N	1	2018-01-01		0	1	
2731	6718	1	\N	1	2018-01-01		0	1	
2739	6737	2	\N	1	2018-01-01		0	1	
2747	6753	3	2	1	2018-01-01		0	1	
2755	6764	2	\N	1	2018-01-01		0	1	
2763	6780	3	1	1	2018-01-01		0	1	
2771	6803	2	\N	1	2018-01-01		0	1	
2779	6826	2	\N	1	2018-01-01		0	1	
2787	6843	2	\N	1	2018-01-01		0	1	
2795	6861	3	\N	1	2018-01-01		0	1	
2803	6886	2	\N	1	2018-01-01		0	1	
2811	6903	3	6	1	2018-01-01		0	1	
2819	6928	3	5	1	2018-01-01		0	1	
2827	6954	2	\N	1	2018-01-01		0	1	
2835	6971	3	2	1	2018-01-01		0	1	
2843	6995	1	\N	1	2018-01-01		0	1	
2851	7028	2	\N	1	2018-01-01		0	1	
2859	7041	3	\N	1	2018-01-01		0	1	
2867	7063	3	2	1	2018-01-01		0	1	
2875	7082	1	\N	1	2018-01-01		0	1	
2883	7096	3	2	1	2018-01-01		0	1	
2891	7111	2	\N	1	2018-01-01		0	1	
2899	7129	3	2	1	2018-01-01		0	1	
2907	7151	3	2	1	2018-01-01		0	1	
2915	7162	2	\N	1	2018-01-01		0	1	
2923	7183	3	2	1	2018-01-01		0	1	
2931	7212	3	4	1	2018-01-01		0	1	
2939	7234	3	2	1	2018-01-01		0	1	
2947	7248	2	\N	1	2018-01-01		0	1	
2955	7274	2	\N	1	2018-01-01		0	1	
2963	7294	3	\N	1	2018-01-01		0	1	
2971	7311	2	2	1	2018-01-01		0	1	
2979	7337	\N	2	1	2018-01-01		0	1	
2987	7358	2	\N	1	2018-01-01		0	1	
2995	7378	2	\N	1	2018-01-01		0	1	
3003	7394	2	\N	1	2018-01-01		0	1	
3011	7407	3	\N	1	2018-01-01		0	1	
3019	7425	2	2	1	2018-01-01		0	1	
3027	7438	3	7	1	2018-01-01		0	1	
3035	7451	2	\N	1	2018-01-01		0	1	
3043	7474	2	\N	1	2018-01-01		0	1	
3051	7489	3	2	1	2018-01-01		0	1	
3059	7505	3	\N	1	2018-01-01		0	1	
3067	7533	2	\N	1	2018-01-01		0	1	
3075	7552	3	\N	1	2018-01-01		0	1	
3083	7569	3	2	1	2018-01-01		0	1	
3091	7585	2	\N	1	2018-01-01		0	1	
3099	7607	2	\N	1	2018-01-01		0	1	
3107	7635	3	2	1	2018-01-01		0	1	
3115	7659	2	\N	1	2018-01-01		0	1	
3123	7676	2	\N	1	2018-01-01		0	1	
3131	7705	3	\N	1	2018-01-01		0	1	
3139	7731	2	\N	1	2018-01-01		0	1	
3147	7746	2	\N	1	2018-01-01		0	1	
1792	4461	2	\N	1	2018-01-01		0	1	
1800	4475	3	6	1	2018-01-01		0	1	
1808	4492	2	\N	1	2018-01-01		0	1	
1816	4513	2	1	1	2018-01-01		0	1	
1824	4534	3	6	1	2018-01-01		0	1	
1832	4552	3	\N	1	2018-01-01		0	1	
1840	4574	2	\N	1	2018-01-01		0	1	
1848	4589	2	\N	1	2018-01-01		0	1	
1856	4601	2	\N	1	2018-01-01		0	1	
1864	4624	2	\N	1	2018-01-01		0	1	
1872	4652	2	\N	1	2018-01-01		0	1	
1880	4681	3	2	1	2018-01-01		0	1	
1888	4704	2	\N	1	2018-01-01		0	1	
1896	4725	2	\N	1	2018-01-01		0	1	
1904	4748	2	\N	1	2018-01-01		0	1	
1912	4765	1	\N	1	2018-01-01		0	1	
1920	4780	3	\N	1	2018-01-01		0	1	
1928	4800	2	\N	1	2018-01-01		0	1	
1936	4814	2	\N	1	2018-01-01		0	1	
1944	4834	2	2	1	2018-01-01		0	1	
1952	4849	3	6	1	2018-01-01		0	1	
1960	4870	3	2	1	2018-01-01		0	1	
1968	4890	3	\N	1	2018-01-01		0	1	
1976	4902	3	2	1	2018-01-01		0	1	
1984	4925	3	2	1	2018-01-01		0	1	
1992	4958	1	\N	1	2018-01-01		0	1	
2000	4975	2	\N	1	2018-01-01		0	1	
2008	4994	2	1	1	2018-01-01		0	1	
2016	5010	3	\N	1	2018-01-01		0	1	
2024	5028	2	2	1	2018-01-01		0	1	
2032	5047	3	6	1	2018-01-01		0	1	
2040	5061	2	\N	1	2018-01-01		0	1	
2048	5075	2	\N	1	2018-01-01		0	1	
2056	5103	2	\N	1	2018-01-01		0	1	
2064	5116	2	\N	1	2018-01-01		0	1	
2072	5131	3	6	1	2018-01-01		0	1	
2080	5152	3	5	1	2018-01-01		0	1	
2088	5169	3	6	1	2018-01-01		0	1	
2096	5191	3	6	1	2018-01-01		0	1	
2104	5221	2	\N	1	2018-01-01		0	1	
2112	5238	3	\N	1	2018-01-01		0	1	
2120	5253	2	\N	1	2018-01-01		0	1	
2128	5293	2	\N	1	2018-01-01		0	1	
2136	5312	2	2	1	2018-01-01		0	1	
2144	5332	2	\N	1	2018-01-01		0	1	
2152	5351	2	\N	1	2018-01-01		0	1	
2160	5375	2	\N	1	2018-01-01		0	1	
2168	5387	3	4	1	2018-01-01		0	1	
2176	5406	2	\N	1	2018-01-01		0	1	
2184	5420	2	1	1	2018-01-01		0	1	
2192	5444	2	2	1	2018-01-01		0	1	
2200	5462	3	\N	1	2018-01-01		0	1	
2208	5477	2	\N	1	2018-01-01		0	1	
2216	5493	2	\N	1	2018-01-01		0	1	
2224	5512	3	\N	1	2018-01-01		0	1	
2232	5537	3	2	1	2018-01-01		0	1	
2240	5559	2	\N	1	2018-01-01		0	1	
2248	5576	3	2	1	2018-01-01		0	1	
2256	5597	2	\N	1	2018-01-01		0	1	
2264	5617	3	2	1	2018-01-01		0	1	
2272	5634	2	2	1	2018-01-01		0	1	
2280	5655	2	1	1	2018-01-01		0	1	
2288	5677	2	2	1	2018-01-01		0	1	
2296	5696	2	\N	1	2018-01-01		0	1	
2304	5726	3	\N	1	2018-01-01		0	1	
2312	5747	3	\N	1	2018-01-01		0	1	
2320	5771	1	2	1	2018-01-01		0	1	
2328	5793	2	\N	1	2018-01-01		0	1	
2336	5804	2	\N	1	2018-01-01		0	1	
2344	5819	2	\N	1	2018-01-01		0	1	
2352	5832	2	2	1	2018-01-01		0	1	
2360	5848	3	2	1	2018-01-01		0	1	
2368	5877	3	2	1	2018-01-01		0	1	
2376	5898	1	\N	1	2018-01-01		0	1	
2384	5913	1	\N	1	2018-01-01		0	1	
2392	5923	2	\N	1	2018-01-01		0	1	
2400	5937	2	\N	1	2018-01-01		0	1	
2408	5954	1	\N	1	2018-01-01		0	1	
2416	5970	3	\N	1	2018-01-01		0	1	
2424	5992	3	5	1	2018-01-01		0	1	
2432	6016	2	2	1	2018-01-01		0	1	
2440	6033	3	2	1	2018-01-01		0	1	
2448	6046	3	4	1	2018-01-01		0	1	
2456	6061	2	\N	1	2018-01-01		0	1	
2464	6081	3	2	1	2018-01-01		0	1	
2472	6106	2	\N	1	2018-01-01		0	1	
2480	6123	2	\N	1	2018-01-01		0	1	
2488	6133	3	2	1	2018-01-01		0	1	
2496	6154	2	\N	1	2018-01-01		0	1	
2504	6167	3	\N	1	2018-01-01		0	1	
2512	6190	2	\N	1	2018-01-01		0	1	
2520	6202	2	\N	1	2018-01-01		0	1	
2528	6221	2	\N	1	2018-01-01		0	1	
2536	6240	3	4	1	2018-01-01		0	1	
2544	6255	3	4	1	2018-01-01		0	1	
2552	6273	2	\N	1	2018-01-01		0	1	
2560	6291	3	2	1	2018-01-01		0	1	
2568	6310	2	\N	1	2018-01-01		0	1	
2576	6335	3	4	1	2018-01-01		0	1	
2584	6351	3	2	1	2018-01-01		0	1	
2592	6367	3	1	1	2018-01-01		0	1	
2600	6393	2	2	1	2018-01-01		0	1	
2608	6408	2	1	1	2018-01-01		0	1	
2616	6427	2	\N	1	2018-01-01		0	1	
2624	6448	3	1	1	2018-01-01		0	1	
2632	6467	3	\N	1	2018-01-01		0	1	
2640	6481	3	4	1	2018-01-01		0	1	
2648	6496	3	\N	1	2018-01-01		0	1	
2656	6521	3	\N	1	2018-01-01		0	1	
2664	6545	3	6	1	2018-01-01		0	1	
2672	6560	2	\N	1	2018-01-01		0	1	
2680	6577	2	\N	1	2018-01-01		0	1	
2607	6407	3	\N	1	2018-01-01		0	1	
2615	6425	2	\N	1	2018-01-01		0	1	
2623	6441	2	2	1	2018-01-01		0	1	
2631	6465	3	\N	1	2018-01-01		0	1	
2639	6480	2	2	1	2018-01-01		0	1	
2647	6495	3	2	1	2018-01-01		0	1	
2655	6520	2	1	1	2018-01-01		0	1	
2663	6542	3	\N	1	2018-01-01		0	1	
2671	6558	2	2	1	2018-01-01		0	1	
2679	6576	1	\N	1	2018-01-01		0	1	
2687	6597	3	\N	1	2018-01-01		0	1	
2695	6626	3	6	1	2018-01-01		0	1	
2703	6646	3	2	1	2018-01-01		0	1	
2711	6667	3	\N	1	2018-01-01		0	1	
2719	6684	2	2	1	2018-01-01		0	1	
2727	6702	2	\N	1	2018-01-01		0	1	
2735	6727	3	2	1	2018-01-01		0	1	
2743	6745	2	\N	1	2018-01-01		0	1	
2751	6760	3	2	1	2018-01-01		0	1	
2759	6770	2	1	1	2018-01-01		0	1	
2767	6789	3	2	1	2018-01-01		0	1	
2775	6808	3	\N	1	2018-01-01		0	1	
2783	6836	3	7	1	2018-01-01		0	1	
2791	6850	3	2	1	2018-01-01		0	1	
2799	6870	3	2	1	2018-01-01		0	1	
2807	6891	2	2	1	2018-01-01		0	1	
2815	6916	2	\N	1	2018-01-01		0	1	
2823	6939	3	6	1	2018-01-01		0	1	
2831	6964	3	2	1	2018-01-01		0	1	
2839	6987	3	7	1	2018-01-01		0	1	
2847	7009	3	\N	1	2018-01-01		0	1	
2855	7036	2	\N	1	2018-01-01		0	1	
2863	7048	2	2	1	2018-01-01		0	1	
2871	7070	3	2	1	2018-01-01		0	1	
2879	7089	2	\N	1	2018-01-01		0	1	
2887	7102	2	\N	1	2018-01-01		0	1	
2895	7119	2	\N	1	2018-01-01		0	1	
2903	7140	3	2	1	2018-01-01		0	1	
2911	7157	2	\N	1	2018-01-01		0	1	
2919	7177	2	\N	1	2018-01-01		0	1	
2927	7199	3	2	1	2018-01-01		0	1	
2935	7220	2	2	1	2018-01-01		0	1	
2943	7239	2	\N	1	2018-01-01		0	1	
2951	7258	2	2	1	2018-01-01		0	1	
2959	7286	3	2	1	2018-01-01		0	1	
2967	7301	3	2	1	2018-01-01		0	1	
2975	7327	3	6	1	2018-01-01		0	1	
2983	7350	2	\N	1	2018-01-01		0	1	
2991	7368	3	\N	1	2018-01-01		0	1	
2999	7385	2	\N	1	2018-01-01		0	1	
3007	7402	2	\N	1	2018-01-01		0	1	
3015	7414	3	6	1	2018-01-01		0	1	
3023	7431	2	\N	1	2018-01-01		0	1	
3031	7445	2	\N	1	2018-01-01		0	1	
3039	7464	3	\N	1	2018-01-01		0	1	
3047	7480	3	2	1	2018-01-01		0	1	
3055	7497	3	\N	1	2018-01-01		0	1	
3063	7523	2	\N	1	2018-01-01		0	1	
3071	7542	2	\N	1	2018-01-01		0	1	
3079	7558	2	\N	1	2018-01-01		0	1	
3087	7576	3	2	1	2018-01-01		0	1	
3095	7594	3	2	1	2018-01-01		0	1	
3103	7624	3	2	1	2018-01-01		0	1	
3111	7642	3	2	1	2018-01-01		0	1	
3119	7669	2	\N	1	2018-01-01		0	1	
3127	7696	3	2	1	2018-01-01		0	1	
3135	7714	3	4	1	2018-01-01		0	1	
3143	7738	2	\N	1	2018-01-01		0	1	
3151	7758	2	\N	1	2018-01-01		0	1	
3159	7777	3	6	1	2018-01-01		0	1	
3167	7789	3	6	1	2018-01-01		0	1	
3175	7810	2	\N	1	2018-01-01		0	1	
3183	7830	3	\N	1	2018-01-01		0	1	
3191	7845	3	2	1	2018-01-01		0	1	
3199	7862	2	2	1	2018-01-01		0	1	
3207	7880	3	\N	1	2018-01-01		0	1	
3215	7895	2	\N	1	2018-01-01		0	1	
3223	7911	2	\N	1	2018-01-01		0	1	
3231	7926	2	2	1	2018-01-01		0	1	
3239	7941	\N	2	1	2018-01-01		0	1	
3247	7961	1	2	1	2018-01-01		0	1	
3255	7985	2	\N	1	2018-01-01		0	1	
3263	8001	3	2	1	2018-01-01		0	1	
3271	8025	3	2	1	2018-01-01		0	1	
3279	8038	2	\N	1	2018-01-01		0	1	
3287	8062	1	\N	1	2018-01-01		0	1	
3295	8089	3	2	1	2018-01-01		0	1	
3303	8102	3	\N	1	2018-01-01		0	1	
3311	8116	2	\N	1	2018-01-01		0	1	
3319	8132	2	\N	1	2018-01-01		0	1	
3327	8158	3	2	1	2018-01-01		0	1	
3335	8177	3	2	1	2018-01-01		0	1	
3343	8200	3	\N	1	2018-01-01		0	1	
3351	8222	2	\N	1	2018-01-01		0	1	
3359	8248	\N	2	1	2018-01-01		0	1	
3367	8274	2	1	1	2018-01-01		0	1	
3375	8295	2	\N	1	2018-01-01		0	1	
3383	8312	\N	2	1	2018-01-01		0	1	
3391	8333	2	2	1	2018-01-01		0	1	
3399	8349	2	\N	1	2018-01-01		0	1	
3407	8370	1	\N	1	2018-01-01		0	1	
3415	8393	2	\N	1	2018-01-01		0	1	
3423	8408	3	2	1	2018-01-01		0	1	
3431	8432	2	\N	1	2018-01-01		0	1	
3439	8444	3	7	1	2018-01-01		0	1	
3447	8454	2	\N	1	2018-01-01		0	1	
3455	8475	2	\N	1	2018-01-01		0	1	
3463	8502	2	\N	1	2018-01-01		0	1	
3471	8523	2	2	1	2018-01-01		0	1	
3479	8536	1	2	1	2018-01-01		0	1	
3487	8551	2	\N	1	2018-01-01		0	1	
3495	8567	1	2	1	2018-01-01		0	1	
3503	8590	3	\N	1	2018-01-01		0	1	
2688	6604	3	1	1	2018-01-01		0	1	
2696	6627	1	\N	1	2018-01-01		0	1	
2704	6648	3	\N	1	2018-01-01		0	1	
2712	6668	2	\N	1	2018-01-01		0	1	
2720	6687	2	\N	1	2018-01-01		0	1	
2728	6704	2	\N	1	2018-01-01		0	1	
2736	6728	3	6	1	2018-01-01		0	1	
2744	6746	2	\N	1	2018-01-01		0	1	
2752	6761	3	6	1	2018-01-01		0	1	
2760	6771	3	\N	1	2018-01-01		0	1	
2768	6795	2	\N	1	2018-01-01		0	1	
2776	6811	2	\N	1	2018-01-01		0	1	
2784	6839	2	1	1	2018-01-01		0	1	
2792	6856	2	1	1	2018-01-01		0	1	
2800	6873	2	\N	1	2018-01-01		0	1	
2808	6892	3	\N	1	2018-01-01		0	1	
2816	6922	2	\N	1	2018-01-01		0	1	
2824	6940	1	\N	1	2018-01-01		0	1	
2832	6965	2	\N	1	2018-01-01		0	1	
2840	6991	2	2	1	2018-01-01		0	1	
2848	7013	2	\N	1	2018-01-01		0	1	
2856	7038	1	\N	1	2018-01-01		0	1	
2864	7051	3	2	1	2018-01-01		0	1	
2872	7074	2	\N	1	2018-01-01		0	1	
2880	7090	2	\N	1	2018-01-01		0	1	
2888	7103	3	2	1	2018-01-01		0	1	
2896	7120	1	\N	1	2018-01-01		0	1	
2904	7142	3	2	1	2018-01-01		0	1	
2912	7158	2	\N	1	2018-01-01		0	1	
2920	7178	2	\N	1	2018-01-01		0	1	
2928	7200	3	\N	1	2018-01-01		0	1	
2936	7224	3	2	1	2018-01-01		0	1	
2944	7240	3	2	1	2018-01-01		0	1	
2952	7259	2	1	1	2018-01-01		0	1	
2960	7287	1	\N	1	2018-01-01		0	1	
2968	7302	3	\N	1	2018-01-01		0	1	
2976	7328	3	\N	1	2018-01-01		0	1	
2984	7351	3	\N	1	2018-01-01		0	1	
2992	7369	3	7	1	2018-01-01		0	1	
3000	7388	1	\N	1	2018-01-01		0	1	
3008	7403	2	\N	1	2018-01-01		0	1	
3016	7419	3	\N	1	2018-01-01		0	1	
3024	7433	3	6	1	2018-01-01		0	1	
3032	7446	2	\N	1	2018-01-01		0	1	
3040	7465	2	\N	1	2018-01-01		0	1	
3048	7482	3	2	1	2018-01-01		0	1	
3056	7499	2	\N	1	2018-01-01		0	1	
3064	7526	2	\N	1	2018-01-01		0	1	
3072	7545	3	6	1	2018-01-01		0	1	
3080	7560	2	\N	1	2018-01-01		0	1	
3088	7581	3	4	1	2018-01-01		0	1	
3096	7596	2	\N	1	2018-01-01		0	1	
3104	7626	3	2	1	2018-01-01		0	1	
3112	7651	\N	2	1	2018-01-01		0	1	
3120	7670	2	\N	1	2018-01-01		0	1	
3128	7697	2	\N	1	2018-01-01		0	1	
3136	7715	2	\N	1	2018-01-01		0	1	
3144	7740	2	\N	1	2018-01-01		0	1	
3152	7759	2	\N	1	2018-01-01		0	1	
3160	7779	3	\N	1	2018-01-01		0	1	
3168	7792	2	2	1	2018-01-01		0	1	
3176	7811	2	\N	1	2018-01-01		0	1	
3184	7832	2	\N	1	2018-01-01		0	1	
3192	7846	3	2	1	2018-01-01		0	1	
3200	7863	1	\N	1	2018-01-01		0	1	
3208	7881	2	\N	1	2018-01-01		0	1	
3216	7898	2	\N	1	2018-01-01		0	1	
3224	7912	1	\N	1	2018-01-01		0	1	
3232	7928	1	\N	1	2018-01-01		0	1	
3240	7943	3	2	1	2018-01-01		0	1	
3248	7962	3	2	1	2018-01-01		0	1	
3256	7986	3	\N	1	2018-01-01		0	1	
3264	8002	3	\N	1	2018-01-01		0	1	
3272	8028	2	\N	1	2018-01-01		0	1	
3280	8040	2	\N	1	2018-01-01		0	1	
3288	8066	3	2	1	2018-01-01		0	1	
3296	8090	2	\N	1	2018-01-01		0	1	
3304	8103	2	\N	1	2018-01-01		0	1	
3312	8118	\N	7	1	2018-01-01		0	1	
3320	8133	3	\N	1	2018-01-01		0	1	
3328	8160	3	2	1	2018-01-01		0	1	
3336	8183	2	1	1	2018-01-01		0	1	
3344	8201	3	2	1	2018-01-01		0	1	
3352	8223	2	1	1	2018-01-01		0	1	
3360	8252	2	2	1	2018-01-01		0	1	
3368	8276	2	2	1	2018-01-01		0	1	
3376	8297	2	\N	1	2018-01-01		0	1	
3384	8314	2	\N	1	2018-01-01		0	1	
3392	8334	3	\N	1	2018-01-01		0	1	
3400	8350	1	\N	1	2018-01-01		0	1	
3408	8371	3	2	1	2018-01-01		0	1	
3416	8395	3	2	1	2018-01-01		0	1	
3424	8411	3	2	1	2018-01-01		0	1	
3432	8435	3	4	1	2018-01-01		0	1	
3440	8445	3	2	1	2018-01-01		0	1	
3448	8459	3	2	1	2018-01-01		0	1	
3456	8478	3	2	1	2018-01-01		0	1	
3464	8504	2	\N	1	2018-01-01		0	1	
3472	8525	2	\N	1	2018-01-01		0	1	
3480	8539	2	\N	1	2018-01-01		0	1	
3488	8552	3	\N	1	2018-01-01		0	1	
3496	8570	2	\N	1	2018-01-01		0	1	
3504	8592	3	2	1	2018-01-01		0	1	
3512	8611	2	\N	1	2018-01-01		0	1	
3520	8625	2	\N	1	2018-01-01		0	1	
3528	8636	3	6	1	2018-01-01		0	1	
3536	8656	3	\N	1	2018-01-01		0	1	
3544	8682	2	2	1	2018-01-01		0	1	
3552	8697	3	\N	1	2018-01-01		0	1	
3560	8717	3	5	1	2018-01-01		0	1	
3568	8732	2	\N	1	2018-01-01		0	1	
3155	7769	3	6	1	2018-01-01		0	1	
3163	7782	3	2	1	2018-01-01		0	1	
3171	7799	3	6	1	2018-01-01		0	1	
3179	7820	3	7	1	2018-01-01		0	1	
3187	7839	2	\N	1	2018-01-01		0	1	
3195	7853	2	2	1	2018-01-01		0	1	
3203	7869	3	2	1	2018-01-01		0	1	
3211	7887	3	2	1	2018-01-01		0	1	
3219	7905	3	\N	1	2018-01-01		0	1	
3227	7918	2	\N	1	2018-01-01		0	1	
3235	7936	2	\N	1	2018-01-01		0	1	
3243	7948	2	2	1	2018-01-01		0	1	
3251	7972	1	\N	1	2018-01-01		0	1	
3259	7993	2	\N	1	2018-01-01		0	1	
3267	8007	2	\N	1	2018-01-01		0	1	
3275	8033	3	2	1	2018-01-01		0	1	
3283	8049	3	\N	1	2018-01-01		0	1	
3291	8071	3	\N	1	2018-01-01		0	1	
3299	8096	2	\N	1	2018-01-01		0	1	
3307	8108	3	2	1	2018-01-01		0	1	
3315	8125	2	\N	1	2018-01-01		0	1	
3323	8139	2	\N	1	2018-01-01		0	1	
3331	8169	2	\N	1	2018-01-01		0	1	
3339	8191	1	\N	1	2018-01-01		0	1	
3347	8211	2	2	1	2018-01-01		0	1	
3355	8235	1	\N	1	2018-01-01		0	1	
3363	8262	2	\N	1	2018-01-01		0	1	
3371	8280	\N	5	1	2018-01-01		0	1	
3379	8302	3	\N	1	2018-01-01		0	1	
3387	8323	3	6	1	2018-01-01		0	1	
3395	8341	3	\N	1	2018-01-01		0	1	
3403	8361	2	1	1	2018-01-01		0	1	
3411	8377	2	\N	1	2018-01-01		0	1	
3419	8400	3	1	1	2018-01-01		0	1	
3427	8421	2	1	1	2018-01-01		0	1	
3435	8440	2	2	1	2018-01-01		0	1	
3443	8448	3	5	1	2018-01-01		0	1	
3451	8464	3	2	1	2018-01-01		0	1	
3459	8489	3	2	1	2018-01-01		0	1	
3467	8515	3	\N	1	2018-01-01		0	1	
3475	8528	2	\N	1	2018-01-01		0	1	
3483	8545	2	\N	1	2018-01-01		0	1	
3491	8560	2	\N	1	2018-01-01		0	1	
3499	8581	3	2	1	2018-01-01		0	1	
3507	8600	2	2	1	2018-01-01		0	1	
3515	8618	3	\N	1	2018-01-01		0	1	
3523	8631	3	6	1	2018-01-01		0	1	
3531	8642	3	\N	1	2018-01-01		0	1	
3539	8664	3	6	1	2018-01-01		0	1	
3547	8685	2	\N	1	2018-01-01		0	1	
3555	8708	2	\N	1	2018-01-01		0	1	
3563	8723	3	2	1	2018-01-01		0	1	
3571	8739	2	2	1	2018-01-01		0	1	
3579	8758	3	2	1	2018-01-01		0	1	
3587	8775	2	\N	1	2018-01-01		0	1	
3595	8786	3	2	1	2018-01-01		0	1	
3603	8802	3	1	1	2018-01-01		0	1	
3611	8817	2	\N	1	2018-01-01		0	1	
3619	8830	2	\N	1	2018-01-01		0	1	
3627	8852	2	2	1	2018-01-01		0	1	
3635	8878	\N	2	1	2018-01-01		0	1	
3643	8902	2	\N	1	2018-01-01		0	1	
3651	8920	2	\N	1	2018-01-01		0	1	
3659	8940	3	2	1	2018-01-01		0	1	
3667	8960	1	\N	1	2018-01-01		0	1	
3675	8981	3	\N	1	2018-01-01		0	1	
3683	8991	3	2	1	2018-01-01		0	1	
3691	9012	2	\N	1	2018-01-01		0	1	
3699	9031	3	\N	1	2018-01-01		0	1	
3707	9049	3	\N	1	2018-01-01		0	1	
3715	9077	3	2	1	2018-01-01		0	1	
3723	9102	2	\N	1	2018-01-01		0	1	
3731	9115	2	\N	1	2018-01-01		0	1	
3739	9133	2	\N	1	2018-01-01		0	1	
3747	9146	2	1	1	2018-01-01		0	1	
3755	9174	2	2	1	2018-01-01		0	1	
3763	9202	1	\N	1	2018-01-01		0	1	
3771	9212	3	6	1	2018-01-01		0	1	
3779	9225	2	\N	1	2018-01-01		0	1	
3787	9245	2	\N	1	2018-01-01		0	1	
3795	9266	2	\N	1	2018-01-01		0	1	
3803	9285	3	\N	1	2018-01-01		0	1	
3811	9311	3	\N	1	2018-01-01		0	1	
3819	9331	\N	2	1	2018-01-01		0	1	
3827	9340	2	2	1	2018-01-01		0	1	
3835	9362	2	\N	1	2018-01-01		0	1	
3843	9381	3	2	1	2018-01-01		0	1	
3851	9399	2	1	1	2018-01-01		0	1	
3859	9414	2	\N	1	2018-01-01		0	1	
3867	9437	2	1	1	2018-01-01		0	1	
3875	9459	2	\N	1	2018-01-01		0	1	
3883	9478	3	2	1	2018-01-01		0	1	
3891	9494	2	\N	1	2018-01-01		0	1	
3899	9513	3	6	1	2018-01-01		0	1	
3907	9532	2	\N	1	2018-01-01		0	1	
3915	9546	2	\N	1	2018-01-01		0	1	
3923	9566	3	\N	1	2018-01-01		0	1	
3931	9592	2	\N	1	2018-01-01		0	1	
3939	9617	2	\N	1	2018-01-01		0	1	
3947	9633	\N	2	1	2018-01-01		0	1	
3955	9652	3	\N	1	2018-01-01		0	1	
3963	9674	2	\N	1	2018-01-01		0	1	
3971	9689	2	\N	1	2018-01-01		0	1	
3979	9712	1	2	1	2018-01-01		0	1	
3987	9726	3	\N	1	2018-01-01		0	1	
3995	9740	3	\N	1	2018-01-01		0	1	
4003	9760	2	\N	1	2018-01-01		0	1	
4011	9771	1	\N	1	2018-01-01		0	1	
4019	9795	3	\N	1	2018-01-01		0	1	
4027	9819	2	\N	1	2018-01-01		0	1	
4035	9839	2	\N	1	2018-01-01		0	1	
4530	10944	3	2	1	2018-01-01		0	1	
2684	6586	3	6	1	2018-01-01		0	1	
2692	6620	3	6	1	2018-01-01		0	1	
2700	6642	2	1	1	2018-01-01		0	1	
2708	6655	2	1	1	2018-01-01		0	1	
2716	6679	2	\N	1	2018-01-01		0	1	
2724	6694	3	\N	1	2018-01-01		0	1	
2732	6721	2	\N	1	2018-01-01		0	1	
2740	6738	2	\N	1	2018-01-01		0	1	
2748	6755	2	\N	1	2018-01-01		0	1	
2756	6765	3	\N	1	2018-01-01		0	1	
2764	6781	3	6	1	2018-01-01		0	1	
2772	6804	2	1	1	2018-01-01		0	1	
2780	6827	3	6	1	2018-01-01		0	1	
2788	6845	3	1	1	2018-01-01		0	1	
2796	6862	3	\N	1	2018-01-01		0	1	
2804	6888	2	\N	1	2018-01-01		0	1	
2812	6907	3	2	1	2018-01-01		0	1	
2820	6933	2	\N	1	2018-01-01		0	1	
2828	6956	3	6	1	2018-01-01		0	1	
2836	6972	2	\N	1	2018-01-01		0	1	
2844	6997	3	2	1	2018-01-01		0	1	
2852	7032	3	5	1	2018-01-01		0	1	
2860	7043	2	\N	1	2018-01-01		0	1	
2868	7065	2	2	1	2018-01-01		0	1	
2876	7085	2	\N	1	2018-01-01		0	1	
2884	7097	2	\N	1	2018-01-01		0	1	
2892	7112	3	1	1	2018-01-01		0	1	
2900	7130	3	7	1	2018-01-01		0	1	
2908	7152	2	\N	1	2018-01-01		0	1	
2916	7167	3	\N	1	2018-01-01		0	1	
2924	7185	2	\N	1	2018-01-01		0	1	
2932	7214	3	2	1	2018-01-01		0	1	
2940	7235	2	\N	1	2018-01-01		0	1	
2948	7251	2	\N	1	2018-01-01		0	1	
2956	7276	3	2	1	2018-01-01		0	1	
2964	7295	2	\N	1	2018-01-01		0	1	
2972	7318	3	\N	1	2018-01-01		0	1	
2980	7342	2	\N	1	2018-01-01		0	1	
2988	7359	2	\N	1	2018-01-01		0	1	
2996	7379	2	\N	1	2018-01-01		0	1	
3004	7397	3	7	1	2018-01-01		0	1	
3012	7409	2	\N	1	2018-01-01		0	1	
3020	7427	3	\N	1	2018-01-01		0	1	
3028	7439	2	\N	1	2018-01-01		0	1	
3036	7453	3	\N	1	2018-01-01		0	1	
3044	7475	2	2	1	2018-01-01		0	1	
3052	7491	3	\N	1	2018-01-01		0	1	
3060	7506	1	\N	1	2018-01-01		0	1	
3068	7534	2	\N	1	2018-01-01		0	1	
3076	7553	2	\N	1	2018-01-01		0	1	
3084	7570	3	5	1	2018-01-01		0	1	
3092	7586	2	2	1	2018-01-01		0	1	
3100	7614	3	2	1	2018-01-01		0	1	
3108	7636	2	\N	1	2018-01-01		0	1	
3116	7663	2	\N	1	2018-01-01		0	1	
3124	7679	2	\N	1	2018-01-01		0	1	
3132	7706	2	\N	1	2018-01-01		0	1	
3140	7734	3	1	1	2018-01-01		0	1	
3148	7753	2	\N	1	2018-01-01		0	1	
3156	7770	2	\N	1	2018-01-01		0	1	
3164	7785	3	7	1	2018-01-01		0	1	
3172	7802	2	1	1	2018-01-01		0	1	
3180	7822	2	\N	1	2018-01-01		0	1	
3188	7841	2	\N	1	2018-01-01		0	1	
3196	7854	2	2	1	2018-01-01		0	1	
3204	7872	3	1	1	2018-01-01		0	1	
3212	7889	2	\N	1	2018-01-01		0	1	
3220	7907	3	\N	1	2018-01-01		0	1	
3228	7921	2	\N	1	2018-01-01		0	1	
3236	7937	3	\N	1	2018-01-01		0	1	
3244	7951	3	7	1	2018-01-01		0	1	
3252	7979	3	2	1	2018-01-01		0	1	
3260	7994	3	\N	1	2018-01-01		0	1	
3268	8015	2	\N	1	2018-01-01		0	1	
3276	8034	3	6	1	2018-01-01		0	1	
3284	8051	1	\N	1	2018-01-01		0	1	
3292	8073	3	\N	1	2018-01-01		0	1	
3300	8097	2	2	1	2018-01-01		0	1	
3308	8111	3	\N	1	2018-01-01		0	1	
3316	8126	3	\N	1	2018-01-01		0	1	
3324	8143	3	7	1	2018-01-01		0	1	
3332	8170	2	2	1	2018-01-01		0	1	
3340	8195	3	\N	1	2018-01-01		0	1	
3348	8214	2	\N	1	2018-01-01		0	1	
3356	8238	3	4	1	2018-01-01		0	1	
3364	8264	1	2	1	2018-01-01		0	1	
3372	8283	2	\N	1	2018-01-01		0	1	
3380	8303	2	\N	1	2018-01-01		0	1	
3388	8328	3	2	1	2018-01-01		0	1	
3396	8342	2	\N	1	2018-01-01		0	1	
3404	8362	2	2	1	2018-01-01		0	1	
3412	8380	1	\N	1	2018-01-01		0	1	
3420	8401	3	\N	1	2018-01-01		0	1	
3428	8424	3	2	1	2018-01-01		0	1	
3436	8441	2	2	1	2018-01-01		0	1	
3444	8449	2	\N	1	2018-01-01		0	1	
3452	8465	2	\N	1	2018-01-01		0	1	
3460	8496	2	\N	1	2018-01-01		0	1	
3468	8516	2	\N	1	2018-01-01		0	1	
3476	8529	2	\N	1	2018-01-01		0	1	
3484	8546	3	\N	1	2018-01-01		0	1	
3492	8563	2	\N	1	2018-01-01		0	1	
3500	8582	3	2	1	2018-01-01		0	1	
3508	8601	3	\N	1	2018-01-01		0	1	
3516	8619	2	\N	1	2018-01-01		0	1	
3524	8632	2	\N	1	2018-01-01		0	1	
3532	8643	2	\N	1	2018-01-01		0	1	
3540	8665	3	2	1	2018-01-01		0	1	
3548	8686	2	\N	1	2018-01-01		0	1	
3556	8709	3	\N	1	2018-01-01		0	1	
3564	8724	3	\N	1	2018-01-01		0	1	
2746	6751	2	2	1	2018-01-01		0	1	
2754	6763	3	\N	1	2018-01-01		0	1	
2762	6776	2	\N	1	2018-01-01		0	1	
2770	6802	2	\N	1	2018-01-01		0	1	
2778	6824	3	2	1	2018-01-01		0	1	
2786	6842	3	2	1	2018-01-01		0	1	
2794	6860	2	\N	1	2018-01-01		0	1	
2802	6883	3	2	1	2018-01-01		0	1	
2810	6901	2	2	1	2018-01-01		0	1	
2818	6925	3	2	1	2018-01-01		0	1	
2826	6948	1	\N	1	2018-01-01		0	1	
2834	6968	3	\N	1	2018-01-01		0	1	
2842	6994	3	2	1	2018-01-01		0	1	
2850	7027	3	2	1	2018-01-01		0	1	
2858	7040	3	2	1	2018-01-01		0	1	
2866	7061	3	2	1	2018-01-01		0	1	
2874	7078	2	\N	1	2018-01-01		0	1	
2882	7094	3	\N	1	2018-01-01		0	1	
2890	7109	2	2	1	2018-01-01		0	1	
2898	7126	3	2	1	2018-01-01		0	1	
2906	7150	2	2	1	2018-01-01		0	1	
2914	7161	2	\N	1	2018-01-01		0	1	
2922	7181	3	\N	1	2018-01-01		0	1	
2930	7208	3	2	1	2018-01-01		0	1	
2938	7231	2	\N	1	2018-01-01		0	1	
2946	7247	3	\N	1	2018-01-01		0	1	
2954	7267	3	2	1	2018-01-01		0	1	
2962	7293	2	1	1	2018-01-01		0	1	
2970	7308	3	2	1	2018-01-01		0	1	
2978	7335	3	\N	1	2018-01-01		0	1	
2986	7356	2	\N	1	2018-01-01		0	1	
2994	7375	3	2	1	2018-01-01		0	1	
3002	7392	2	\N	1	2018-01-01		0	1	
3010	7406	2	2	1	2018-01-01		0	1	
3018	7424	3	\N	1	2018-01-01		0	1	
3026	7437	2	\N	1	2018-01-01		0	1	
3034	7449	3	2	1	2018-01-01		0	1	
3042	7468	3	6	1	2018-01-01		0	1	
3050	7487	3	\N	1	2018-01-01		0	1	
3058	7502	2	1	1	2018-01-01		0	1	
3066	7529	2	\N	1	2018-01-01		0	1	
3074	7550	2	\N	1	2018-01-01		0	1	
3082	7567	2	\N	1	2018-01-01		0	1	
3090	7584	2	\N	1	2018-01-01		0	1	
3098	7605	3	2	1	2018-01-01		0	1	
3106	7629	2	\N	1	2018-01-01		0	1	
3114	7655	3	2	1	2018-01-01		0	1	
3122	7675	2	\N	1	2018-01-01		0	1	
3130	7700	2	\N	1	2018-01-01		0	1	
3138	7725	2	\N	1	2018-01-01		0	1	
3146	7744	3	\N	1	2018-01-01		0	1	
3154	7765	2	\N	1	2018-01-01		0	1	
3162	7781	3	6	1	2018-01-01		0	1	
3170	7794	\N	2	1	2018-01-01		0	1	
3178	7819	2	\N	1	2018-01-01		0	1	
3186	7836	2	\N	1	2018-01-01		0	1	
3194	7852	2	\N	1	2018-01-01		0	1	
3202	7867	3	\N	1	2018-01-01		0	1	
3210	7886	1	\N	1	2018-01-01		0	1	
3218	7904	3	2	1	2018-01-01		0	1	
3226	7915	3	\N	1	2018-01-01		0	1	
3234	7935	3	2	1	2018-01-01		0	1	
3242	7946	3	2	1	2018-01-01		0	1	
3250	7967	3	\N	1	2018-01-01		0	1	
3258	7991	2	\N	1	2018-01-01		0	1	
3266	8005	2	2	1	2018-01-01		0	1	
3274	8032	2	2	1	2018-01-01		0	1	
3282	8046	3	2	1	2018-01-01		0	1	
3290	8070	2	\N	1	2018-01-01		0	1	
3298	8095	2	\N	1	2018-01-01		0	1	
3306	8107	2	\N	1	2018-01-01		0	1	
3314	8122	3	2	1	2018-01-01		0	1	
3322	8136	2	\N	1	2018-01-01		0	1	
3330	8165	2	\N	1	2018-01-01		0	1	
3338	8187	2	2	1	2018-01-01		0	1	
3346	8206	3	\N	1	2018-01-01		0	1	
3354	8231	2	\N	1	2018-01-01		0	1	
3362	8259	3	7	1	2018-01-01		0	1	
3370	8279	3	\N	1	2018-01-01		0	1	
3378	8301	1	\N	1	2018-01-01		0	1	
3386	8321	2	\N	1	2018-01-01		0	1	
3394	8338	2	2	1	2018-01-01		0	1	
3402	8359	3	\N	1	2018-01-01		0	1	
3410	8376	2	\N	1	2018-01-01		0	1	
3418	8399	3	\N	1	2018-01-01		0	1	
3426	8420	2	\N	1	2018-01-01		0	1	
3434	8438	2	\N	1	2018-01-01		0	1	
3442	8447	2	\N	1	2018-01-01		0	1	
3450	8463	3	2	1	2018-01-01		0	1	
3458	8487	2	2	1	2018-01-01		0	1	
3466	8513	3	2	1	2018-01-01		0	1	
3474	8527	2	\N	1	2018-01-01		0	1	
3482	8544	3	2	1	2018-01-01		0	1	
3490	8559	3	2	1	2018-01-01		0	1	
3498	8579	2	\N	1	2018-01-01		0	1	
3506	8598	3	2	1	2018-01-01		0	1	
3514	8617	3	4	1	2018-01-01		0	1	
3522	8630	3	\N	1	2018-01-01		0	1	
3530	8639	2	\N	1	2018-01-01		0	1	
3538	8663	2	\N	1	2018-01-01		0	1	
3546	8684	2	\N	1	2018-01-01		0	1	
3554	8702	2	\N	1	2018-01-01		0	1	
3562	8720	2	\N	1	2018-01-01		0	1	
3570	8737	\N	2	1	2018-01-01		0	1	
3578	8755	3	\N	1	2018-01-01		0	1	
3586	8774	1	2	1	2018-01-01		0	1	
3594	8785	2	\N	1	2018-01-01		0	1	
3602	8799	3	\N	1	2018-01-01		0	1	
3610	8816	3	\N	1	2018-01-01		0	1	
3618	8829	1	\N	1	2018-01-01		0	1	
3626	8851	3	2	1	2018-01-01		0	1	
3634	8877	2	\N	1	2018-01-01		0	1	
2597	6381	2	\N	1	2018-01-01		0	1	
2605	6402	2	\N	1	2018-01-01		0	1	
2613	6421	2	\N	1	2018-01-01		0	1	
2621	6436	2	\N	1	2018-01-01		0	1	
2629	6459	2	\N	1	2018-01-01		0	1	
2637	6474	3	\N	1	2018-01-01		0	1	
2645	6491	3	4	1	2018-01-01		0	1	
2653	6514	3	6	1	2018-01-01		0	1	
2661	6539	2	\N	1	2018-01-01		0	1	
2669	6553	2	\N	1	2018-01-01		0	1	
2677	6574	2	\N	1	2018-01-01		0	1	
2685	6591	2	\N	1	2018-01-01		0	1	
2693	6621	3	6	1	2018-01-01		0	1	
2701	6643	1	2	1	2018-01-01		0	1	
2709	6661	3	\N	1	2018-01-01		0	1	
2717	6680	2	\N	1	2018-01-01		0	1	
2725	6697	2	\N	1	2018-01-01		0	1	
2733	6723	3	6	1	2018-01-01		0	1	
2741	6742	1	\N	1	2018-01-01		0	1	
2749	6756	2	2	1	2018-01-01		0	1	
2757	6767	3	2	1	2018-01-01		0	1	
2765	6785	3	\N	1	2018-01-01		0	1	
2773	6805	2	2	1	2018-01-01		0	1	
2781	6833	2	\N	1	2018-01-01		0	1	
2789	6846	2	\N	1	2018-01-01		0	1	
2797	6864	2	2	1	2018-01-01		0	1	
2805	6889	3	\N	1	2018-01-01		0	1	
2813	6913	2	\N	1	2018-01-01		0	1	
2821	6935	2	\N	1	2018-01-01		0	1	
2829	6957	2	2	1	2018-01-01		0	1	
2837	6977	3	\N	1	2018-01-01		0	1	
2845	6998	2	\N	1	2018-01-01		0	1	
2853	7033	3	2	1	2018-01-01		0	1	
2861	7045	2	\N	1	2018-01-01		0	1	
2869	7067	3	\N	1	2018-01-01		0	1	
2877	7086	3	7	1	2018-01-01		0	1	
2885	7098	3	\N	1	2018-01-01		0	1	
2893	7113	3	4	1	2018-01-01		0	1	
2901	7131	2	\N	1	2018-01-01		0	1	
2909	7155	3	2	1	2018-01-01		0	1	
2917	7171	3	2	1	2018-01-01		0	1	
2925	7187	3	\N	1	2018-01-01		0	1	
2933	7216	2	2	1	2018-01-01		0	1	
2941	7236	3	\N	1	2018-01-01		0	1	
2949	7253	2	\N	1	2018-01-01		0	1	
2957	7282	1	\N	1	2018-01-01		0	1	
2965	7297	2	4	1	2018-01-01		0	1	
2973	7320	3	2	1	2018-01-01		0	1	
2981	7345	2	\N	1	2018-01-01		0	1	
2989	7365	3	\N	1	2018-01-01		0	1	
2997	7383	2	\N	1	2018-01-01		0	1	
3005	7398	3	2	1	2018-01-01		0	1	
3013	7411	3	2	1	2018-01-01		0	1	
3021	7429	1	\N	1	2018-01-01		0	1	
3029	7440	3	4	1	2018-01-01		0	1	
3037	7454	3	6	1	2018-01-01		0	1	
3045	7478	3	\N	1	2018-01-01		0	1	
3053	7493	2	1	1	2018-01-01		0	1	
3061	7510	2	\N	1	2018-01-01		0	1	
3069	7535	2	2	1	2018-01-01		0	1	
3077	7556	2	1	1	2018-01-01		0	1	
3085	7572	3	\N	1	2018-01-01		0	1	
3093	7587	3	2	1	2018-01-01		0	1	
3101	7615	3	\N	1	2018-01-01		0	1	
3109	7638	3	2	1	2018-01-01		0	1	
3117	7664	2	2	1	2018-01-01		0	1	
3125	7689	2	\N	1	2018-01-01		0	1	
3133	7707	2	\N	1	2018-01-01		0	1	
3141	7735	3	\N	1	2018-01-01		0	1	
3149	7755	2	\N	1	2018-01-01		0	1	
3157	7772	2	\N	1	2018-01-01		0	1	
3165	7786	3	2	1	2018-01-01		0	1	
3173	7804	\N	2	1	2018-01-01		0	1	
3181	7824	2	\N	1	2018-01-01		0	1	
3189	7843	3	\N	1	2018-01-01		0	1	
3197	7856	2	\N	1	2018-01-01		0	1	
3205	7874	2	2	1	2018-01-01		0	1	
3213	7891	2	\N	1	2018-01-01		0	1	
3221	7909	2	\N	1	2018-01-01		0	1	
3229	7923	2	\N	1	2018-01-01		0	1	
3237	7938	3	2	1	2018-01-01		0	1	
3245	7956	2	\N	1	2018-01-01		0	1	
3253	7981	2	\N	1	2018-01-01		0	1	
3261	7998	2	2	1	2018-01-01		0	1	
3269	8018	2	1	1	2018-01-01		0	1	
3277	8035	3	2	1	2018-01-01		0	1	
3285	8052	2	2	1	2018-01-01		0	1	
3293	8080	2	\N	1	2018-01-01		0	1	
3301	8098	3	2	1	2018-01-01		0	1	
3309	8112	2	2	1	2018-01-01		0	1	
3317	8129	3	2	1	2018-01-01		0	1	
3325	8152	2	\N	1	2018-01-01		0	1	
3333	8175	2	2	1	2018-01-01		0	1	
3341	8196	3	2	1	2018-01-01		0	1	
3349	8216	2	\N	1	2018-01-01		0	1	
3357	8239	2	\N	1	2018-01-01		0	1	
3365	8269	2	8	1	2018-01-01		0	1	
3373	8288	3	6	1	2018-01-01		0	1	
3381	8306	2	\N	1	2018-01-01		0	1	
3389	8330	2	\N	1	2018-01-01		0	1	
3397	8343	2	\N	1	2018-01-01		0	1	
3405	8365	2	\N	1	2018-01-01		0	1	
3413	8389	1	2	1	2018-01-01		0	1	
3421	8405	2	1	1	2018-01-01		0	1	
3429	8427	3	2	1	2018-01-01		0	1	
3437	8442	2	\N	1	2018-01-01		0	1	
3445	8451	3	2	1	2018-01-01		0	1	
3453	8467	2	\N	1	2018-01-01		0	1	
3461	8499	2	\N	1	2018-01-01		0	1	
3469	8518	3	2	1	2018-01-01		0	1	
3477	8530	3	\N	1	2018-01-01		0	1	
3485	8548	2	\N	1	2018-01-01		0	1	
3198	7861	\N	2	1	2018-01-01		0	1	
3206	7877	2	\N	1	2018-01-01		0	1	
3214	7894	2	2	1	2018-01-01		0	1	
3222	7910	2	\N	1	2018-01-01		0	1	
3230	7924	3	\N	1	2018-01-01		0	1	
3238	7940	2	\N	1	2018-01-01		0	1	
3246	7957	2	2	1	2018-01-01		0	1	
3254	7982	2	\N	1	2018-01-01		0	1	
3262	7999	3	\N	1	2018-01-01		0	1	
3270	8022	3	2	1	2018-01-01		0	1	
3278	8037	2	\N	1	2018-01-01		0	1	
3286	8058	2	\N	1	2018-01-01		0	1	
3294	8085	2	\N	1	2018-01-01		0	1	
3302	8099	2	\N	1	2018-01-01		0	1	
3310	8115	3	\N	1	2018-01-01		0	1	
3318	8130	3	7	1	2018-01-01		0	1	
3326	8155	2	\N	1	2018-01-01		0	1	
3334	8176	2	\N	1	2018-01-01		0	1	
3342	8198	2	\N	1	2018-01-01		0	1	
3350	8219	3	2	1	2018-01-01		0	1	
3358	8243	2	\N	1	2018-01-01		0	1	
3366	8270	2	\N	1	2018-01-01		0	1	
3374	8293	3	6	1	2018-01-01		0	1	
3382	8309	2	\N	1	2018-01-01		0	1	
3390	8331	2	\N	1	2018-01-01		0	1	
3398	8344	2	\N	1	2018-01-01		0	1	
3406	8369	3	\N	1	2018-01-01		0	1	
3414	8390	3	7	1	2018-01-01		0	1	
3422	8407	2	\N	1	2018-01-01		0	1	
3430	8431	2	\N	1	2018-01-01		0	1	
3438	8443	2	2	1	2018-01-01		0	1	
3446	8453	3	2	1	2018-01-01		0	1	
3454	8468	3	2	1	2018-01-01		0	1	
3462	8501	2	\N	1	2018-01-01		0	1	
3470	8519	2	\N	1	2018-01-01		0	1	
3478	8532	2	\N	1	2018-01-01		0	1	
3486	8549	3	\N	1	2018-01-01		0	1	
3494	8566	2	2	1	2018-01-01		0	1	
3502	8587	3	2	1	2018-01-01		0	1	
3510	8609	2	\N	1	2018-01-01		0	1	
3518	8621	2	\N	1	2018-01-01		0	1	
3526	8634	2	\N	1	2018-01-01		0	1	
3534	8652	2	\N	1	2018-01-01		0	1	
3542	8668	2	\N	1	2018-01-01		0	1	
3550	8691	2	2	1	2018-01-01		0	1	
3558	8715	2	\N	1	2018-01-01		0	1	
3566	8729	3	2	1	2018-01-01		0	1	
3574	8744	2	1	1	2018-01-01		0	1	
3582	8768	2	\N	1	2018-01-01		0	1	
3590	8781	3	\N	1	2018-01-01		0	1	
3598	8795	3	4	1	2018-01-01		0	1	
3606	8806	3	\N	1	2018-01-01		0	1	
3614	8821	3	2	1	2018-01-01		0	1	
3622	8841	2	7	1	2018-01-01		0	1	
3630	8863	2	\N	1	2018-01-01		0	1	
3638	8885	3	7	1	2018-01-01		0	1	
3646	8908	2	\N	1	2018-01-01		0	1	
3654	8927	2	\N	1	2018-01-01		0	1	
3662	8946	2	\N	1	2018-01-01		0	1	
3670	8974	2	\N	1	2018-01-01		0	1	
3678	8986	3	2	1	2018-01-01		0	1	
3686	9001	3	\N	1	2018-01-01		0	1	
3694	9022	3	\N	1	2018-01-01		0	1	
3702	9043	2	\N	1	2018-01-01		0	1	
3710	9058	3	4	1	2018-01-01		0	1	
3718	9089	2	2	1	2018-01-01		0	1	
3726	9108	2	2	1	2018-01-01		0	1	
3734	9124	2	\N	1	2018-01-01		0	1	
3742	9139	3	\N	1	2018-01-01		0	1	
3750	9160	3	6	1	2018-01-01		0	1	
3758	9178	2	\N	1	2018-01-01		0	1	
3766	9205	2	\N	1	2018-01-01		0	1	
3774	9217	2	\N	1	2018-01-01		0	1	
3782	9230	2	\N	1	2018-01-01		0	1	
3790	9251	3	2	1	2018-01-01		0	1	
3798	9274	3	\N	1	2018-01-01		0	1	
3806	9290	1	2	1	2018-01-01		0	1	
3814	9315	1	\N	1	2018-01-01		0	1	
3822	9334	2	\N	1	2018-01-01		0	1	
3830	9346	3	\N	1	2018-01-01		0	1	
3838	9367	3	\N	1	2018-01-01		0	1	
3846	9388	2	\N	1	2018-01-01		0	1	
3854	9404	2	1	1	2018-01-01		0	1	
3862	9419	2	\N	1	2018-01-01		0	1	
3870	9445	2	1	1	2018-01-01		0	1	
3878	9468	1	\N	1	2018-01-01		0	1	
3886	9483	3	\N	1	2018-01-01		0	1	
3894	9497	2	1	1	2018-01-01		0	1	
3902	9522	2	2	1	2018-01-01		0	1	
3910	9540	2	\N	1	2018-01-01		0	1	
3918	9556	3	\N	1	2018-01-01		0	1	
3926	9578	1	2	1	2018-01-01		0	1	
3934	9599	3	6	1	2018-01-01		0	1	
3942	9624	3	\N	1	2018-01-01		0	1	
3950	9642	3	2	1	2018-01-01		0	1	
3958	9659	3	\N	1	2018-01-01		0	1	
3966	9684	3	\N	1	2018-01-01		0	1	
3974	9700	3	2	1	2018-01-01		0	1	
3982	9717	3	2	1	2018-01-01		0	1	
3990	9732	1	2	1	2018-01-01		0	1	
3998	9744	2	\N	1	2018-01-01		0	1	
4006	9765	2	\N	1	2018-01-01		0	1	
4014	9778	2	2	1	2018-01-01		0	1	
4022	9804	3	\N	1	2018-01-01		0	1	
4030	9824	2	2	1	2018-01-01		0	1	
4038	9845	2	\N	1	2018-01-01		0	1	
4046	9862	2	\N	1	2018-01-01		0	1	
4054	9881	2	\N	1	2018-01-01		0	1	
4062	9898	2	\N	1	2018-01-01		0	1	
4070	9912	1	\N	1	2018-01-01		0	1	
4078	9922	1	2	1	2018-01-01		0	1	
2713	6671	2	2	1	2018-01-01		0	1	
2721	6688	2	\N	1	2018-01-01		0	1	
2729	6710	2	\N	1	2018-01-01		0	1	
2737	6729	3	2	1	2018-01-01		0	1	
2745	6750	3	\N	1	2018-01-01		0	1	
2753	6762	3	2	1	2018-01-01		0	1	
2761	6775	3	\N	1	2018-01-01		0	1	
2769	6797	3	\N	1	2018-01-01		0	1	
2777	6815	2	\N	1	2018-01-01		0	1	
2785	6840	3	7	1	2018-01-01		0	1	
2793	6857	2	\N	1	2018-01-01		0	1	
2801	6875	3	\N	1	2018-01-01		0	1	
2809	6894	2	\N	1	2018-01-01		0	1	
2817	6924	2	\N	1	2018-01-01		0	1	
2825	6942	3	\N	1	2018-01-01		0	1	
2833	6966	2	1	1	2018-01-01		0	1	
2841	6993	3	2	1	2018-01-01		0	1	
2849	7015	2	\N	1	2018-01-01		0	1	
2857	7039	3	6	1	2018-01-01		0	1	
2865	7058	3	1	1	2018-01-01		0	1	
2873	7076	2	\N	1	2018-01-01		0	1	
2881	7091	2	\N	1	2018-01-01		0	1	
2889	7106	3	6	1	2018-01-01		0	1	
2897	7122	3	\N	1	2018-01-01		0	1	
2905	7148	2	\N	1	2018-01-01		0	1	
2913	7159	2	\N	1	2018-01-01		0	1	
2921	7180	3	4	1	2018-01-01		0	1	
2929	7201	3	2	1	2018-01-01		0	1	
2937	7229	2	\N	1	2018-01-01		0	1	
2945	7246	2	\N	1	2018-01-01		0	1	
2953	7263	2	\N	1	2018-01-01		0	1	
2961	7290	2	\N	1	2018-01-01		0	1	
2969	7307	3	\N	1	2018-01-01		0	1	
2977	7331	3	2	1	2018-01-01		0	1	
2985	7353	3	6	1	2018-01-01		0	1	
2993	7372	1	\N	1	2018-01-01		0	1	
3001	7389	3	\N	1	2018-01-01		0	1	
3009	7405	3	2	1	2018-01-01		0	1	
3017	7422	1	\N	1	2018-01-01		0	1	
3025	7434	2	1	1	2018-01-01		0	1	
3033	7448	1	2	1	2018-01-01		0	1	
3041	7467	2	\N	1	2018-01-01		0	1	
3049	7486	3	2	1	2018-01-01		0	1	
3057	7500	3	7	1	2018-01-01		0	1	
3065	7528	2	\N	1	2018-01-01		0	1	
3073	7546	2	1	1	2018-01-01		0	1	
3081	7563	2	\N	1	2018-01-01		0	1	
3089	7583	2	1	1	2018-01-01		0	1	
3097	7603	2	\N	1	2018-01-01		0	1	
3105	7628	3	\N	1	2018-01-01		0	1	
3113	7654	1	\N	1	2018-01-01		0	1	
3121	7674	2	\N	1	2018-01-01		0	1	
3129	7699	2	\N	1	2018-01-01		0	1	
3137	7717	2	2	1	2018-01-01		0	1	
3145	7741	2	\N	1	2018-01-01		0	1	
3153	7762	2	\N	1	2018-01-01		0	1	
3161	7780	2	\N	1	2018-01-01		0	1	
3169	7793	2	1	1	2018-01-01		0	1	
3177	7818	2	\N	1	2018-01-01		0	1	
3185	7833	3	\N	1	2018-01-01		0	1	
3193	7847	3	\N	1	2018-01-01		0	1	
3201	7865	2	\N	1	2018-01-01		0	1	
3209	7884	2	2	1	2018-01-01		0	1	
3217	7903	2	\N	1	2018-01-01		0	1	
3225	7914	2	\N	1	2018-01-01		0	1	
3233	7930	3	2	1	2018-01-01		0	1	
3241	7944	2	\N	1	2018-01-01		0	1	
3249	7964	3	1	1	2018-01-01		0	1	
3257	7987	3	5	1	2018-01-01		0	1	
3265	8004	2	1	1	2018-01-01		0	1	
3273	8030	3	\N	1	2018-01-01		0	1	
3281	8045	3	\N	1	2018-01-01		0	1	
3289	8068	3	\N	1	2018-01-01		0	1	
3297	8094	2	2	1	2018-01-01		0	1	
3305	8105	3	\N	1	2018-01-01		0	1	
3313	8121	2	\N	1	2018-01-01		0	1	
3321	8135	2	2	1	2018-01-01		0	1	
3329	8161	3	\N	1	2018-01-01		0	1	
3337	8186	2	\N	1	2018-01-01		0	1	
3345	8205	3	\N	1	2018-01-01		0	1	
3353	8225	3	\N	1	2018-01-01		0	1	
3361	8257	3	2	1	2018-01-01		0	1	
3369	8277	3	\N	1	2018-01-01		0	1	
3377	8299	2	\N	1	2018-01-01		0	1	
3385	8315	3	2	1	2018-01-01		0	1	
3393	8336	3	\N	1	2018-01-01		0	1	
3401	8352	3	2	1	2018-01-01		0	1	
3409	8373	2	\N	1	2018-01-01		0	1	
3417	8396	2	\N	1	2018-01-01		0	1	
3425	8419	3	6	1	2018-01-01		0	1	
3433	8436	2	\N	1	2018-01-01		0	1	
3441	8446	\N	2	1	2018-01-01		0	1	
3449	8462	3	2	1	2018-01-01		0	1	
3457	8481	2	\N	1	2018-01-01		0	1	
3465	8506	3	6	1	2018-01-01		0	1	
3473	8526	2	2	1	2018-01-01		0	1	
3481	8543	3	6	1	2018-01-01		0	1	
3489	8557	2	1	1	2018-01-01		0	1	
3497	8571	3	\N	1	2018-01-01		0	1	
3505	8595	2	\N	1	2018-01-01		0	1	
3513	8614	1	2	1	2018-01-01		0	1	
3521	8626	2	\N	1	2018-01-01		0	1	
3529	8638	2	\N	1	2018-01-01		0	1	
3537	8660	2	\N	1	2018-01-01		0	1	
3545	8683	3	2	1	2018-01-01		0	1	
3553	8700	2	1	1	2018-01-01		0	1	
3561	8718	3	6	1	2018-01-01		0	1	
3569	8736	3	2	1	2018-01-01		0	1	
3577	8751	3	1	1	2018-01-01		0	1	
3585	8772	2	\N	1	2018-01-01		0	1	
3593	8784	3	\N	1	2018-01-01		0	1	
3601	8798	2	\N	1	2018-01-01		0	1	
3609	8815	2	\N	1	2018-01-01		0	1	
3617	8827	2	\N	1	2018-01-01		0	1	
3625	8845	3	\N	1	2018-01-01		0	1	
3633	8869	2	\N	1	2018-01-01		0	1	
3641	8897	2	\N	1	2018-01-01		0	1	
3649	8916	2	\N	1	2018-01-01		0	1	
3657	8938	2	\N	1	2018-01-01		0	1	
3665	8954	3	\N	1	2018-01-01		0	1	
3673	8978	2	2	1	2018-01-01		0	1	
3681	8989	2	2	1	2018-01-01		0	1	
3689	9010	3	2	1	2018-01-01		0	1	
3697	9028	2	2	1	2018-01-01		0	1	
3705	9047	3	4	1	2018-01-01		0	1	
3713	9070	2	2	1	2018-01-01		0	1	
3721	9095	3	2	1	2018-01-01		0	1	
3729	9112	2	2	1	2018-01-01		0	1	
3737	9130	3	6	1	2018-01-01		0	1	
3745	9143	3	2	1	2018-01-01		0	1	
3753	9167	3	1	1	2018-01-01		0	1	
3761	9195	3	2	1	2018-01-01		0	1	
3769	9210	2	\N	1	2018-01-01		0	1	
3777	9221	3	4	1	2018-01-01		0	1	
3785	9239	3	\N	1	2018-01-01		0	1	
3793	9259	2	\N	1	2018-01-01		0	1	
3801	9283	2	\N	1	2018-01-01		0	1	
3809	9300	3	2	1	2018-01-01		0	1	
3817	9324	2	\N	1	2018-01-01		0	1	
3825	9338	3	\N	1	2018-01-01		0	1	
3833	9360	2	\N	1	2018-01-01		0	1	
3841	9370	2	\N	1	2018-01-01		0	1	
3849	9393	3	\N	1	2018-01-01		0	1	
3857	9410	2	\N	1	2018-01-01		0	1	
3865	9430	3	2	1	2018-01-01		0	1	
3873	9455	2	\N	1	2018-01-01		0	1	
3881	9475	3	6	1	2018-01-01		0	1	
3889	9489	2	\N	1	2018-01-01		0	1	
3897	9508	3	2	1	2018-01-01		0	1	
3905	9528	2	\N	1	2018-01-01		0	1	
3913	9543	2	1	1	2018-01-01		0	1	
3921	9563	2	\N	1	2018-01-01		0	1	
3929	9588	2	\N	1	2018-01-01		0	1	
3937	9604	3	\N	1	2018-01-01		0	1	
3945	9631	2	\N	1	2018-01-01		0	1	
3953	9648	2	2	1	2018-01-01		0	1	
3961	9670	2	\N	1	2018-01-01		0	1	
3969	9687	3	6	1	2018-01-01		0	1	
3977	9709	3	6	1	2018-01-01		0	1	
3985	9723	2	2	1	2018-01-01		0	1	
3993	9736	3	2	1	2018-01-01		0	1	
4001	9749	2	\N	1	2018-01-01		0	1	
4009	9768	2	\N	1	2018-01-01		0	1	
4017	9787	2	2	1	2018-01-01		0	1	
4025	9815	3	7	1	2018-01-01		0	1	
4033	9832	3	2	1	2018-01-01		0	1	
4041	9854	3	\N	1	2018-01-01		0	1	
4049	9869	3	2	1	2018-01-01		0	1	
4057	9886	3	2	1	2018-01-01		0	1	
4065	9906	2	2	1	2018-01-01		0	1	
4073	9917	3	4	1	2018-01-01		0	1	
4081	9927	2	\N	1	2018-01-01		0	1	
4089	9941	2	2	1	2018-01-01		0	1	
4097	9953	3	2	1	2018-01-01		0	1	
4105	9977	2	\N	1	2018-01-01		0	1	
4113	9997	1	\N	1	2018-01-01		0	1	
4121	10022	3	\N	1	2018-01-01		0	1	
4129	10046	1	2	1	2018-01-01		0	1	
4137	10058	2	\N	1	2018-01-01		0	1	
4145	10072	2	1	1	2018-01-01		0	1	
4153	10092	1	\N	1	2018-01-01		0	1	
4161	10116	3	2	1	2018-01-01		0	1	
4169	10128	3	2	1	2018-01-01		0	1	
4177	10150	3	6	1	2018-01-01		0	1	
4185	10187	3	2	1	2018-01-01		0	1	
4193	10201	2	2	1	2018-01-01		0	1	
4201	10223	2	\N	1	2018-01-01		0	1	
4209	10239	2	\N	1	2018-01-01		0	1	
4217	10251	2	\N	1	2018-01-01		0	1	
4225	10265	\N	2	1	2018-01-01		0	1	
4233	10282	3	\N	1	2018-01-01		0	1	
4241	10292	\N	2	1	2018-01-01		0	1	
4249	10313	2	\N	1	2018-01-01		0	1	
4257	10325	3	\N	1	2018-01-01		0	1	
4265	10341	2	\N	1	2018-01-01		0	1	
4273	10356	3	2	1	2018-01-01		0	1	
4281	10372	3	\N	1	2018-01-01		0	1	
4289	10381	2	\N	1	2018-01-01		0	1	
4297	10400	3	2	1	2018-01-01		0	1	
4305	10418	3	\N	1	2018-01-01		0	1	
4313	10434	2	\N	1	2018-01-01		0	1	
4321	10455	3	\N	1	2018-01-01		0	1	
4329	10477	2	\N	1	2018-01-01		0	1	
4337	10500	2	\N	1	2018-01-01		0	1	
4345	10526	2	2	1	2018-01-01		0	1	
4353	10541	2	2	1	2018-01-01		0	1	
4361	10563	2	\N	1	2018-01-01		0	1	
4369	10579	2	\N	1	2018-01-01		0	1	
4377	10592	3	\N	1	2018-01-01		0	1	
4385	10613	2	\N	1	2018-01-01		0	1	
4393	10631	3	\N	1	2018-01-01		0	1	
4401	10645	2	\N	1	2018-01-01		0	1	
4409	10662	2	\N	1	2018-01-01		0	1	
4417	10686	2	1	1	2018-01-01		0	1	
4425	10698	2	2	1	2018-01-01		0	1	
4433	10720	2	\N	1	2018-01-01		0	1	
4441	10743	2	\N	1	2018-01-01		0	1	
4449	10759	2	\N	1	2018-01-01		0	1	
4457	10781	3	6	1	2018-01-01		0	1	
4465	10793	2	\N	1	2018-01-01		0	1	
4473	10816	2	\N	1	2018-01-01		0	1	
4481	10827	2	\N	1	2018-01-01		0	1	
4489	10843	2	\N	1	2018-01-01		0	1	
4497	10874	2	\N	1	2018-01-01		0	1	
3642	8898	2	\N	1	2018-01-01		0	1	
3650	8919	3	2	1	2018-01-01		0	1	
3658	8939	2	\N	1	2018-01-01		0	1	
3666	8959	3	2	1	2018-01-01		0	1	
3674	8979	\N	7	1	2018-01-01		0	1	
3682	8990	3	\N	1	2018-01-01		0	1	
3690	9011	3	\N	1	2018-01-01		0	1	
3698	9030	3	\N	1	2018-01-01		0	1	
3706	9048	1	2	1	2018-01-01		0	1	
3714	9075	2	\N	1	2018-01-01		0	1	
3722	9097	2	\N	1	2018-01-01		0	1	
3730	9114	3	\N	1	2018-01-01		0	1	
3738	9131	2	1	1	2018-01-01		0	1	
3746	9145	3	\N	1	2018-01-01		0	1	
3754	9171	2	\N	1	2018-01-01		0	1	
3762	9201	2	2	1	2018-01-01		0	1	
3770	9211	2	\N	1	2018-01-01		0	1	
3778	9224	3	\N	1	2018-01-01		0	1	
3786	9241	3	\N	1	2018-01-01		0	1	
3794	9260	2	\N	1	2018-01-01		0	1	
3802	9284	3	2	1	2018-01-01		0	1	
3810	9303	3	\N	1	2018-01-01		0	1	
3818	9328	2	\N	1	2018-01-01		0	1	
3826	9339	2	\N	1	2018-01-01		0	1	
3834	9361	3	2	1	2018-01-01		0	1	
3842	9374	3	\N	1	2018-01-01		0	1	
3850	9394	2	\N	1	2018-01-01		0	1	
3858	9412	1	\N	1	2018-01-01		0	1	
3866	9434	2	2	1	2018-01-01		0	1	
3874	9458	3	\N	1	2018-01-01		0	1	
3882	9476	2	\N	1	2018-01-01		0	1	
3890	9490	2	\N	1	2018-01-01		0	1	
3898	9511	2	2	1	2018-01-01		0	1	
3906	9529	2	2	1	2018-01-01		0	1	
3914	9544	3	\N	1	2018-01-01		0	1	
3922	9564	2	\N	1	2018-01-01		0	1	
3930	9591	3	2	1	2018-01-01		0	1	
3938	9605	2	\N	1	2018-01-01		0	1	
3946	9632	2	\N	1	2018-01-01		0	1	
3954	9651	3	2	1	2018-01-01		0	1	
3962	9671	2	1	1	2018-01-01		0	1	
3970	9688	3	2	1	2018-01-01		0	1	
3978	9710	2	\N	1	2018-01-01		0	1	
3986	9725	3	2	1	2018-01-01		0	1	
3994	9738	2	\N	1	2018-01-01		0	1	
4002	9757	2	\N	1	2018-01-01		0	1	
4010	9769	2	1	1	2018-01-01		0	1	
4018	9789	2	\N	1	2018-01-01		0	1	
4026	9816	2	\N	1	2018-01-01		0	1	
4034	9835	3	\N	1	2018-01-01		0	1	
4042	9856	2	\N	1	2018-01-01		0	1	
4050	9871	2	\N	1	2018-01-01		0	1	
4058	9887	3	\N	1	2018-01-01		0	1	
4066	9908	3	\N	1	2018-01-01		0	1	
4074	9918	2	\N	1	2018-01-01		0	1	
4082	9928	2	\N	1	2018-01-01		0	1	
4090	9943	2	1	1	2018-01-01		0	1	
4098	9958	3	2	1	2018-01-01		0	1	
4106	9980	3	\N	1	2018-01-01		0	1	
4114	10001	3	\N	1	2018-01-01		0	1	
4122	10027	2	\N	1	2018-01-01		0	1	
4130	10047	2	\N	1	2018-01-01		0	1	
4138	10060	3	\N	1	2018-01-01		0	1	
4146	10074	2	2	1	2018-01-01		0	1	
4154	10093	2	\N	1	2018-01-01		0	1	
4162	10117	3	2	1	2018-01-01		0	1	
4170	10130	2	\N	1	2018-01-01		0	1	
4178	10161	3	\N	1	2018-01-01		0	1	
4186	10188	3	\N	1	2018-01-01		0	1	
4194	10203	3	\N	1	2018-01-01		0	1	
4202	10226	3	2	1	2018-01-01		0	1	
4210	10240	2	\N	1	2018-01-01		0	1	
4218	10252	2	\N	1	2018-01-01		0	1	
4226	10267	2	\N	1	2018-01-01		0	1	
4234	10283	3	\N	1	2018-01-01		0	1	
4242	10293	2	\N	1	2018-01-01		0	1	
4250	10315	2	\N	1	2018-01-01		0	1	
4258	10328	2	\N	1	2018-01-01		0	1	
4266	10342	3	2	1	2018-01-01		0	1	
4274	10357	2	\N	1	2018-01-01		0	1	
4282	10373	3	2	1	2018-01-01		0	1	
4290	10383	3	2	1	2018-01-01		0	1	
4298	10401	3	\N	1	2018-01-01		0	1	
4306	10419	2	\N	1	2018-01-01		0	1	
4314	10435	\N	5	1	2018-01-01		0	1	
4322	10460	3	\N	1	2018-01-01		0	1	
4330	10484	3	6	1	2018-01-01		0	1	
4338	10503	2	\N	1	2018-01-01		0	1	
4346	10529	2	2	1	2018-01-01		0	1	
4354	10545	2	1	1	2018-01-01		0	1	
4362	10564	3	\N	1	2018-01-01		0	1	
4370	10582	1	2	1	2018-01-01		0	1	
4378	10594	2	2	1	2018-01-01		0	1	
4386	10618	2	\N	1	2018-01-01		0	1	
4394	10633	3	\N	1	2018-01-01		0	1	
4402	10647	3	2	1	2018-01-01		0	1	
4410	10663	2	\N	1	2018-01-01		0	1	
4418	10687	2	1	1	2018-01-01		0	1	
4426	10700	3	\N	1	2018-01-01		0	1	
4434	10722	3	\N	1	2018-01-01		0	1	
4442	10744	3	2	1	2018-01-01		0	1	
4450	10760	2	\N	1	2018-01-01		0	1	
4458	10784	1	\N	1	2018-01-01		0	1	
4466	10797	3	2	1	2018-01-01		0	1	
4474	10817	2	2	1	2018-01-01		0	1	
4482	10829	2	\N	1	2018-01-01		0	1	
4490	10846	2	2	1	2018-01-01		0	1	
4498	10875	2	2	1	2018-01-01		0	1	
4506	10898	3	2	1	2018-01-01		0	1	
4514	10913	2	\N	1	2018-01-01		0	1	
4522	10933	2	\N	1	2018-01-01		0	1	
3493	8564	3	\N	1	2018-01-01		0	1	
3501	8584	3	\N	1	2018-01-01		0	1	
3509	8604	2	\N	1	2018-01-01		0	1	
3517	8620	2	\N	1	2018-01-01		0	1	
3525	8633	3	2	1	2018-01-01		0	1	
3533	8650	3	2	1	2018-01-01		0	1	
3541	8666	3	2	1	2018-01-01		0	1	
3549	8690	3	\N	1	2018-01-01		0	1	
3557	8713	2	\N	1	2018-01-01		0	1	
3565	8727	2	\N	1	2018-01-01		0	1	
3573	8742	1	2	1	2018-01-01		0	1	
3581	8767	2	\N	1	2018-01-01		0	1	
3589	8778	3	\N	1	2018-01-01		0	1	
3597	8793	2	\N	1	2018-01-01		0	1	
3605	8805	3	\N	1	2018-01-01		0	1	
3613	8820	2	\N	1	2018-01-01		0	1	
3621	8834	2	\N	1	2018-01-01		0	1	
3629	8860	3	\N	1	2018-01-01		0	1	
3637	8882	1	\N	1	2018-01-01		0	1	
3645	8907	2	2	1	2018-01-01		0	1	
3653	8925	2	\N	1	2018-01-01		0	1	
3661	8943	2	2	1	2018-01-01		0	1	
3669	8973	3	\N	1	2018-01-01		0	1	
3677	8985	2	\N	1	2018-01-01		0	1	
3685	8998	2	\N	1	2018-01-01		0	1	
3693	9019	3	\N	1	2018-01-01		0	1	
3701	9040	3	2	1	2018-01-01		0	1	
3709	9055	3	2	1	2018-01-01		0	1	
3717	9088	3	\N	1	2018-01-01		0	1	
3725	9107	2	\N	1	2018-01-01		0	1	
3733	9123	3	2	1	2018-01-01		0	1	
3741	9138	2	\N	1	2018-01-01		0	1	
3749	9154	2	2	1	2018-01-01		0	1	
3757	9176	2	\N	1	2018-01-01		0	1	
3765	9204	2	\N	1	2018-01-01		0	1	
3773	9215	3	2	1	2018-01-01		0	1	
3781	9227	2	\N	1	2018-01-01		0	1	
3789	9248	2	\N	1	2018-01-01		0	1	
3797	9273	3	6	1	2018-01-01		0	1	
3805	9289	2	\N	1	2018-01-01		0	1	
3813	9314	2	\N	1	2018-01-01		0	1	
3821	9333	2	\N	1	2018-01-01		0	1	
3829	9345	2	\N	1	2018-01-01		0	1	
3837	9365	3	\N	1	2018-01-01		0	1	
3845	9387	1	\N	1	2018-01-01		0	1	
3853	9402	2	\N	1	2018-01-01		0	1	
3861	9418	2	\N	1	2018-01-01		0	1	
3869	9443	2	\N	1	2018-01-01		0	1	
3877	9462	3	2	1	2018-01-01		0	1	
3885	9480	2	\N	1	2018-01-01		0	1	
3893	9496	2	\N	1	2018-01-01		0	1	
3901	9517	3	2	1	2018-01-01		0	1	
3909	9537	2	2	1	2018-01-01		0	1	
3917	9555	2	\N	1	2018-01-01		0	1	
3925	9571	1	2	1	2018-01-01		0	1	
3933	9596	3	2	1	2018-01-01		0	1	
3941	9622	1	2	1	2018-01-01		0	1	
3949	9641	2	\N	1	2018-01-01		0	1	
3957	9654	3	5	1	2018-01-01		0	1	
3965	9676	2	\N	1	2018-01-01		0	1	
3973	9696	2	\N	1	2018-01-01		0	1	
3981	9714	2	2	1	2018-01-01		0	1	
3989	9729	2	\N	1	2018-01-01		0	1	
3997	9742	2	2	1	2018-01-01		0	1	
4005	9763	3	\N	1	2018-01-01		0	1	
4013	9776	3	\N	1	2018-01-01		0	1	
4021	9799	2	2	1	2018-01-01		0	1	
4029	9823	2	2	1	2018-01-01		0	1	
4037	9843	2	\N	1	2018-01-01		0	1	
4045	9861	2	\N	1	2018-01-01		0	1	
4053	9875	2	\N	1	2018-01-01		0	1	
4061	9897	3	\N	1	2018-01-01		0	1	
4069	9911	2	\N	1	2018-01-01		0	1	
4077	9921	2	\N	1	2018-01-01		0	1	
4085	9933	3	\N	1	2018-01-01		0	1	
4093	9947	2	\N	1	2018-01-01		0	1	
4101	9965	1	2	1	2018-01-01		0	1	
4109	9988	1	\N	1	2018-01-01		0	1	
4117	10005	3	2	1	2018-01-01		0	1	
4125	10036	3	6	1	2018-01-01		0	1	
4133	10051	2	\N	1	2018-01-01		0	1	
4141	10066	2	\N	1	2018-01-01		0	1	
4149	10081	3	6	1	2018-01-01		0	1	
4157	10108	3	\N	1	2018-01-01		0	1	
4165	10123	2	\N	1	2018-01-01		0	1	
4173	10144	2	\N	1	2018-01-01		0	1	
4181	10176	3	\N	1	2018-01-01		0	1	
4189	10195	3	2	1	2018-01-01		0	1	
4197	10213	2	\N	1	2018-01-01		0	1	
4205	10233	2	\N	1	2018-01-01		0	1	
4213	10246	3	\N	1	2018-01-01		0	1	
4221	10258	2	\N	1	2018-01-01		0	1	
4229	10274	3	\N	1	2018-01-01		0	1	
4237	10286	2	1	1	2018-01-01		0	1	
4245	10304	2	\N	1	2018-01-01		0	1	
4253	10319	3	2	1	2018-01-01		0	1	
4261	10332	3	2	1	2018-01-01		0	1	
4269	10349	2	\N	1	2018-01-01		0	1	
4277	10365	3	2	1	2018-01-01		0	1	
4285	10377	2	\N	1	2018-01-01		0	1	
4293	10391	3	2	1	2018-01-01		0	1	
4301	10405	3	\N	1	2018-01-01		0	1	
4309	10423	3	2	1	2018-01-01		0	1	
4317	10440	2	\N	1	2018-01-01		0	1	
4325	10469	3	\N	1	2018-01-01		0	1	
4333	10493	3	2	1	2018-01-01		0	1	
4341	10506	2	\N	1	2018-01-01		0	1	
4349	10533	2	\N	1	2018-01-01		0	1	
4357	10550	2	\N	1	2018-01-01		0	1	
4365	10569	3	\N	1	2018-01-01		0	1	
4373	10587	2	\N	1	2018-01-01		0	1	
3576	8748	2	\N	1	2018-01-01		0	1	
3584	8770	3	2	1	2018-01-01		0	1	
3592	8783	3	\N	1	2018-01-01		0	1	
3600	8797	1	\N	1	2018-01-01		0	1	
3608	8811	2	\N	1	2018-01-01		0	1	
3616	8823	3	2	1	2018-01-01		0	1	
3624	8844	3	2	1	2018-01-01		0	1	
3632	8868	2	\N	1	2018-01-01		0	1	
3640	8892	3	\N	1	2018-01-01		0	1	
3648	8914	3	7	1	2018-01-01		0	1	
3656	8933	2	\N	1	2018-01-01		0	1	
3664	8953	\N	2	1	2018-01-01		0	1	
3672	8977	2	\N	1	2018-01-01		0	1	
3680	8988	3	2	1	2018-01-01		0	1	
3688	9007	3	4	1	2018-01-01		0	1	
3696	9027	2	\N	1	2018-01-01		0	1	
3704	9045	1	\N	1	2018-01-01		0	1	
3712	9069	2	\N	1	2018-01-01		0	1	
3720	9092	2	\N	1	2018-01-01		0	1	
3728	9111	3	2	1	2018-01-01		0	1	
3736	9126	2	\N	1	2018-01-01		0	1	
3744	9142	2	2	1	2018-01-01		0	1	
3752	9162	3	2	1	2018-01-01		0	1	
3760	9194	1	2	1	2018-01-01		0	1	
3768	9207	2	\N	1	2018-01-01		0	1	
3776	9219	3	2	1	2018-01-01		0	1	
3784	9236	2	\N	1	2018-01-01		0	1	
3792	9256	2	\N	1	2018-01-01		0	1	
3800	9280	2	\N	1	2018-01-01		0	1	
3808	9294	2	\N	1	2018-01-01		0	1	
3816	9318	1	2	1	2018-01-01		0	1	
3824	9337	3	2	1	2018-01-01		0	1	
3832	9357	2	\N	1	2018-01-01		0	1	
3840	9369	3	2	1	2018-01-01		0	1	
3848	9392	2	\N	1	2018-01-01		0	1	
3856	9409	2	\N	1	2018-01-01		0	1	
3864	9421	2	\N	1	2018-01-01		0	1	
3872	9451	2	\N	1	2018-01-01		0	1	
3880	9472	3	2	1	2018-01-01		0	1	
3888	9486	2	\N	1	2018-01-01		0	1	
3896	9507	2	\N	1	2018-01-01		0	1	
3904	9526	3	2	1	2018-01-01		0	1	
3912	9542	3	2	1	2018-01-01		0	1	
3920	9558	2	\N	1	2018-01-01		0	1	
3928	9586	2	\N	1	2018-01-01		0	1	
3936	9602	2	2	1	2018-01-01		0	1	
3944	9630	2	2	1	2018-01-01		0	1	
3952	9647	2	\N	1	2018-01-01		0	1	
3960	9669	3	2	1	2018-01-01		0	1	
3968	9686	3	2	1	2018-01-01		0	1	
3976	9708	1	2	1	2018-01-01		0	1	
3984	9722	3	\N	1	2018-01-01		0	1	
3992	9735	2	\N	1	2018-01-01		0	1	
4000	9747	2	\N	1	2018-01-01		0	1	
4008	9767	3	2	1	2018-01-01		0	1	
4016	9786	2	\N	1	2018-01-01		0	1	
4024	9813	2	2	1	2018-01-01		0	1	
4032	9828	3	\N	1	2018-01-01		0	1	
4040	9849	2	\N	1	2018-01-01		0	1	
4048	9865	\N	5	1	2018-01-01		0	1	
4056	9883	2	\N	1	2018-01-01		0	1	
4064	9905	3	2	1	2018-01-01		0	1	
4072	9916	2	\N	1	2018-01-01		0	1	
4080	9926	2	\N	1	2018-01-01		0	1	
4088	9940	3	2	1	2018-01-01		0	1	
4096	9951	3	2	1	2018-01-01		0	1	
4104	9974	2	\N	1	2018-01-01		0	1	
4112	9993	2	\N	1	2018-01-01		0	1	
4120	10019	2	\N	1	2018-01-01		0	1	
4128	10044	2	\N	1	2018-01-01		0	1	
4136	10055	1	2	1	2018-01-01		0	1	
4144	10071	2	1	1	2018-01-01		0	1	
4152	10089	2	\N	1	2018-01-01		0	1	
4160	10114	3	2	1	2018-01-01		0	1	
4168	10127	3	2	1	2018-01-01		0	1	
4176	10148	2	\N	1	2018-01-01		0	1	
4184	10186	3	\N	1	2018-01-01		0	1	
4192	10200	2	\N	1	2018-01-01		0	1	
4200	10220	3	\N	1	2018-01-01		0	1	
4208	10237	2	\N	1	2018-01-01		0	1	
4216	10250	1	\N	1	2018-01-01		0	1	
4224	10264	3	2	1	2018-01-01		0	1	
4232	10281	2	\N	1	2018-01-01		0	1	
4240	10291	2	\N	1	2018-01-01		0	1	
4248	10309	2	\N	1	2018-01-01		0	1	
4256	10322	2	2	1	2018-01-01		0	1	
4264	10338	2	\N	1	2018-01-01		0	1	
4272	10354	2	\N	1	2018-01-01		0	1	
4280	10371	2	\N	1	2018-01-01		0	1	
4288	10380	1	\N	1	2018-01-01		0	1	
4296	10398	3	1	1	2018-01-01		0	1	
4304	10412	2	2	1	2018-01-01		0	1	
4312	10430	3	2	1	2018-01-01		0	1	
4320	10449	3	\N	1	2018-01-01		0	1	
4328	10476	1	\N	1	2018-01-01		0	1	
4336	10497	3	5	1	2018-01-01		0	1	
4344	10516	3	\N	1	2018-01-01		0	1	
4352	10538	3	2	1	2018-01-01		0	1	
4360	10562	1	\N	1	2018-01-01		0	1	
4368	10576	2	2	1	2018-01-01		0	1	
4376	10590	3	\N	1	2018-01-01		0	1	
4384	10612	2	\N	1	2018-01-01		0	1	
4392	10630	3	\N	1	2018-01-01		0	1	
4400	10643	3	2	1	2018-01-01		0	1	
4408	10658	2	2	1	2018-01-01		0	1	
4416	10682	1	2	1	2018-01-01		0	1	
4424	10697	2	\N	1	2018-01-01		0	1	
4432	10718	2	\N	1	2018-01-01		0	1	
4440	10742	3	2	1	2018-01-01		0	1	
4448	10758	2	\N	1	2018-01-01		0	1	
4456	10776	2	\N	1	2018-01-01		0	1	
4464	10792	2	\N	1	2018-01-01		0	1	
3572	8741	3	2	1	2018-01-01		0	1	
3580	8762	1	2	1	2018-01-01		0	1	
3588	8777	2	2	1	2018-01-01		0	1	
3596	8789	2	\N	1	2018-01-01		0	1	
3604	8804	3	2	1	2018-01-01		0	1	
3612	8818	3	\N	1	2018-01-01		0	1	
3620	8833	2	\N	1	2018-01-01		0	1	
3628	8857	2	\N	1	2018-01-01		0	1	
3636	8880	3	2	1	2018-01-01		0	1	
3644	8905	2	\N	1	2018-01-01		0	1	
3652	8923	1	2	1	2018-01-01		0	1	
3660	8942	2	2	1	2018-01-01		0	1	
3668	8969	3	2	1	2018-01-01		0	1	
3676	8983	2	\N	1	2018-01-01		0	1	
3684	8996	2	\N	1	2018-01-01		0	1	
3692	9015	2	\N	1	2018-01-01		0	1	
3700	9034	3	\N	1	2018-01-01		0	1	
3708	9054	2	\N	1	2018-01-01		0	1	
3716	9084	3	6	1	2018-01-01		0	1	
3724	9103	\N	2	1	2018-01-01		0	1	
3732	9118	3	\N	1	2018-01-01		0	1	
3740	9137	3	2	1	2018-01-01		0	1	
3748	9149	3	\N	1	2018-01-01		0	1	
3756	9175	3	\N	1	2018-01-01		0	1	
3764	9203	2	\N	1	2018-01-01		0	1	
3772	9213	2	\N	1	2018-01-01		0	1	
3780	9226	3	6	1	2018-01-01		0	1	
3788	9246	3	2	1	2018-01-01		0	1	
3796	9270	1	2	1	2018-01-01		0	1	
3804	9288	2	2	1	2018-01-01		0	1	
3812	9313	3	2	1	2018-01-01		0	1	
3820	9332	2	\N	1	2018-01-01		0	1	
3828	9343	2	2	1	2018-01-01		0	1	
3836	9364	2	\N	1	2018-01-01		0	1	
3844	9386	2	1	1	2018-01-01		0	1	
3852	9400	2	2	1	2018-01-01		0	1	
3860	9416	2	\N	1	2018-01-01		0	1	
3868	9441	2	\N	1	2018-01-01		0	1	
3876	9461	2	\N	1	2018-01-01		0	1	
3884	9479	2	\N	1	2018-01-01		0	1	
3892	9495	3	\N	1	2018-01-01		0	1	
3900	9516	3	2	1	2018-01-01		0	1	
3908	9536	2	\N	1	2018-01-01		0	1	
3916	9554	2	\N	1	2018-01-01		0	1	
3924	9568	2	\N	1	2018-01-01		0	1	
3932	9594	2	\N	1	2018-01-01		0	1	
3940	9620	2	\N	1	2018-01-01		0	1	
3948	9635	1	2	1	2018-01-01		0	1	
3956	9653	2	1	1	2018-01-01		0	1	
3964	9675	2	\N	1	2018-01-01		0	1	
3972	9693	3	6	1	2018-01-01		0	1	
3980	9713	2	1	1	2018-01-01		0	1	
3988	9728	2	\N	1	2018-01-01		0	1	
3996	9741	3	2	1	2018-01-01		0	1	
4004	9762	3	\N	1	2018-01-01		0	1	
4012	9775	2	2	1	2018-01-01		0	1	
4020	9796	3	2	1	2018-01-01		0	1	
4028	9820	2	2	1	2018-01-01		0	1	
4036	9840	3	2	1	2018-01-01		0	1	
4044	9859	2	\N	1	2018-01-01		0	1	
4052	9874	2	\N	1	2018-01-01		0	1	
4060	9890	2	\N	1	2018-01-01		0	1	
4068	9910	\N	2	1	2018-01-01		0	1	
4076	9920	2	\N	1	2018-01-01		0	1	
4084	9931	2	\N	1	2018-01-01		0	1	
4092	9945	2	\N	1	2018-01-01		0	1	
4100	9963	2	\N	1	2018-01-01		0	1	
4108	9985	2	\N	1	2018-01-01		0	1	
4116	10003	3	1	1	2018-01-01		0	1	
4124	10032	2	\N	1	2018-01-01		0	1	
4132	10049	3	2	1	2018-01-01		0	1	
4140	10063	3	\N	1	2018-01-01		0	1	
4148	10080	2	\N	1	2018-01-01		0	1	
4156	10101	3	4	1	2018-01-01		0	1	
4164	10120	2	\N	1	2018-01-01		0	1	
4172	10138	3	2	1	2018-01-01		0	1	
4180	10168	1	\N	1	2018-01-01		0	1	
4188	10194	2	2	1	2018-01-01		0	1	
4196	10211	3	4	1	2018-01-01		0	1	
4204	10232	3	\N	1	2018-01-01		0	1	
4212	10245	1	\N	1	2018-01-01		0	1	
4220	10255	1	\N	1	2018-01-01		0	1	
4228	10271	2	2	1	2018-01-01		0	1	
4236	10285	2	\N	1	2018-01-01		0	1	
4244	10298	3	5	1	2018-01-01		0	1	
4252	10318	1	\N	1	2018-01-01		0	1	
4260	10331	2	\N	1	2018-01-01		0	1	
4268	10348	3	6	1	2018-01-01		0	1	
4276	10362	3	\N	1	2018-01-01		0	1	
4284	10376	2	\N	1	2018-01-01		0	1	
4292	10387	\N	2	1	2018-01-01		0	1	
4300	10403	3	2	1	2018-01-01		0	1	
4308	10422	2	\N	1	2018-01-01		0	1	
4316	10439	2	\N	1	2018-01-01		0	1	
4324	10464	3	\N	1	2018-01-01		0	1	
4332	10491	2	2	1	2018-01-01		0	1	
4340	10505	2	\N	1	2018-01-01		0	1	
4348	10532	2	2	1	2018-01-01		0	1	
4356	10548	2	\N	1	2018-01-01		0	1	
4364	10568	3	5	1	2018-01-01		0	1	
4372	10586	2	1	1	2018-01-01		0	1	
4380	10597	3	1	1	2018-01-01		0	1	
4388	10623	2	\N	1	2018-01-01		0	1	
4396	10639	2	\N	1	2018-01-01		0	1	
4404	10650	3	\N	1	2018-01-01		0	1	
4412	10670	2	\N	1	2018-01-01		0	1	
4420	10689	2	2	1	2018-01-01		0	1	
4428	10706	2	\N	1	2018-01-01		0	1	
4436	10726	3	2	1	2018-01-01		0	1	
4444	10749	3	7	1	2018-01-01		0	1	
4452	10765	2	\N	1	2018-01-01		0	1	
4460	10787	2	\N	1	2018-01-01		0	1	
3511	8610	2	2	1	2018-01-01		0	1	
3519	8624	3	1	1	2018-01-01		0	1	
3527	8635	3	\N	1	2018-01-01		0	1	
3535	8653	2	\N	1	2018-01-01		0	1	
3543	8669	2	2	1	2018-01-01		0	1	
3551	8694	2	\N	1	2018-01-01		0	1	
3559	8716	2	1	1	2018-01-01		0	1	
3567	8731	2	\N	1	2018-01-01		0	1	
3575	8747	2	\N	1	2018-01-01		0	1	
3583	8769	3	\N	1	2018-01-01		0	1	
3591	8782	2	\N	1	2018-01-01		0	1	
3599	8796	3	\N	1	2018-01-01		0	1	
3607	8807	3	\N	1	2018-01-01		0	1	
3615	8822	2	\N	1	2018-01-01		0	1	
3623	8842	2	\N	1	2018-01-01		0	1	
3631	8864	3	1	1	2018-01-01		0	1	
3639	8889	2	2	1	2018-01-01		0	1	
3647	8910	3	\N	1	2018-01-01		0	1	
3655	8932	2	\N	1	2018-01-01		0	1	
3663	8952	2	\N	1	2018-01-01		0	1	
3671	8976	2	\N	1	2018-01-01		0	1	
3679	8987	2	\N	1	2018-01-01		0	1	
3687	9006	2	\N	1	2018-01-01		0	1	
3695	9024	3	\N	1	2018-01-01		0	1	
3703	9044	3	2	1	2018-01-01		0	1	
3711	9061	2	\N	1	2018-01-01		0	1	
3719	9091	2	\N	1	2018-01-01		0	1	
3727	9109	3	2	1	2018-01-01		0	1	
3735	9125	2	2	1	2018-01-01		0	1	
3743	9141	2	\N	1	2018-01-01		0	1	
3751	9161	3	6	1	2018-01-01		0	1	
3759	9184	2	\N	1	2018-01-01		0	1	
3767	9206	2	\N	1	2018-01-01		0	1	
3775	9218	3	6	1	2018-01-01		0	1	
3783	9234	2	\N	1	2018-01-01		0	1	
3791	9253	3	\N	1	2018-01-01		0	1	
3799	9279	3	\N	1	2018-01-01		0	1	
3807	9291	2	\N	1	2018-01-01		0	1	
3815	9317	2	\N	1	2018-01-01		0	1	
3823	9336	2	\N	1	2018-01-01		0	1	
3831	9348	2	\N	1	2018-01-01		0	1	
3839	9368	2	\N	1	2018-01-01		0	1	
3847	9391	2	\N	1	2018-01-01		0	1	
3855	9408	3	7	1	2018-01-01		0	1	
3863	9420	2	\N	1	2018-01-01		0	1	
3871	9449	2	4	1	2018-01-01		0	1	
3879	9469	3	\N	1	2018-01-01		0	1	
3887	9484	3	6	1	2018-01-01		0	1	
3895	9506	2	\N	1	2018-01-01		0	1	
3903	9524	2	\N	1	2018-01-01		0	1	
3911	9541	2	\N	1	2018-01-01		0	1	
3919	9557	2	\N	1	2018-01-01		0	1	
3927	9580	3	6	1	2018-01-01		0	1	
3935	9601	2	\N	1	2018-01-01		0	1	
3943	9626	2	\N	1	2018-01-01		0	1	
3951	9643	3	2	1	2018-01-01		0	1	
3959	9665	3	\N	1	2018-01-01		0	1	
3967	9685	2	\N	1	2018-01-01		0	1	
3975	9702	3	2	1	2018-01-01		0	1	
3983	9719	2	\N	1	2018-01-01		0	1	
3991	9733	2	2	1	2018-01-01		0	1	
3999	9746	3	2	1	2018-01-01		0	1	
4007	9766	2	\N	1	2018-01-01		0	1	
4015	9784	3	2	1	2018-01-01		0	1	
4023	9805	3	2	1	2018-01-01		0	1	
4031	9826	2	\N	1	2018-01-01		0	1	
4039	9848	3	6	1	2018-01-01		0	1	
4047	9863	3	2	1	2018-01-01		0	1	
4055	9882	2	\N	1	2018-01-01		0	1	
4063	9902	3	5	1	2018-01-01		0	1	
4071	9914	2	\N	1	2018-01-01		0	1	
4079	9923	3	\N	1	2018-01-01		0	1	
4087	9939	2	1	1	2018-01-01		0	1	
4095	9950	3	2	1	2018-01-01		0	1	
4103	9969	2	2	1	2018-01-01		0	1	
4111	9992	\N	6	1	2018-01-01		0	1	
4119	10011	2	\N	1	2018-01-01		0	1	
4127	10039	2	\N	1	2018-01-01		0	1	
4135	10053	2	\N	1	2018-01-01		0	1	
4143	10070	2	1	1	2018-01-01		0	1	
4151	10087	2	\N	1	2018-01-01		0	1	
4159	10111	3	2	1	2018-01-01		0	1	
4167	10126	3	6	1	2018-01-01		0	1	
4175	10147	3	2	1	2018-01-01		0	1	
4183	10183	2	2	1	2018-01-01		0	1	
4191	10197	3	2	1	2018-01-01		0	1	
4199	10217	2	\N	1	2018-01-01		0	1	
4207	10236	3	\N	1	2018-01-01		0	1	
4215	10249	3	2	1	2018-01-01		0	1	
4223	10263	3	\N	1	2018-01-01		0	1	
4231	10279	3	\N	1	2018-01-01		0	1	
4239	10290	3	1	1	2018-01-01		0	1	
4247	10307	3	6	1	2018-01-01		0	1	
4255	10321	3	\N	1	2018-01-01		0	1	
4263	10334	2	\N	1	2018-01-01		0	1	
4271	10353	3	6	1	2018-01-01		0	1	
4279	10368	3	6	1	2018-01-01		0	1	
4287	10379	3	2	1	2018-01-01		0	1	
4295	10396	2	\N	1	2018-01-01		0	1	
4303	10410	2	\N	1	2018-01-01		0	1	
4311	10428	3	2	1	2018-01-01		0	1	
4319	10446	3	2	1	2018-01-01		0	1	
4327	10473	3	\N	1	2018-01-01		0	1	
4335	10496	3	\N	1	2018-01-01		0	1	
4343	10515	2	\N	1	2018-01-01		0	1	
4351	10536	1	\N	1	2018-01-01		0	1	
4359	10554	2	1	1	2018-01-01		0	1	
4367	10571	2	\N	1	2018-01-01		0	1	
4375	10589	2	\N	1	2018-01-01		0	1	
4383	10602	3	\N	1	2018-01-01		0	1	
4391	10629	3	\N	1	2018-01-01		0	1	
4399	10642	3	2	1	2018-01-01		0	1	
4505	10897	2	\N	1	2018-01-01		0	1	
4513	10910	3	\N	1	2018-01-01		0	1	
4521	10930	2	1	1	2018-01-01		0	1	
4529	10943	3	2	1	2018-01-01		0	1	
4537	10958	2	\N	1	2018-01-01		0	1	
4545	10971	3	3	1	2018-01-01		0	1	
4553	10986	2	\N	1	2018-01-01		0	1	
4561	11002	3	1	1	2018-01-01		0	1	
4569	11021	3	\N	1	2018-01-01		0	1	
4577	11033	2	\N	1	2018-01-01		0	1	
4585	11049	3	2	1	2018-01-01		0	1	
4593	11065	2	\N	1	2018-01-01		0	1	
4601	11086	2	\N	1	2018-01-01		0	1	
4609	11097	3	\N	1	2018-01-01		0	1	
4617	11108	3	\N	1	2018-01-01		0	1	
4625	11127	3	\N	1	2018-01-01		0	1	
4633	11151	2	\N	1	2018-01-01		0	1	
4641	11174	2	\N	1	2018-01-01		0	1	
4649	11196	3	\N	1	2018-01-01		0	1	
4657	11209	2	\N	1	2018-01-01		0	1	
4665	11227	\N	2	1	2018-01-01		0	1	
4673	11244	2	2	1	2018-01-01		0	1	
4681	11258	2	\N	1	2018-01-01		0	1	
4689	11282	2	\N	1	2018-01-01		0	1	
4697	11302	2	\N	1	2018-01-01		0	1	
4705	11326	2	\N	1	2018-01-01		0	1	
4713	11340	2	\N	1	2018-01-01		0	1	
4721	11352	2	\N	1	2018-01-01		0	1	
4729	11372	2	\N	1	2018-01-01		0	1	
4737	11386	2	\N	1	2018-01-01		0	1	
4745	11412	3	2	1	2018-01-01		0	1	
4753	11433	2	2	1	2018-01-01		0	1	
4761	11454	2	\N	1	2018-01-01		0	1	
4769	11471	3	2	1	2018-01-01		0	1	
4777	11488	2	\N	1	2018-01-01		0	1	
4785	11510	3	2	1	2018-01-01		0	1	
4793	11539	3	2	1	2018-01-01		0	1	
4801	11565	2	2	1	2018-01-01		0	1	
4809	11584	3	\N	1	2018-01-01		0	1	
4817	11608	2	\N	1	2018-01-01		0	1	
4825	11631	3	\N	1	2018-01-01		0	1	
4833	11655	2	2	1	2018-01-01		0	1	
4841	11674	3	4	1	2018-01-01		0	1	
4849	11684	2	1	1	2018-01-01		0	1	
4857	11722	2	\N	1	2018-01-01		0	1	
4865	11735	3	6	1	2018-01-01		0	1	
4873	11758	3	4	1	2018-01-01		0	1	
4881	11770	2	\N	1	2018-01-01		0	1	
4889	11786	2	\N	1	2018-01-01		0	1	
4897	11812	1	\N	1	2018-01-01		0	1	
4905	11836	2	\N	1	2018-01-01		0	1	
4913	11856	3	7	1	2018-01-01		0	1	
4921	11892	3	2	1	2018-01-01		0	1	
4929	11911	3	\N	1	2018-01-01		0	1	
4937	11923	2	2	1	2018-01-01		0	1	
4945	11936	3	\N	1	2018-01-01		0	1	
4953	11950	2	\N	1	2018-01-01		0	1	
4961	11977	3	2	1	2018-01-01		0	1	
4969	11999	2	\N	1	2018-01-01		0	1	
4977	12013	3	\N	1	2018-01-01		0	1	
4985	12026	3	\N	1	2018-01-01		0	1	
4993	12051	2	\N	1	2018-01-01		0	1	
5001	12070	3	\N	1	2018-01-01		0	1	
5009	12092	3	6	1	2018-01-01		0	1	
5017	12115	3	6	1	2018-01-01		0	1	
5025	12134	\N	\N	1	2018-01-01		0	1	
5033	12160	2	\N	1	2018-01-01		0	1	
5041	12181	2	\N	1	2018-01-01		0	1	
5049	12199	2	\N	1	2018-01-01		0	1	
5057	12217	2	\N	1	2018-01-01		0	1	
5065	12237	2	\N	1	2018-01-01		0	1	
5073	12254	3	\N	1	2018-01-01		0	1	
5081	12274	3	2	1	2018-01-01		0	1	
5089	12285	2	\N	1	2018-01-01		0	1	
5097	12304	3	2	1	2018-01-01		0	1	
5105	12318	2	\N	1	2018-01-01		0	1	
5113	12336	3	2	1	2018-01-01		0	1	
5121	12362	2	\N	1	2018-01-01		0	1	
5129	12385	3	\N	1	2018-01-01		0	1	
5137	12401	3	2	1	2018-01-01		0	1	
5145	12419	3	2	1	2018-01-01		0	1	
5153	12435	3	\N	1	2018-01-01		0	1	
5161	12448	2	\N	1	2018-01-01		0	1	
5169	12466	2	\N	1	2018-01-01		0	1	
5177	12481	2	\N	1	2018-01-01		0	1	
5185	12497	2	\N	1	2018-01-01		0	1	
5193	12513	3	7	1	2018-01-01		0	1	
5201	12534	3	\N	1	2018-01-01		0	1	
5209	12548	2	1	1	2018-01-01		0	1	
5217	12561	\N	2	1	2018-01-01		0	1	
5225	12579	3	2	1	2018-01-01		0	1	
5233	12600	2	\N	1	2018-01-01		0	1	
5241	12620	1	2	1	2018-01-01		0	1	
5249	12641	2	\N	1	2018-01-01		0	1	
5257	12666	2	\N	1	2018-01-01		0	1	
5265	12693	1	\N	1	2018-01-01		0	1	
5273	12709	3	2	1	2018-01-01		0	1	
5281	12731	3	2	1	2018-01-01		0	1	
5289	12745	2	\N	1	2018-01-01		0	1	
5297	12756	2	\N	1	2018-01-01		0	1	
5305	12767	2	\N	1	2018-01-01		0	1	
5313	12784	3	\N	1	2018-01-01		0	1	
5321	12797	2	\N	1	2018-01-01		0	1	
5329	12817	1	\N	1	2018-01-01		0	1	
5337	12850	2	\N	1	2018-01-01		0	1	
5345	12870	1	2	1	2018-01-01		0	1	
5353	12894	2	\N	1	2018-01-01		0	1	
5361	12908	3	2	1	2018-01-01		0	1	
5369	12928	2	\N	1	2018-01-01		0	1	
5377	12944	2	\N	1	2018-01-01		0	1	
5385	12963	3	2	1	2018-01-01		0	1	
4407	10657	3	6	1	2018-01-01		0	1	
4415	10679	3	\N	1	2018-01-01		0	1	
4423	10696	2	\N	1	2018-01-01		0	1	
4431	10711	2	\N	1	2018-01-01		0	1	
4439	10735	3	6	1	2018-01-01		0	1	
4447	10756	3	2	1	2018-01-01		0	1	
4455	10773	2	2	1	2018-01-01		0	1	
4463	10791	3	\N	1	2018-01-01		0	1	
4471	10812	3	\N	1	2018-01-01		0	1	
4479	10824	3	2	1	2018-01-01		0	1	
4487	10840	3	2	1	2018-01-01		0	1	
4495	10857	2	\N	1	2018-01-01		0	1	
4503	10893	2	5	1	2018-01-01		0	1	
4511	10908	3	3	1	2018-01-01		0	1	
4519	10922	2	\N	1	2018-01-01		0	1	
4527	10941	2	\N	1	2018-01-01		0	1	
4535	10956	3	2	1	2018-01-01		0	1	
4543	10967	2	\N	1	2018-01-01		0	1	
4551	10980	2	\N	1	2018-01-01		0	1	
4559	10997	2	\N	1	2018-01-01		0	1	
4567	11019	2	\N	1	2018-01-01		0	1	
4575	11031	3	\N	1	2018-01-01		0	1	
4583	11045	3	\N	1	2018-01-01		0	1	
4591	11062	3	\N	1	2018-01-01		0	1	
4599	11083	2	\N	1	2018-01-01		0	1	
4607	11095	2	\N	1	2018-01-01		0	1	
4615	11104	2	\N	1	2018-01-01		0	1	
4623	11119	3	2	1	2018-01-01		0	1	
4631	11140	2	\N	1	2018-01-01		0	1	
4639	11168	2	\N	1	2018-01-01		0	1	
4647	11191	2	2	1	2018-01-01		0	1	
4655	11206	2	\N	1	2018-01-01		0	1	
4663	11216	2	\N	1	2018-01-01		0	1	
4671	11240	2	1	1	2018-01-01		0	1	
4679	11256	3	2	1	2018-01-01		0	1	
4687	11275	2	\N	1	2018-01-01		0	1	
4695	11300	2	2	1	2018-01-01		0	1	
4703	11321	3	2	1	2018-01-01		0	1	
4711	11337	2	\N	1	2018-01-01		0	1	
4719	11350	2	\N	1	2018-01-01		0	1	
4727	11370	3	2	1	2018-01-01		0	1	
4735	11384	2	\N	1	2018-01-01		0	1	
4743	11407	2	\N	1	2018-01-01		0	1	
4751	11428	2	2	1	2018-01-01		0	1	
4759	11448	3	\N	1	2018-01-01		0	1	
4767	11465	3	6	1	2018-01-01		0	1	
4775	11486	3	2	1	2018-01-01		0	1	
4783	11506	2	\N	1	2018-01-01		0	1	
4791	11526	3	2	1	2018-01-01		0	1	
4799	11563	3	2	1	2018-01-01		0	1	
4807	11581	2	\N	1	2018-01-01		0	1	
4815	11605	2	\N	1	2018-01-01		0	1	
4823	11625	2	1	1	2018-01-01		0	1	
4831	11648	3	2	1	2018-01-01		0	1	
4839	11667	2	2	1	2018-01-01		0	1	
4847	11682	2	\N	1	2018-01-01		0	1	
4855	11718	3	2	1	2018-01-01		0	1	
4863	11733	3	2	1	2018-01-01		0	1	
4871	11752	\N	2	1	2018-01-01		0	1	
4879	11768	3	2	1	2018-01-01		0	1	
4887	11782	2	\N	1	2018-01-01		0	1	
4895	11807	3	2	1	2018-01-01		0	1	
4903	11829	\N	2	1	2018-01-01		0	1	
4911	11851	3	\N	1	2018-01-01		0	1	
4919	11882	2	\N	1	2018-01-01		0	1	
4927	11909	2	2	1	2018-01-01		0	1	
4935	11919	3	1	1	2018-01-01		0	1	
4943	11933	3	7	1	2018-01-01		0	1	
4951	11945	3	2	1	2018-01-01		0	1	
4959	11969	2	\N	1	2018-01-01		0	1	
4967	11996	3	\N	1	2018-01-01		0	1	
4975	12009	3	2	1	2018-01-01		0	1	
4983	12024	1	2	1	2018-01-01		0	1	
4991	12038	3	2	1	2018-01-01		0	1	
4999	12065	2	\N	1	2018-01-01		0	1	
5007	12086	3	\N	1	2018-01-01		0	1	
5015	12107	3	1	1	2018-01-01		0	1	
5023	12127	2	2	1	2018-01-01		0	1	
5031	12150	3	2	1	2018-01-01		0	1	
5039	12175	2	\N	1	2018-01-01		0	1	
5047	12195	2	\N	1	2018-01-01		0	1	
5055	12212	3	2	1	2018-01-01		0	1	
5063	12232	3	\N	1	2018-01-01		0	1	
5071	12248	3	2	1	2018-01-01		0	1	
5079	12268	3	\N	1	2018-01-01		0	1	
5087	12283	2	\N	1	2018-01-01		0	1	
5095	12300	2	\N	1	2018-01-01		0	1	
5103	12315	3	2	1	2018-01-01		0	1	
5111	12329	3	2	1	2018-01-01		0	1	
5119	12353	3	4	1	2018-01-01		0	1	
5127	12379	1	2	1	2018-01-01		0	1	
5135	12397	3	2	1	2018-01-01		0	1	
5143	12412	3	6	1	2018-01-01		0	1	
5151	12433	2	\N	1	2018-01-01		0	1	
5159	12443	3	\N	1	2018-01-01		0	1	
5167	12461	2	2	1	2018-01-01		0	1	
5175	12477	2	\N	1	2018-01-01		0	1	
5183	12491	2	2	1	2018-01-01		0	1	
5191	12510	2	\N	1	2018-01-01		0	1	
5199	12530	3	\N	1	2018-01-01		0	1	
5207	12546	3	1	1	2018-01-01		0	1	
5215	12558	3	\N	1	2018-01-01		0	1	
5223	12575	3	4	1	2018-01-01		0	1	
5231	12597	3	\N	1	2018-01-01		0	1	
5239	12617	2	\N	1	2018-01-01		0	1	
5247	12636	2	2	1	2018-01-01		0	1	
5255	12657	3	2	1	2018-01-01		0	1	
5263	12683	2	\N	1	2018-01-01		0	1	
5271	12704	2	\N	1	2018-01-01		0	1	
5279	12729	3	\N	1	2018-01-01		0	1	
5287	12739	2	1	1	2018-01-01		0	1	
5295	12753	3	1	1	2018-01-01		0	1	
5303	12765	2	\N	1	2018-01-01		0	1	
4381	10598	3	2	1	2018-01-01		0	1	
4389	10626	2	\N	1	2018-01-01		0	1	
4397	10640	3	2	1	2018-01-01		0	1	
4405	10655	2	1	1	2018-01-01		0	1	
4413	10674	3	\N	1	2018-01-01		0	1	
4421	10693	2	\N	1	2018-01-01		0	1	
4429	10707	2	\N	1	2018-01-01		0	1	
4437	10730	2	\N	1	2018-01-01		0	1	
4445	10750	1	2	1	2018-01-01		0	1	
4453	10768	2	2	1	2018-01-01		0	1	
4461	10788	3	2	1	2018-01-01		0	1	
4469	10803	2	\N	1	2018-01-01		0	1	
4477	10822	3	2	1	2018-01-01		0	1	
4485	10834	2	\N	1	2018-01-01		0	1	
4493	10853	2	\N	1	2018-01-01		0	1	
4501	10879	3	2	1	2018-01-01		0	1	
4509	10903	3	\N	1	2018-01-01		0	1	
4517	10919	3	\N	1	2018-01-01		0	1	
4525	10939	3	\N	1	2018-01-01		0	1	
4533	10949	3	2	1	2018-01-01		0	1	
4541	10964	\N	2	1	2018-01-01		0	1	
4549	10976	3	2	1	2018-01-01		0	1	
4557	10992	2	\N	1	2018-01-01		0	1	
4565	11016	2	\N	1	2018-01-01		0	1	
4573	11027	2	\N	1	2018-01-01		0	1	
4581	11043	2	\N	1	2018-01-01		0	1	
4589	11059	3	\N	1	2018-01-01		0	1	
4597	11081	3	\N	1	2018-01-01		0	1	
4605	11092	2	\N	1	2018-01-01		0	1	
4613	11102	3	2	1	2018-01-01		0	1	
4621	11113	2	2	1	2018-01-01		0	1	
4629	11137	2	\N	1	2018-01-01		0	1	
4637	11165	3	4	1	2018-01-01		0	1	
4645	11184	2	\N	1	2018-01-01		0	1	
4653	11202	2	\N	1	2018-01-01		0	1	
4661	11213	3	2	1	2018-01-01		0	1	
4669	11233	3	2	1	2018-01-01		0	1	
4677	11253	2	\N	1	2018-01-01		0	1	
4685	11265	2	\N	1	2018-01-01		0	1	
4693	11295	\N	2	1	2018-01-01		0	1	
4701	11312	3	4	1	2018-01-01		0	1	
4709	11332	1	\N	1	2018-01-01		0	1	
4717	11347	2	\N	1	2018-01-01		0	1	
4725	11362	3	4	1	2018-01-01		0	1	
4733	11376	2	\N	1	2018-01-01		0	1	
4741	11395	1	\N	1	2018-01-01		0	1	
4749	11424	2	\N	1	2018-01-01		0	1	
4757	11442	3	2	1	2018-01-01		0	1	
4765	11461	2	\N	1	2018-01-01		0	1	
4773	11484	3	2	1	2018-01-01		0	1	
4781	11497	2	\N	1	2018-01-01		0	1	
4789	11520	3	2	1	2018-01-01		0	1	
4797	11553	3	\N	1	2018-01-01		0	1	
4805	11576	3	2	1	2018-01-01		0	1	
4813	11596	2	\N	1	2018-01-01		0	1	
4821	11622	3	\N	1	2018-01-01		0	1	
4829	11644	2	\N	1	2018-01-01		0	1	
4837	11662	2	\N	1	2018-01-01		0	1	
4845	11680	3	2	1	2018-01-01		0	1	
4853	11707	2	\N	1	2018-01-01		0	1	
4861	11728	2	\N	1	2018-01-01		0	1	
4869	11744	3	2	1	2018-01-01		0	1	
4877	11765	3	2	1	2018-01-01		0	1	
4885	11778	2	2	1	2018-01-01		0	1	
4893	11805	2	2	1	2018-01-01		0	1	
4901	11825	2	\N	1	2018-01-01		0	1	
4909	11847	2	\N	1	2018-01-01		0	1	
4917	11861	2	\N	1	2018-01-01		0	1	
4925	11900	2	\N	1	2018-01-01		0	1	
4933	11917	3	2	1	2018-01-01		0	1	
4941	11930	3	\N	1	2018-01-01		0	1	
4949	11941	2	\N	1	2018-01-01		0	1	
4957	11964	2	\N	1	2018-01-01		0	1	
4965	11990	2	\N	1	2018-01-01		0	1	
4973	12003	1	\N	1	2018-01-01		0	1	
4981	12021	3	\N	1	2018-01-01		0	1	
4989	12032	3	\N	1	2018-01-01		0	1	
4997	12060	2	2	1	2018-01-01		0	1	
5005	12080	2	2	1	2018-01-01		0	1	
5013	12103	2	2	1	2018-01-01		0	1	
5021	12123	2	\N	1	2018-01-01		0	1	
5029	12144	2	\N	1	2018-01-01		0	1	
5037	12170	2	\N	1	2018-01-01		0	1	
5045	12192	2	1	1	2018-01-01		0	1	
5053	12208	2	\N	1	2018-01-01		0	1	
5061	12225	2	\N	1	2018-01-01		0	1	
5069	12246	3	2	1	2018-01-01		0	1	
5077	12264	3	2	1	2018-01-01		0	1	
5085	12281	3	\N	1	2018-01-01		0	1	
5093	12296	2	1	1	2018-01-01		0	1	
5101	12313	3	2	1	2018-01-01		0	1	
5109	12325	3	2	1	2018-01-01		0	1	
5117	12347	3	2	1	2018-01-01		0	1	
5125	12375	1	\N	1	2018-01-01		0	1	
5133	12395	2	\N	1	2018-01-01		0	1	
5141	12409	2	2	1	2018-01-01		0	1	
5149	12430	3	\N	1	2018-01-01		0	1	
5157	12439	2	4	1	2018-01-01		0	1	
5165	12457	3	2	1	2018-01-01		0	1	
5173	12471	3	\N	1	2018-01-01		0	1	
5181	12486	2	\N	1	2018-01-01		0	1	
5189	12506	2	\N	1	2018-01-01		0	1	
5197	12524	2	\N	1	2018-01-01		0	1	
5205	12544	2	\N	1	2018-01-01		0	1	
5213	12556	2	\N	1	2018-01-01		0	1	
5221	12571	3	\N	1	2018-01-01		0	1	
5229	12595	3	2	1	2018-01-01		0	1	
5237	12611	2	\N	1	2018-01-01		0	1	
5245	12631	2	1	1	2018-01-01		0	1	
5253	12652	2	\N	1	2018-01-01		0	1	
5261	12676	\N	7	1	2018-01-01		0	1	
5269	12700	3	6	1	2018-01-01		0	1	
4043	9858	2	\N	1	2018-01-01		0	1	
4051	9873	3	\N	1	2018-01-01		0	1	
4059	9888	2	\N	1	2018-01-01		0	1	
4067	9909	2	\N	1	2018-01-01		0	1	
4075	9919	2	\N	1	2018-01-01		0	1	
4083	9929	3	2	1	2018-01-01		0	1	
4091	9944	2	\N	1	2018-01-01		0	1	
4099	9960	3	\N	1	2018-01-01		0	1	
4107	9984	2	\N	1	2018-01-01		0	1	
4115	10002	3	2	1	2018-01-01		0	1	
4123	10029	2	2	1	2018-01-01		0	1	
4131	10048	2	\N	1	2018-01-01		0	1	
4139	10061	3	\N	1	2018-01-01		0	1	
4147	10079	2	\N	1	2018-01-01		0	1	
4155	10095	1	\N	1	2018-01-01		0	1	
4163	10118	2	\N	1	2018-01-01		0	1	
4171	10134	\N	2	1	2018-01-01		0	1	
4179	10164	2	\N	1	2018-01-01		0	1	
4187	10192	2	\N	1	2018-01-01		0	1	
4195	10207	3	2	1	2018-01-01		0	1	
4203	10227	2	\N	1	2018-01-01		0	1	
4211	10244	2	\N	1	2018-01-01		0	1	
4219	10253	2	2	1	2018-01-01		0	1	
4227	10268	3	2	1	2018-01-01		0	1	
4235	10284	2	\N	1	2018-01-01		0	1	
4243	10296	3	2	1	2018-01-01		0	1	
4251	10317	2	1	1	2018-01-01		0	1	
4259	10329	2	\N	1	2018-01-01		0	1	
4267	10347	1	\N	1	2018-01-01		0	1	
4275	10361	2	\N	1	2018-01-01		0	1	
4283	10374	3	6	1	2018-01-01		0	1	
4291	10385	2	\N	1	2018-01-01		0	1	
4299	10402	3	5	1	2018-01-01		0	1	
4307	10421	2	\N	1	2018-01-01		0	1	
4315	10438	2	\N	1	2018-01-01		0	1	
4323	10462	3	6	1	2018-01-01		0	1	
4331	10488	3	\N	1	2018-01-01		0	1	
4339	10504	2	2	1	2018-01-01		0	1	
4347	10530	2	2	1	2018-01-01		0	1	
4355	10546	2	2	1	2018-01-01		0	1	
4363	10567	1	\N	1	2018-01-01		0	1	
4371	10585	3	\N	1	2018-01-01		0	1	
4379	10596	2	2	1	2018-01-01		0	1	
4387	10619	2	\N	1	2018-01-01		0	1	
4395	10636	2	\N	1	2018-01-01		0	1	
4403	10649	3	\N	1	2018-01-01		0	1	
4411	10665	3	2	1	2018-01-01		0	1	
4419	10688	3	2	1	2018-01-01		0	1	
4427	10701	2	\N	1	2018-01-01		0	1	
4435	10725	2	\N	1	2018-01-01		0	1	
4443	10747	2	7	1	2018-01-01		0	1	
4451	10763	2	\N	1	2018-01-01		0	1	
4459	10785	2	\N	1	2018-01-01		0	1	
4467	10800	3	\N	1	2018-01-01		0	1	
4475	10818	2	\N	1	2018-01-01		0	1	
4483	10830	2	\N	1	2018-01-01		0	1	
4491	10847	3	2	1	2018-01-01		0	1	
4499	10876	2	\N	1	2018-01-01		0	1	
4507	10899	2	\N	1	2018-01-01		0	1	
4515	10915	3	2	1	2018-01-01		0	1	
4523	10937	3	6	1	2018-01-01		0	1	
4531	10946	3	2	1	2018-01-01		0	1	
4539	10960	3	\N	1	2018-01-01		0	1	
4547	10974	3	\N	1	2018-01-01		0	1	
4555	10988	2	\N	1	2018-01-01		0	1	
4563	11011	2	\N	1	2018-01-01		0	1	
4571	11024	3	1	1	2018-01-01		0	1	
4579	11038	3	2	1	2018-01-01		0	1	
4587	11051	3	6	1	2018-01-01		0	1	
4595	11070	3	\N	1	2018-01-01		0	1	
4603	11089	2	\N	1	2018-01-01		0	1	
4611	11099	2	\N	1	2018-01-01		0	1	
4619	11110	1	\N	1	2018-01-01		0	1	
4627	11131	3	2	1	2018-01-01		0	1	
4635	11158	2	\N	1	2018-01-01		0	1	
4643	11178	2	\N	1	2018-01-01		0	1	
4651	11199	2	\N	1	2018-01-01		0	1	
4659	11211	3	\N	1	2018-01-01		0	1	
4667	11230	3	\N	1	2018-01-01		0	1	
4675	11249	3	\N	1	2018-01-01		0	1	
4683	11262	2	2	1	2018-01-01		0	1	
4691	11287	2	1	1	2018-01-01		0	1	
4699	11307	3	2	1	2018-01-01		0	1	
4707	11329	2	\N	1	2018-01-01		0	1	
4715	11345	3	\N	1	2018-01-01		0	1	
4723	11360	2	2	1	2018-01-01		0	1	
4731	11374	3	2	1	2018-01-01		0	1	
4739	11391	2	\N	1	2018-01-01		0	1	
4747	11414	2	\N	1	2018-01-01		0	1	
4755	11437	2	4	1	2018-01-01		0	1	
4763	11458	3	2	1	2018-01-01		0	1	
4771	11478	2	\N	1	2018-01-01		0	1	
4779	11491	2	\N	1	2018-01-01		0	1	
4787	11516	2	\N	1	2018-01-01		0	1	
4795	11545	2	\N	1	2018-01-01		0	1	
4803	11568	2	\N	1	2018-01-01		0	1	
4811	11588	2	\N	1	2018-01-01		0	1	
4819	11613	3	\N	1	2018-01-01		0	1	
4827	11640	3	\N	1	2018-01-01		0	1	
4835	11659	3	7	1	2018-01-01		0	1	
4843	11678	3	\N	1	2018-01-01		0	1	
4851	11699	1	\N	1	2018-01-01		0	1	
4859	11726	3	2	1	2018-01-01		0	1	
4867	11740	2	\N	1	2018-01-01		0	1	
4875	11760	2	\N	1	2018-01-01		0	1	
4883	11773	2	\N	1	2018-01-01		0	1	
4891	11796	2	\N	1	2018-01-01		0	1	
4899	11819	3	2	1	2018-01-01		0	1	
4907	11839	2	\N	1	2018-01-01		0	1	
4915	11858	2	\N	1	2018-01-01		0	1	
4923	11896	2	\N	1	2018-01-01		0	1	
4538	10959	2	\N	1	2018-01-01		0	1	
4546	10972	3	4	1	2018-01-01		0	1	
4554	10987	3	2	1	2018-01-01		0	1	
4562	11005	2	\N	1	2018-01-01		0	1	
4570	11022	2	\N	1	2018-01-01		0	1	
4578	11035	2	\N	1	2018-01-01		0	1	
4586	11050	2	\N	1	2018-01-01		0	1	
4594	11068	3	2	1	2018-01-01		0	1	
4602	11087	2	\N	1	2018-01-01		0	1	
4610	11098	3	6	1	2018-01-01		0	1	
4618	11109	2	2	1	2018-01-01		0	1	
4626	11128	2	\N	1	2018-01-01		0	1	
4634	11152	2	\N	1	2018-01-01		0	1	
4642	11175	2	\N	1	2018-01-01		0	1	
4650	11197	2	\N	1	2018-01-01		0	1	
4658	11210	3	\N	1	2018-01-01		0	1	
4666	11228	3	2	1	2018-01-01		0	1	
4674	11248	2	\N	1	2018-01-01		0	1	
4682	11261	2	\N	1	2018-01-01		0	1	
4690	11283	2	\N	1	2018-01-01		0	1	
4698	11303	3	\N	1	2018-01-01		0	1	
4706	11327	3	\N	1	2018-01-01		0	1	
4714	11344	3	\N	1	2018-01-01		0	1	
4722	11353	3	6	1	2018-01-01		0	1	
4730	11373	3	2	1	2018-01-01		0	1	
4738	11390	3	\N	1	2018-01-01		0	1	
4746	11413	3	\N	1	2018-01-01		0	1	
4754	11435	3	\N	1	2018-01-01		0	1	
4762	11457	1	\N	1	2018-01-01		0	1	
4770	11474	2	1	1	2018-01-01		0	1	
4778	11489	3	2	1	2018-01-01		0	1	
4786	11513	2	\N	1	2018-01-01		0	1	
4794	11541	2	\N	1	2018-01-01		0	1	
4802	11566	2	\N	1	2018-01-01		0	1	
4810	11587	1	\N	1	2018-01-01		0	1	
4818	11611	2	2	1	2018-01-01		0	1	
4826	11633	2	\N	1	2018-01-01		0	1	
4834	11657	3	\N	1	2018-01-01		0	1	
4842	11677	2	\N	1	2018-01-01		0	1	
4850	11697	3	\N	1	2018-01-01		0	1	
4858	11724	3	2	1	2018-01-01		0	1	
4866	11736	2	2	1	2018-01-01		0	1	
4874	11759	2	\N	1	2018-01-01		0	1	
4882	11771	2	\N	1	2018-01-01		0	1	
4890	11793	3	2	1	2018-01-01		0	1	
4898	11815	3	\N	1	2018-01-01		0	1	
4906	11837	3	5	1	2018-01-01		0	1	
4914	11857	3	5	1	2018-01-01		0	1	
4922	11895	2	2	1	2018-01-01		0	1	
4930	11912	3	2	1	2018-01-01		0	1	
4938	11924	3	\N	1	2018-01-01		0	1	
4946	11937	2	\N	1	2018-01-01		0	1	
4954	11954	3	2	1	2018-01-01		0	1	
4962	11984	3	\N	1	2018-01-01		0	1	
4970	12000	3	\N	1	2018-01-01		0	1	
4978	12016	2	\N	1	2018-01-01		0	1	
4986	12027	1	\N	1	2018-01-01		0	1	
4994	12054	2	2	1	2018-01-01		0	1	
5002	12072	2	\N	1	2018-01-01		0	1	
5010	12095	3	\N	1	2018-01-01		0	1	
5018	12117	1	\N	1	2018-01-01		0	1	
5026	12138	2	\N	1	2018-01-01		0	1	
5034	12161	3	\N	1	2018-01-01		0	1	
5042	12184	2	1	1	2018-01-01		0	1	
5050	12201	2	2	1	2018-01-01		0	1	
5058	12218	3	\N	1	2018-01-01		0	1	
5066	12240	2	\N	1	2018-01-01		0	1	
5074	12257	2	\N	1	2018-01-01		0	1	
5082	12275	3	\N	1	2018-01-01		0	1	
5090	12287	2	\N	1	2018-01-01		0	1	
5098	12305	2	\N	1	2018-01-01		0	1	
5106	12319	3	2	1	2018-01-01		0	1	
5114	12341	2	\N	1	2018-01-01		0	1	
5122	12365	2	2	1	2018-01-01		0	1	
5130	12389	2	2	1	2018-01-01		0	1	
5138	12402	2	\N	1	2018-01-01		0	1	
5146	12420	2	\N	1	2018-01-01		0	1	
5154	12436	2	\N	1	2018-01-01		0	1	
5162	12453	2	\N	1	2018-01-01		0	1	
5170	12467	2	\N	1	2018-01-01		0	1	
5178	12482	2	\N	1	2018-01-01		0	1	
5186	12499	2	2	1	2018-01-01		0	1	
5194	12517	2	\N	1	2018-01-01		0	1	
5202	12537	2	2	1	2018-01-01		0	1	
5210	12550	2	4	1	2018-01-01		0	1	
5218	12562	2	\N	1	2018-01-01		0	1	
5226	12588	2	2	1	2018-01-01		0	1	
5234	12604	2	\N	1	2018-01-01		0	1	
5242	12622	3	2	1	2018-01-01		0	1	
5250	12646	2	\N	1	2018-01-01		0	1	
5258	12669	2	\N	1	2018-01-01		0	1	
5266	12694	3	\N	1	2018-01-01		0	1	
5274	12710	3	\N	1	2018-01-01		0	1	
5282	12732	3	2	1	2018-01-01		0	1	
5290	12747	2	\N	1	2018-01-01		0	1	
5298	12757	2	\N	1	2018-01-01		0	1	
5306	12770	\N	2	1	2018-01-01		0	1	
5314	12785	2	\N	1	2018-01-01		0	1	
5322	12799	3	6	1	2018-01-01		0	1	
5330	12824	2	\N	1	2018-01-01		0	1	
5338	12851	2	\N	1	2018-01-01		0	1	
5346	12873	2	1	1	2018-01-01		0	1	
5354	12896	3	6	1	2018-01-01		0	1	
5362	12910	2	1	1	2018-01-01		0	1	
5370	12929	2	\N	1	2018-01-01		0	1	
5378	12946	3	2	1	2018-01-01		0	1	
5386	12966	2	\N	1	2018-01-01		0	1	
5394	12983	2	2	1	2018-01-01		0	1	
5402	13006	3	2	1	2018-01-01		0	1	
5410	13026	2	\N	1	2018-01-01		0	1	
5418	13051	2	2	1	2018-01-01		0	1	
4468	10802	3	2	1	2018-01-01		0	1	
4476	10820	2	\N	1	2018-01-01		0	1	
4484	10833	2	\N	1	2018-01-01		0	1	
4492	10848	2	\N	1	2018-01-01		0	1	
4500	10877	3	6	1	2018-01-01		0	1	
4508	10900	2	\N	1	2018-01-01		0	1	
4516	10916	2	2	1	2018-01-01		0	1	
4524	10938	3	\N	1	2018-01-01		0	1	
4532	10948	2	\N	1	2018-01-01		0	1	
4540	10963	1	2	1	2018-01-01		0	1	
4548	10975	3	\N	1	2018-01-01		0	1	
4556	10989	3	6	1	2018-01-01		0	1	
4564	11014	2	\N	1	2018-01-01		0	1	
4572	11025	2	\N	1	2018-01-01		0	1	
4580	11039	3	2	1	2018-01-01		0	1	
4588	11054	2	\N	1	2018-01-01		0	1	
4596	11073	3	2	1	2018-01-01		0	1	
4604	11091	3	\N	1	2018-01-01		0	1	
4612	11101	2	2	1	2018-01-01		0	1	
4620	11111	2	\N	1	2018-01-01		0	1	
4628	11134	2	\N	1	2018-01-01		0	1	
4636	11160	3	5	1	2018-01-01		0	1	
4644	11179	3	2	1	2018-01-01		0	1	
4652	11201	2	2	1	2018-01-01		0	1	
4660	11212	2	\N	1	2018-01-01		0	1	
4668	11232	1	\N	1	2018-01-01		0	1	
4676	11251	1	\N	1	2018-01-01		0	1	
4684	11264	2	\N	1	2018-01-01		0	1	
4692	11290	1	\N	1	2018-01-01		0	1	
4700	11311	2	\N	1	2018-01-01		0	1	
4708	11330	2	\N	1	2018-01-01		0	1	
4716	11346	2	\N	1	2018-01-01		0	1	
4724	11361	2	\N	1	2018-01-01		0	1	
4732	11375	2	\N	1	2018-01-01		0	1	
4740	11394	2	\N	1	2018-01-01		0	1	
4748	11421	3	2	1	2018-01-01		0	1	
4756	11441	3	\N	1	2018-01-01		0	1	
4764	11459	\N	2	1	2018-01-01		0	1	
4772	11483	2	\N	1	2018-01-01		0	1	
4780	11494	3	\N	1	2018-01-01		0	1	
4788	11517	3	\N	1	2018-01-01		0	1	
4796	11546	3	2	1	2018-01-01		0	1	
4804	11575	3	2	1	2018-01-01		0	1	
4812	11590	3	\N	1	2018-01-01		0	1	
4820	11618	2	\N	1	2018-01-01		0	1	
4828	11642	3	1	1	2018-01-01		0	1	
4836	11660	3	2	1	2018-01-01		0	1	
4844	11679	2	2	1	2018-01-01		0	1	
4852	11701	2	\N	1	2018-01-01		0	1	
4860	11727	1	\N	1	2018-01-01		0	1	
4868	11742	2	\N	1	2018-01-01		0	1	
4876	11763	1	\N	1	2018-01-01		0	1	
4884	11775	2	\N	1	2018-01-01		0	1	
4892	11802	2	\N	1	2018-01-01		0	1	
4900	11821	3	2	1	2018-01-01		0	1	
4908	11843	2	8	1	2018-01-01		0	1	
4916	11859	2	\N	1	2018-01-01		0	1	
4924	11897	3	\N	1	2018-01-01		0	1	
4932	11915	3	2	1	2018-01-01		0	1	
4940	11929	2	\N	1	2018-01-01		0	1	
4948	11939	2	\N	1	2018-01-01		0	1	
4956	11961	2	\N	1	2018-01-01		0	1	
4964	11986	2	2	1	2018-01-01		0	1	
4972	12002	3	\N	1	2018-01-01		0	1	
4980	12019	2	2	1	2018-01-01		0	1	
4988	12031	3	2	1	2018-01-01		0	1	
4996	12059	2	\N	1	2018-01-01		0	1	
5004	12076	2	1	1	2018-01-01		0	1	
5012	12101	3	\N	1	2018-01-01		0	1	
5020	12120	2	1	1	2018-01-01		0	1	
5028	12141	2	\N	1	2018-01-01		0	1	
5036	12168	3	6	1	2018-01-01		0	1	
5044	12190	2	\N	1	2018-01-01		0	1	
5052	12205	2	\N	1	2018-01-01		0	1	
5060	12223	2	\N	1	2018-01-01		0	1	
5068	12242	2	\N	1	2018-01-01		0	1	
5076	12259	2	1	1	2018-01-01		0	1	
5084	12280	3	2	1	2018-01-01		0	1	
5092	12294	1	\N	1	2018-01-01		0	1	
5100	12311	3	\N	1	2018-01-01		0	1	
5108	12324	3	\N	1	2018-01-01		0	1	
5116	12346	2	2	1	2018-01-01		0	1	
5124	12369	3	2	1	2018-01-01		0	1	
5132	12394	3	7	1	2018-01-01		0	1	
5140	12406	2	\N	1	2018-01-01		0	1	
5148	12428	3	\N	1	2018-01-01		0	1	
5156	12438	3	1	1	2018-01-01		0	1	
5164	12456	2	\N	1	2018-01-01		0	1	
5172	12470	3	\N	1	2018-01-01		0	1	
5180	12484	3	2	1	2018-01-01		0	1	
5188	12505	2	\N	1	2018-01-01		0	1	
5196	12522	2	1	1	2018-01-01		0	1	
5204	12540	2	\N	1	2018-01-01		0	1	
5212	12555	2	\N	1	2018-01-01		0	1	
5220	12567	2	\N	1	2018-01-01		0	1	
5228	12593	2	1	1	2018-01-01		0	1	
5236	12608	2	\N	1	2018-01-01		0	1	
5244	12628	3	2	1	2018-01-01		0	1	
5252	12651	3	2	1	2018-01-01		0	1	
5260	12675	3	5	1	2018-01-01		0	1	
5268	12699	3	2	1	2018-01-01		0	1	
5276	12718	3	2	1	2018-01-01		0	1	
5284	12734	2	1	1	2018-01-01		0	1	
5292	12749	\N	2	1	2018-01-01		0	1	
5300	12759	2	\N	1	2018-01-01		0	1	
5308	12776	2	\N	1	2018-01-01		0	1	
5316	12791	2	2	1	2018-01-01		0	1	
5324	12805	3	\N	1	2018-01-01		0	1	
5332	12828	1	\N	1	2018-01-01		0	1	
5340	12858	2	\N	1	2018-01-01		0	1	
5348	12876	3	\N	1	2018-01-01		0	1	
4982	12022	1	2	1	2018-01-01		0	1	
4086	9934	3	\N	1	2018-01-01		0	1	
4094	9949	2	\N	1	2018-01-01		0	1	
4102	9966	3	2	1	2018-01-01		0	1	
4110	9991	2	\N	1	2018-01-01		0	1	
4118	10006	3	2	1	2018-01-01		0	1	
4126	10037	2	2	1	2018-01-01		0	1	
4134	10052	2	2	1	2018-01-01		0	1	
4142	10069	3	2	1	2018-01-01		0	1	
4150	10084	3	2	1	2018-01-01		0	1	
4158	10110	3	\N	1	2018-01-01		0	1	
4166	10125	3	2	1	2018-01-01		0	1	
4174	10146	3	\N	1	2018-01-01		0	1	
4182	10177	2	2	1	2018-01-01		0	1	
4190	10196	3	1	1	2018-01-01		0	1	
4198	10215	3	6	1	2018-01-01		0	1	
4206	10234	2	\N	1	2018-01-01		0	1	
4214	10247	3	2	1	2018-01-01		0	1	
4222	10261	3	\N	1	2018-01-01		0	1	
4230	10275	2	2	1	2018-01-01		0	1	
4238	10289	3	2	1	2018-01-01		0	1	
4246	10305	2	\N	1	2018-01-01		0	1	
4254	10320	2	\N	1	2018-01-01		0	1	
4262	10333	2	\N	1	2018-01-01		0	1	
4270	10350	2	\N	1	2018-01-01		0	1	
4278	10366	2	4	1	2018-01-01		0	1	
4286	10378	3	2	1	2018-01-01		0	1	
4294	10394	3	6	1	2018-01-01		0	1	
4302	10407	2	\N	1	2018-01-01		0	1	
4310	10426	3	2	1	2018-01-01		0	1	
4318	10441	2	2	1	2018-01-01		0	1	
4326	10470	3	\N	1	2018-01-01		0	1	
4334	10495	3	2	1	2018-01-01		0	1	
4342	10509	2	\N	1	2018-01-01		0	1	
4350	10535	3	6	1	2018-01-01		0	1	
4358	10553	3	7	1	2018-01-01		0	1	
4366	10570	2	\N	1	2018-01-01		0	1	
4374	10588	3	6	1	2018-01-01		0	1	
4382	10599	2	2	1	2018-01-01		0	1	
4390	10627	2	\N	1	2018-01-01		0	1	
4398	10641	3	2	1	2018-01-01		0	1	
4406	10656	2	\N	1	2018-01-01		0	1	
4414	10675	1	\N	1	2018-01-01		0	1	
4422	10694	2	\N	1	2018-01-01		0	1	
4430	10709	2	\N	1	2018-01-01		0	1	
4438	10731	2	1	1	2018-01-01		0	1	
4446	10753	2	\N	1	2018-01-01		0	1	
4454	10771	1	2	1	2018-01-01		0	1	
4462	10790	1	\N	1	2018-01-01		0	1	
4470	10807	3	6	1	2018-01-01		0	1	
4478	10823	3	2	1	2018-01-01		0	1	
4486	10838	2	\N	1	2018-01-01		0	1	
4494	10856	3	2	1	2018-01-01		0	1	
4502	10883	1	\N	1	2018-01-01		0	1	
4510	10905	2	\N	1	2018-01-01		0	1	
4518	10920	3	6	1	2018-01-01		0	1	
4526	10940	3	\N	1	2018-01-01		0	1	
4534	10954	2	2	1	2018-01-01		0	1	
4542	10966	2	\N	1	2018-01-01		0	1	
4550	10979	2	\N	1	2018-01-01		0	1	
4558	10996	3	2	1	2018-01-01		0	1	
4566	11017	2	\N	1	2018-01-01		0	1	
4574	11030	2	\N	1	2018-01-01		0	1	
4582	11044	1	\N	1	2018-01-01		0	1	
4590	11060	1	2	1	2018-01-01		0	1	
4598	11082	2	\N	1	2018-01-01		0	1	
4606	11094	2	\N	1	2018-01-01		0	1	
4614	11103	3	\N	1	2018-01-01		0	1	
4622	11117	2	\N	1	2018-01-01		0	1	
4630	11138	3	2	1	2018-01-01		0	1	
4638	11166	2	\N	1	2018-01-01		0	1	
4646	11188	3	2	1	2018-01-01		0	1	
4654	11203	2	\N	1	2018-01-01		0	1	
4662	11215	2	\N	1	2018-01-01		0	1	
4670	11238	2	\N	1	2018-01-01		0	1	
4678	11254	3	2	1	2018-01-01		0	1	
4686	11271	1	\N	1	2018-01-01		0	1	
4694	11296	2	\N	1	2018-01-01		0	1	
4702	11314	3	2	1	2018-01-01		0	1	
4710	11333	3	2	1	2018-01-01		0	1	
4718	11348	2	\N	1	2018-01-01		0	1	
4726	11368	3	\N	1	2018-01-01		0	1	
4734	11379	2	\N	1	2018-01-01		0	1	
4742	11396	3	\N	1	2018-01-01		0	1	
4750	11425	2	\N	1	2018-01-01		0	1	
4758	11447	3	\N	1	2018-01-01		0	1	
4766	11464	3	2	1	2018-01-01		0	1	
4774	11485	2	\N	1	2018-01-01		0	1	
4782	11504	3	\N	1	2018-01-01		0	1	
4790	11523	3	\N	1	2018-01-01		0	1	
4798	11557	2	\N	1	2018-01-01		0	1	
4806	11580	2	2	1	2018-01-01		0	1	
4814	11598	3	2	1	2018-01-01		0	1	
4822	11624	2	\N	1	2018-01-01		0	1	
4830	11646	2	2	1	2018-01-01		0	1	
4838	11665	3	\N	1	2018-01-01		0	1	
4846	11681	2	\N	1	2018-01-01		0	1	
4854	11708	3	2	1	2018-01-01		0	1	
4862	11731	2	\N	1	2018-01-01		0	1	
4870	11748	3	6	1	2018-01-01		0	1	
4878	11766	3	1	1	2018-01-01		0	1	
4886	11779	3	\N	1	2018-01-01		0	1	
4894	11806	2	\N	1	2018-01-01		0	1	
4902	11828	3	2	1	2018-01-01		0	1	
4910	11850	2	2	1	2018-01-01		0	1	
4918	11870	2	\N	1	2018-01-01		0	1	
4926	11907	2	\N	1	2018-01-01		0	1	
4934	11918	2	\N	1	2018-01-01		0	1	
4942	11932	3	\N	1	2018-01-01		0	1	
4950	11943	2	\N	1	2018-01-01		0	1	
4958	11967	\N	2	1	2018-01-01		0	1	
4966	11995	2	2	1	2018-01-01		0	1	
4974	12007	2	\N	1	2018-01-01		0	1	
4472	10813	3	6	1	2018-01-01		0	1	
4480	10825	\N	7	1	2018-01-01		0	1	
4488	10841	3	2	1	2018-01-01		0	1	
4496	10870	3	\N	1	2018-01-01		0	1	
4504	10894	1	\N	1	2018-01-01		0	1	
4512	10909	2	\N	1	2018-01-01		0	1	
4520	10927	2	\N	1	2018-01-01		0	1	
4528	10942	2	\N	1	2018-01-01		0	1	
4536	10957	2	\N	1	2018-01-01		0	1	
4544	10970	1	\N	1	2018-01-01		0	1	
4552	10982	2	\N	1	2018-01-01		0	1	
4560	10998	2	2	1	2018-01-01		0	1	
4568	11020	\N	7	1	2018-01-01		0	1	
4576	11032	3	2	1	2018-01-01		0	1	
4584	11046	2	\N	1	2018-01-01		0	1	
4592	11064	2	1	1	2018-01-01		0	1	
4600	11085	2	\N	1	2018-01-01		0	1	
4608	11096	1	2	1	2018-01-01		0	1	
4616	11107	2	\N	1	2018-01-01		0	1	
4624	11126	2	\N	1	2018-01-01		0	1	
4632	11146	3	\N	1	2018-01-01		0	1	
4640	11172	3	2	1	2018-01-01		0	1	
4648	11194	3	2	1	2018-01-01		0	1	
4656	11207	2	1	1	2018-01-01		0	1	
4664	11226	2	\N	1	2018-01-01		0	1	
4672	11243	1	2	1	2018-01-01		0	1	
4680	11257	3	\N	1	2018-01-01		0	1	
4688	11278	3	\N	1	2018-01-01		0	1	
4696	11301	3	\N	1	2018-01-01		0	1	
4704	11324	2	\N	1	2018-01-01		0	1	
4712	11339	1	2	1	2018-01-01		0	1	
4720	11351	3	2	1	2018-01-01		0	1	
4728	11371	2	\N	1	2018-01-01		0	1	
4736	11385	3	2	1	2018-01-01		0	1	
4744	11409	3	2	1	2018-01-01		0	1	
4752	11429	3	\N	1	2018-01-01		0	1	
4760	11449	2	\N	1	2018-01-01		0	1	
4768	11469	2	\N	1	2018-01-01		0	1	
4776	11487	2	\N	1	2018-01-01		0	1	
4784	11509	2	\N	1	2018-01-01		0	1	
4792	11535	3	5	1	2018-01-01		0	1	
4800	11564	2	\N	1	2018-01-01		0	1	
4808	11583	3	2	1	2018-01-01		0	1	
4816	11607	2	\N	1	2018-01-01		0	1	
4824	11628	2	2	1	2018-01-01		0	1	
4832	11650	\N	2	1	2018-01-01		0	1	
4840	11672	2	1	1	2018-01-01		0	1	
4848	11683	2	\N	1	2018-01-01		0	1	
4856	11719	3	7	1	2018-01-01		0	1	
4864	11734	2	\N	1	2018-01-01		0	1	
4872	11756	2	2	1	2018-01-01		0	1	
4880	11769	2	2	1	2018-01-01		0	1	
4888	11783	1	2	1	2018-01-01		0	1	
4896	11811	2	\N	1	2018-01-01		0	1	
4904	11835	1	\N	1	2018-01-01		0	1	
4912	11854	3	2	1	2018-01-01		0	1	
4920	11885	2	\N	1	2018-01-01		0	1	
4928	11910	3	\N	1	2018-01-01		0	1	
4936	11922	3	2	1	2018-01-01		0	1	
4944	11935	2	\N	1	2018-01-01		0	1	
4952	11949	3	\N	1	2018-01-01		0	1	
4960	11974	2	2	1	2018-01-01		0	1	
4968	11997	3	2	1	2018-01-01		0	1	
4976	12010	3	2	1	2018-01-01		0	1	
4984	12025	3	\N	1	2018-01-01		0	1	
4992	12039	1	\N	1	2018-01-01		0	1	
5000	12068	3	\N	1	2018-01-01		0	1	
5008	12087	2	\N	1	2018-01-01		0	1	
5016	12110	3	\N	1	2018-01-01		0	1	
5024	12128	2	\N	1	2018-01-01		0	1	
5032	12159	2	\N	1	2018-01-01		0	1	
5040	12180	2	2	1	2018-01-01		0	1	
5048	12196	3	2	1	2018-01-01		0	1	
5056	12216	3	7	1	2018-01-01		0	1	
5064	12234	2	\N	1	2018-01-01		0	1	
5072	12253	3	2	1	2018-01-01		0	1	
5080	12273	1	\N	1	2018-01-01		0	1	
5088	12284	1	\N	1	2018-01-01		0	1	
5096	12302	2	\N	1	2018-01-01		0	1	
5104	12317	3	\N	1	2018-01-01		0	1	
5112	12333	2	\N	1	2018-01-01		0	1	
5120	12354	2	\N	1	2018-01-01		0	1	
5128	12381	2	1	1	2018-01-01		0	1	
5136	12398	3	2	1	2018-01-01		0	1	
5144	12418	2	\N	1	2018-01-01		0	1	
5152	12434	2	\N	1	2018-01-01		0	1	
5160	12447	2	2	1	2018-01-01		0	1	
5168	12464	1	\N	1	2018-01-01		0	1	
5176	12478	2	\N	1	2018-01-01		0	1	
5184	12496	3	2	1	2018-01-01		0	1	
5192	12511	2	\N	1	2018-01-01		0	1	
5200	12532	2	2	1	2018-01-01		0	1	
5208	12547	2	\N	1	2018-01-01		0	1	
5216	12560	3	2	1	2018-01-01		0	1	
5224	12577	3	4	1	2018-01-01		0	1	
5232	12598	2	\N	1	2018-01-01		0	1	
5240	12618	3	\N	1	2018-01-01		0	1	
5248	12638	3	\N	1	2018-01-01		0	1	
5256	12663	3	2	1	2018-01-01		0	1	
5264	12685	2	1	1	2018-01-01		0	1	
5272	12706	3	2	1	2018-01-01		0	1	
5280	12730	1	\N	1	2018-01-01		0	1	
5288	12742	3	\N	1	2018-01-01		0	1	
5296	12754	2	2	1	2018-01-01		0	1	
5304	12766	3	2	1	2018-01-01		0	1	
5312	12783	3	1	1	2018-01-01		0	1	
5320	12796	3	2	1	2018-01-01		0	1	
5328	12813	2	\N	1	2018-01-01		0	1	
5336	12849	2	2	1	2018-01-01		0	1	
5344	12869	2	\N	1	2018-01-01		0	1	
5352	12892	2	\N	1	2018-01-01		0	1	
5360	12906	3	6	1	2018-01-01		0	1	
5356	12898	3	\N	1	2018-01-01		0	1	
5364	12912	1	\N	1	2018-01-01		0	1	
5372	12933	3	2	1	2018-01-01		0	1	
5380	12951	2	1	1	2018-01-01		0	1	
5388	12969	3	6	1	2018-01-01		0	1	
5396	12988	2	\N	1	2018-01-01		0	1	
5404	13009	3	2	1	2018-01-01		0	1	
5412	13028	2	\N	1	2018-01-01		0	1	
5420	13054	2	\N	1	2018-01-01		0	1	
5428	13075	2	\N	1	2018-01-01		0	1	
5436	13112	3	6	1	2018-01-01		0	1	
5444	13146	2	1	1	2018-01-01		0	1	
5452	13158	2	\N	1	2018-01-01		0	1	
5460	13183	3	\N	1	2018-01-01		0	1	
5468	13195	2	2	1	2018-01-01		0	1	
5476	13213	3	\N	1	2018-01-01		0	1	
5484	13225	2	1	1	2018-01-01		0	1	
5492	13247	2	\N	1	2018-01-01		0	1	
5500	13275	3	\N	1	2018-01-01		0	1	
5508	13296	3	6	1	2018-01-01		0	1	
5516	13321	2	\N	1	2018-01-01		0	1	
5524	13332	2	\N	1	2018-01-01		0	1	
5532	13356	2	\N	1	2018-01-01		0	1	
5540	13366	2	\N	1	2018-01-01		0	1	
5548	13393	3	2	1	2018-01-01		0	1	
5556	13416	3	2	1	2018-01-01		0	1	
5564	13438	2	\N	1	2018-01-01		0	1	
5572	13458	2	2	1	2018-01-01		0	1	
5580	13469	2	\N	1	2018-01-01		0	1	
5588	13480	2	\N	1	2018-01-01		0	1	
5596	13496	2	2	1	2018-01-01		0	1	
5604	13514	2	\N	1	2018-01-01		0	1	
5612	13542	3	6	1	2018-01-01		0	1	
5620	13562	2	\N	1	2018-01-01		0	1	
5628	13579	2	\N	1	2018-01-01		0	1	
5636	13596	2	\N	1	2018-01-01		0	1	
5644	13623	3	2	1	2018-01-01		0	1	
5652	13647	1	\N	1	2018-01-01		0	1	
5660	13674	2	\N	1	2018-01-01		0	1	
5668	13689	2	\N	1	2018-01-01		0	1	
5676	13712	2	2	1	2018-01-01		0	1	
5684	13738	2	2	1	2018-01-01		0	1	
5692	13758	2	\N	1	2018-01-01		0	1	
5700	13777	3	\N	1	2018-01-01		0	1	
5708	13795	2	\N	1	2018-01-01		0	1	
5716	13814	1	\N	1	2018-01-01		0	1	
5724	13829	2	\N	1	2018-01-01		0	1	
5732	13838	2	1	1	2018-01-01		0	1	
5740	13854	3	2	1	2018-01-01		0	1	
5748	13875	2	2	1	2018-01-01		0	1	
5756	13892	2	\N	1	2018-01-01		0	1	
5764	13911	3	\N	1	2018-01-01		0	1	
5772	13934	2	\N	1	2018-01-01		0	1	
5780	13944	3	7	1	2018-01-01		0	1	
5788	13957	2	\N	1	2018-01-01		0	1	
5796	13970	2	\N	1	2018-01-01		0	1	
5804	13985	2	2	1	2018-01-01		0	1	
5812	14006	3	\N	1	2018-01-01		0	1	
5820	14025	3	2	1	2018-01-01		0	1	
5828	14043	2	\N	1	2018-01-01		0	1	
5836	14062	3	\N	1	2018-01-01		0	1	
5844	14073	2	2	1	2018-01-01		0	1	
5852	14089	3	\N	1	2018-01-01		0	1	
5860	14121	2	\N	1	2018-01-01		0	1	
5868	14143	3	2	1	2018-01-01		0	1	
5876	14165	2	\N	1	2018-01-01		0	1	
5884	14175	2	\N	1	2018-01-01		0	1	
5892	14193	1	\N	1	2018-01-01		0	1	
5900	14222	3	4	1	2018-01-01		0	1	
5908	14238	3	\N	1	2018-01-01		0	1	
5916	14262	2	\N	1	2018-01-01		0	1	
5924	14282	3	2	1	2018-01-01		0	1	
5932	14297	2	2	1	2018-01-01		0	1	
5940	14317	3	2	1	2018-01-01		0	1	
5948	14353	2	\N	1	2018-01-01		0	1	
5956	14371	3	2	1	2018-01-01		0	1	
5964	14394	2	1	1	2018-01-01		0	1	
5972	14409	3	2	1	2018-01-01		0	1	
5980	14420	3	2	1	2018-01-01		0	1	
5988	14436	2	\N	1	2018-01-01		0	1	
5996	14453	2	\N	1	2018-01-01		0	1	
6004	14462	3	7	1	2018-01-01		0	1	
6012	14480	3	6	1	2018-01-01		0	1	
6020	14522	2	\N	1	2018-01-01		0	1	
6028	14544	2	2	1	2018-01-01		0	1	
6036	14572	2	\N	1	2018-01-01		0	1	
6044	14594	3	\N	1	2018-01-01		0	1	
6052	14610	2	\N	1	2018-01-01		0	1	
6060	14634	2	\N	1	2018-01-01		0	1	
6068	14654	3	2	1	2018-01-01		0	1	
6076	14687	2	\N	1	2018-01-01		0	1	
6084	14701	2	\N	1	2018-01-01		0	1	
6092	14712	3	\N	1	2018-01-01		0	1	
6100	14729	2	\N	1	2018-01-01		0	1	
6108	14744	1	2	1	2018-01-01		0	1	
6116	14758	3	6	1	2018-01-01		0	1	
6124	14789	2	\N	1	2018-01-01		0	1	
6132	14819	2	\N	1	2018-01-01		0	1	
6140	14838	3	\N	1	2018-01-01		0	1	
6148	14855	2	\N	1	2018-01-01		0	1	
6156	14881	2	\N	1	2018-01-01		0	1	
6164	14898	3	2	1	2018-01-01		0	1	
6172	14915	3	2	1	2018-01-01		0	1	
6180	14946	3	1	1	2018-01-01		0	1	
6188	14958	3	2	1	2018-01-01		0	1	
6196	14973	2	1	1	2018-01-01		0	1	
6204	14986	2	\N	1	2018-01-01		0	1	
6212	15007	3	2	1	2018-01-01		0	1	
6220	15025	2	\N	1	2018-01-01		0	1	
6228	15040	3	2	1	2018-01-01		0	1	
6236	15066	3	2	1	2018-01-01		0	1	
6244	15089	3	6	1	2018-01-01		0	1	
4990	12037	3	2	1	2018-01-01		0	1	
4998	12061	1	\N	1	2018-01-01		0	1	
5006	12081	2	\N	1	2018-01-01		0	1	
5014	12105	3	\N	1	2018-01-01		0	1	
5022	12126	3	\N	1	2018-01-01		0	1	
5030	12145	2	\N	1	2018-01-01		0	1	
5038	12174	3	2	1	2018-01-01		0	1	
5046	12194	2	\N	1	2018-01-01		0	1	
5054	12211	2	2	1	2018-01-01		0	1	
5062	12228	2	\N	1	2018-01-01		0	1	
5070	12247	3	2	1	2018-01-01		0	1	
5078	12266	2	\N	1	2018-01-01		0	1	
5086	12282	2	\N	1	2018-01-01		0	1	
5094	12297	3	\N	1	2018-01-01		0	1	
5102	12314	2	\N	1	2018-01-01		0	1	
5110	12327	2	\N	1	2018-01-01		0	1	
5118	12352	3	2	1	2018-01-01		0	1	
5126	12377	2	\N	1	2018-01-01		0	1	
5134	12396	3	\N	1	2018-01-01		0	1	
5142	12411	3	6	1	2018-01-01		0	1	
5150	12431	2	\N	1	2018-01-01		0	1	
5158	12442	2	\N	1	2018-01-01		0	1	
5166	12458	2	\N	1	2018-01-01		0	1	
5174	12475	1	\N	1	2018-01-01		0	1	
5182	12490	2	\N	1	2018-01-01		0	1	
5190	12509	2	\N	1	2018-01-01		0	1	
5198	12529	3	\N	1	2018-01-01		0	1	
5206	12545	3	\N	1	2018-01-01		0	1	
5214	12557	2	\N	1	2018-01-01		0	1	
5222	12574	2	\N	1	2018-01-01		0	1	
5230	12596	2	\N	1	2018-01-01		0	1	
5238	12616	3	\N	1	2018-01-01		0	1	
5246	12635	2	\N	1	2018-01-01		0	1	
5254	12655	2	1	1	2018-01-01		0	1	
5262	12679	3	2	1	2018-01-01		0	1	
5270	12701	3	\N	1	2018-01-01		0	1	
5278	12727	3	2	1	2018-01-01		0	1	
5286	12738	3	6	1	2018-01-01		0	1	
5294	12752	2	\N	1	2018-01-01		0	1	
5302	12764	2	\N	1	2018-01-01		0	1	
5310	12780	3	2	1	2018-01-01		0	1	
5318	12794	2	\N	1	2018-01-01		0	1	
5326	12810	3	1	1	2018-01-01		0	1	
5334	12839	3	\N	1	2018-01-01		0	1	
5342	12863	2	2	1	2018-01-01		0	1	
5350	12880	2	\N	1	2018-01-01		0	1	
5358	12900	2	\N	1	2018-01-01		0	1	
5366	12923	3	6	1	2018-01-01		0	1	
5374	12938	2	\N	1	2018-01-01		0	1	
5382	12958	2	\N	1	2018-01-01		0	1	
5390	12975	2	\N	1	2018-01-01		0	1	
5398	12995	2	\N	1	2018-01-01		0	1	
5406	13015	2	\N	1	2018-01-01		0	1	
5414	13035	3	\N	1	2018-01-01		0	1	
5422	13060	3	1	1	2018-01-01		0	1	
5430	13079	2	\N	1	2018-01-01		0	1	
5438	13114	3	\N	1	2018-01-01		0	1	
5446	13148	2	\N	1	2018-01-01		0	1	
5454	13165	2	2	1	2018-01-01		0	1	
5462	13189	2	2	1	2018-01-01		0	1	
5470	13202	2	\N	1	2018-01-01		0	1	
5478	13217	2	2	1	2018-01-01		0	1	
5486	13230	3	4	1	2018-01-01		0	1	
5494	13260	2	\N	1	2018-01-01		0	1	
5502	13284	3	\N	1	2018-01-01		0	1	
5510	13308	2	\N	1	2018-01-01		0	1	
5518	13324	2	2	1	2018-01-01		0	1	
5526	13339	3	\N	1	2018-01-01		0	1	
5534	13358	2	\N	1	2018-01-01		0	1	
5542	13372	2	\N	1	2018-01-01		0	1	
5550	13398	3	2	1	2018-01-01		0	1	
5558	13426	2	\N	1	2018-01-01		0	1	
5566	13450	3	2	1	2018-01-01		0	1	
5574	13460	3	\N	1	2018-01-01		0	1	
5582	13471	1	2	1	2018-01-01		0	1	
5590	13483	3	\N	1	2018-01-01		0	1	
5598	13499	2	\N	1	2018-01-01		0	1	
5606	13524	2	\N	1	2018-01-01		0	1	
5614	13547	2	\N	1	2018-01-01		0	1	
5622	13565	3	\N	1	2018-01-01		0	1	
5630	13583	2	\N	1	2018-01-01		0	1	
5638	13600	3	2	1	2018-01-01		0	1	
5646	13627	3	\N	1	2018-01-01		0	1	
5654	13656	3	\N	1	2018-01-01		0	1	
5662	13678	3	7	1	2018-01-01		0	1	
5670	13698	2	\N	1	2018-01-01		0	1	
5678	13714	3	\N	1	2018-01-01		0	1	
5686	13741	\N	2	1	2018-01-01		0	1	
5694	13760	2	\N	1	2018-01-01		0	1	
5702	13779	2	7	1	2018-01-01		0	1	
5710	13797	2	\N	1	2018-01-01		0	1	
5718	13818	2	\N	1	2018-01-01		0	1	
5726	13832	3	2	1	2018-01-01		0	1	
5734	13840	2	1	1	2018-01-01		0	1	
5742	13859	1	\N	1	2018-01-01		0	1	
5750	13879	3	\N	1	2018-01-01		0	1	
5758	13898	3	\N	1	2018-01-01		0	1	
5766	13914	2	\N	1	2018-01-01		0	1	
5774	13936	2	2	1	2018-01-01		0	1	
5782	13947	2	\N	1	2018-01-01		0	1	
5790	13961	3	2	1	2018-01-01		0	1	
5798	13972	2	\N	1	2018-01-01		0	1	
5806	13989	1	\N	1	2018-01-01		0	1	
5814	14008	2	\N	1	2018-01-01		0	1	
5822	14028	2	\N	1	2018-01-01		0	1	
5830	14045	3	7	1	2018-01-01		0	1	
5838	14065	3	2	1	2018-01-01		0	1	
5846	14076	2	\N	1	2018-01-01		0	1	
5854	14100	3	\N	1	2018-01-01		0	1	
5862	14129	3	\N	1	2018-01-01		0	1	
5426	13072	1	\N	1	2018-01-01		0	1	
5434	13099	3	\N	1	2018-01-01		0	1	
5442	13135	3	6	1	2018-01-01		0	1	
5450	13153	3	\N	1	2018-01-01		0	1	
5458	13174	2	\N	1	2018-01-01		0	1	
5466	13193	3	2	1	2018-01-01		0	1	
5474	13208	3	2	1	2018-01-01		0	1	
5482	13222	2	2	1	2018-01-01		0	1	
5490	13242	3	2	1	2018-01-01		0	1	
5498	13269	2	\N	1	2018-01-01		0	1	
5506	13292	3	\N	1	2018-01-01		0	1	
5514	13314	2	2	1	2018-01-01		0	1	
5522	13329	2	\N	1	2018-01-01		0	1	
5530	13352	3	2	1	2018-01-01		0	1	
5538	13364	3	2	1	2018-01-01		0	1	
5546	13387	2	\N	1	2018-01-01		0	1	
5554	13405	3	2	1	2018-01-01		0	1	
5562	13435	2	\N	1	2018-01-01		0	1	
5570	13454	2	\N	1	2018-01-01		0	1	
5578	13466	1	2	1	2018-01-01		0	1	
5586	13475	1	\N	1	2018-01-01		0	1	
5594	13492	3	\N	1	2018-01-01		0	1	
5602	13510	3	6	1	2018-01-01		0	1	
5610	13534	3	\N	1	2018-01-01		0	1	
5618	13559	1	\N	1	2018-01-01		0	1	
5626	13572	2	\N	1	2018-01-01		0	1	
5634	13593	2	\N	1	2018-01-01		0	1	
5642	13618	3	2	1	2018-01-01		0	1	
5650	13638	2	\N	1	2018-01-01		0	1	
5658	13668	3	\N	1	2018-01-01		0	1	
5666	13686	2	1	1	2018-01-01		0	1	
5674	13706	3	\N	1	2018-01-01		0	1	
5682	13736	2	\N	1	2018-01-01		0	1	
5690	13748	2	\N	1	2018-01-01		0	1	
5698	13775	3	7	1	2018-01-01		0	1	
5706	13792	3	\N	1	2018-01-01		0	1	
5714	13804	2	\N	1	2018-01-01		0	1	
5722	13826	3	\N	1	2018-01-01		0	1	
5730	13836	2	2	1	2018-01-01		0	1	
5738	13851	2	\N	1	2018-01-01		0	1	
5746	13871	1	\N	1	2018-01-01		0	1	
5754	13889	1	\N	1	2018-01-01		0	1	
5762	13908	2	\N	1	2018-01-01		0	1	
5770	13923	3	2	1	2018-01-01		0	1	
5778	13941	2	1	1	2018-01-01		0	1	
5786	13953	1	2	1	2018-01-01		0	1	
5794	13968	2	\N	1	2018-01-01		0	1	
5802	13980	3	2	1	2018-01-01		0	1	
5810	13998	2	\N	1	2018-01-01		0	1	
5818	14023	3	2	1	2018-01-01		0	1	
5826	14038	2	\N	1	2018-01-01		0	1	
5834	14059	2	2	1	2018-01-01		0	1	
5842	14071	3	\N	1	2018-01-01		0	1	
5850	14084	3	6	1	2018-01-01		0	1	
5858	14112	3	2	1	2018-01-01		0	1	
5866	14138	2	1	1	2018-01-01		0	1	
5874	14158	2	\N	1	2018-01-01		0	1	
5882	14171	1	\N	1	2018-01-01		0	1	
5890	14187	2	\N	1	2018-01-01		0	1	
5898	14218	3	2	1	2018-01-01		0	1	
5906	14236	2	\N	1	2018-01-01		0	1	
5914	14254	3	2	1	2018-01-01		0	1	
5922	14276	3	\N	1	2018-01-01		0	1	
5930	14294	3	2	1	2018-01-01		0	1	
5938	14311	2	\N	1	2018-01-01		0	1	
5946	14348	2	\N	1	2018-01-01		0	1	
5954	14367	3	7	1	2018-01-01		0	1	
5962	14385	3	\N	1	2018-01-01		0	1	
5970	14403	2	\N	1	2018-01-01		0	1	
5978	14417	2	\N	1	2018-01-01		0	1	
5986	14431	3	2	1	2018-01-01		0	1	
5994	14450	2	\N	1	2018-01-01		0	1	
6002	14460	3	\N	1	2018-01-01		0	1	
6010	14478	3	\N	1	2018-01-01		0	1	
6018	14516	2	\N	1	2018-01-01		0	1	
6026	14538	3	\N	1	2018-01-01		0	1	
6034	14568	2	2	1	2018-01-01		0	1	
6042	14588	2	\N	1	2018-01-01		0	1	
6050	14608	\N	2	1	2018-01-01		0	1	
6058	14628	3	\N	1	2018-01-01		0	1	
6066	14652	3	2	1	2018-01-01		0	1	
6074	14677	2	\N	1	2018-01-01		0	1	
6082	14697	3	\N	1	2018-01-01		0	1	
6090	14710	3	\N	1	2018-01-01		0	1	
6098	14727	3	2	1	2018-01-01		0	1	
6106	14742	2	\N	1	2018-01-01		0	1	
6114	14755	2	\N	1	2018-01-01		0	1	
6122	14774	2	2	1	2018-01-01		0	1	
6130	14812	2	\N	1	2018-01-01		0	1	
6138	14834	3	2	1	2018-01-01		0	1	
6146	14850	2	\N	1	2018-01-01		0	1	
6154	14874	3	2	1	2018-01-01		0	1	
6162	14892	2	\N	1	2018-01-01		0	1	
6170	14912	2	1	1	2018-01-01		0	1	
6178	14935	3	\N	1	2018-01-01		0	1	
6186	14956	1	2	1	2018-01-01		0	1	
6194	14968	3	\N	1	2018-01-01		0	1	
6202	14982	2	\N	1	2018-01-01		0	1	
6210	15002	3	2	1	2018-01-01		0	1	
6218	15020	2	1	1	2018-01-01		0	1	
6226	15037	3	6	1	2018-01-01		0	1	
6234	15054	3	\N	1	2018-01-01		0	1	
6242	15085	2	\N	1	2018-01-01		0	1	
6250	15104	2	2	1	2018-01-01		0	1	
6258	15123	2	2	1	2018-01-01		0	1	
6266	15138	3	7	1	2018-01-01		0	1	
6274	15161	3	2	1	2018-01-01		0	1	
6282	15182	1	2	1	2018-01-01		0	1	
6290	15201	2	\N	1	2018-01-01		0	1	
6298	15222	2	\N	1	2018-01-01		0	1	
6306	15246	3	4	1	2018-01-01		0	1	
6314	15256	3	4	1	2018-01-01		0	1	
5277	12720	2	\N	1	2018-01-01		0	1	
5285	12736	2	4	1	2018-01-01		0	1	
5293	12751	2	\N	1	2018-01-01		0	1	
5301	12762	3	1	1	2018-01-01		0	1	
5309	12777	2	\N	1	2018-01-01		0	1	
5317	12792	3	\N	1	2018-01-01		0	1	
5325	12807	3	2	1	2018-01-01		0	1	
5333	12829	2	\N	1	2018-01-01		0	1	
5341	12859	2	2	1	2018-01-01		0	1	
5349	12879	2	\N	1	2018-01-01		0	1	
5357	12899	2	2	1	2018-01-01		0	1	
5365	12920	1	\N	1	2018-01-01		0	1	
5373	12935	2	\N	1	2018-01-01		0	1	
5381	12952	2	2	1	2018-01-01		0	1	
5389	12971	3	2	1	2018-01-01		0	1	
5397	12994	3	\N	1	2018-01-01		0	1	
5405	13014	3	2	1	2018-01-01		0	1	
5413	13029	1	2	1	2018-01-01		0	1	
5421	13056	2	2	1	2018-01-01		0	1	
5429	13076	2	\N	1	2018-01-01		0	1	
5437	13113	2	\N	1	2018-01-01		0	1	
5445	13147	3	\N	1	2018-01-01		0	1	
5453	13160	3	\N	1	2018-01-01		0	1	
5461	13186	3	6	1	2018-01-01		0	1	
5469	13197	2	\N	1	2018-01-01		0	1	
5477	13214	2	\N	1	2018-01-01		0	1	
5485	13228	2	\N	1	2018-01-01		0	1	
5493	13250	2	1	1	2018-01-01		0	1	
5501	13283	2	\N	1	2018-01-01		0	1	
5509	13300	2	\N	1	2018-01-01		0	1	
5517	13323	2	\N	1	2018-01-01		0	1	
5525	13334	3	\N	1	2018-01-01		0	1	
5533	13357	2	\N	1	2018-01-01		0	1	
5541	13368	2	\N	1	2018-01-01		0	1	
5549	13394	2	\N	1	2018-01-01		0	1	
5557	13425	1	\N	1	2018-01-01		0	1	
5565	13448	3	\N	1	2018-01-01		0	1	
5573	13459	3	2	1	2018-01-01		0	1	
5581	13470	1	\N	1	2018-01-01		0	1	
5589	13481	3	2	1	2018-01-01		0	1	
5597	13497	2	1	1	2018-01-01		0	1	
5605	13521	2	\N	1	2018-01-01		0	1	
5613	13544	2	\N	1	2018-01-01		0	1	
5621	13563	3	2	1	2018-01-01		0	1	
5629	13580	2	\N	1	2018-01-01		0	1	
5637	13598	2	\N	1	2018-01-01		0	1	
5645	13626	2	\N	1	2018-01-01		0	1	
5653	13648	3	2	1	2018-01-01		0	1	
5661	13677	3	2	1	2018-01-01		0	1	
5669	13690	3	2	1	2018-01-01		0	1	
5677	13713	3	2	1	2018-01-01		0	1	
5685	13740	2	1	1	2018-01-01		0	1	
5693	13759	2	\N	1	2018-01-01		0	1	
5701	13778	2	\N	1	2018-01-01		0	1	
5709	13796	1	\N	1	2018-01-01		0	1	
5717	13815	2	\N	1	2018-01-01		0	1	
5725	13830	2	\N	1	2018-01-01		0	1	
5733	13839	3	2	1	2018-01-01		0	1	
5741	13858	3	7	1	2018-01-01		0	1	
5749	13877	3	\N	1	2018-01-01		0	1	
5757	13893	2	\N	1	2018-01-01		0	1	
5765	13912	3	4	1	2018-01-01		0	1	
5773	13935	3	\N	1	2018-01-01		0	1	
5781	13946	3	\N	1	2018-01-01		0	1	
5789	13958	2	\N	1	2018-01-01		0	1	
5797	13971	3	2	1	2018-01-01		0	1	
5805	13988	3	\N	1	2018-01-01		0	1	
5813	14007	2	\N	1	2018-01-01		0	1	
5821	14027	2	\N	1	2018-01-01		0	1	
5829	14044	3	2	1	2018-01-01		0	1	
5837	14063	3	\N	1	2018-01-01		0	1	
5845	14075	1	\N	1	2018-01-01		0	1	
5853	14092	2	2	1	2018-01-01		0	1	
5861	14123	2	\N	1	2018-01-01		0	1	
5869	14144	2	\N	1	2018-01-01		0	1	
5877	14166	2	\N	1	2018-01-01		0	1	
5885	14176	3	1	1	2018-01-01		0	1	
5893	14195	2	\N	1	2018-01-01		0	1	
5901	14224	2	2	1	2018-01-01		0	1	
5909	14244	3	2	1	2018-01-01		0	1	
5917	14264	3	\N	1	2018-01-01		0	1	
5925	14284	3	2	1	2018-01-01		0	1	
5933	14299	2	\N	1	2018-01-01		0	1	
5941	14321	3	\N	1	2018-01-01		0	1	
5949	14355	2	2	1	2018-01-01		0	1	
5957	14372	2	\N	1	2018-01-01		0	1	
5965	14395	3	\N	1	2018-01-01		0	1	
5973	14410	3	\N	1	2018-01-01		0	1	
5981	14424	3	2	1	2018-01-01		0	1	
5989	14439	3	\N	1	2018-01-01		0	1	
5997	14454	3	2	1	2018-01-01		0	1	
6005	14467	3	\N	1	2018-01-01		0	1	
6013	14485	3	\N	1	2018-01-01		0	1	
6021	14523	2	\N	1	2018-01-01		0	1	
6029	14549	2	\N	1	2018-01-01		0	1	
6037	14575	3	5	1	2018-01-01		0	1	
6045	14597	2	4	1	2018-01-01		0	1	
6053	14614	2	\N	1	2018-01-01		0	1	
6061	14635	3	\N	1	2018-01-01		0	1	
6069	14655	3	\N	1	2018-01-01		0	1	
6077	14691	3	\N	1	2018-01-01		0	1	
6085	14702	3	2	1	2018-01-01		0	1	
6093	14713	3	\N	1	2018-01-01		0	1	
6101	14730	3	7	1	2018-01-01		0	1	
6109	14745	3	\N	1	2018-01-01		0	1	
6117	14763	3	2	1	2018-01-01		0	1	
6125	14799	1	\N	1	2018-01-01		0	1	
6133	14825	3	2	1	2018-01-01		0	1	
6141	14839	3	\N	1	2018-01-01		0	1	
6149	14857	2	\N	1	2018-01-01		0	1	
6157	14885	2	2	1	2018-01-01		0	1	
5393	12980	2	\N	1	2018-01-01		0	1	
5401	13004	3	2	1	2018-01-01		0	1	
5409	13021	1	\N	1	2018-01-01		0	1	
5417	13047	2	\N	1	2018-01-01		0	1	
5425	13071	2	2	1	2018-01-01		0	1	
5433	13098	2	\N	1	2018-01-01		0	1	
5441	13131	2	\N	1	2018-01-01		0	1	
5449	13152	3	2	1	2018-01-01		0	1	
5457	13171	3	2	1	2018-01-01		0	1	
5465	13192	2	\N	1	2018-01-01		0	1	
5473	13206	3	2	1	2018-01-01		0	1	
5481	13221	2	1	1	2018-01-01		0	1	
5489	13241	2	\N	1	2018-01-01		0	1	
5497	13268	2	\N	1	2018-01-01		0	1	
5505	13291	2	1	1	2018-01-01		0	1	
5513	13313	2	\N	1	2018-01-01		0	1	
5521	13328	3	\N	1	2018-01-01		0	1	
5529	13346	2	1	1	2018-01-01		0	1	
5537	13363	2	1	1	2018-01-01		0	1	
5545	13382	2	\N	1	2018-01-01		0	1	
5553	13403	2	1	1	2018-01-01		0	1	
5561	13432	2	\N	1	2018-01-01		0	1	
5569	13453	2	\N	1	2018-01-01		0	1	
5577	13464	2	\N	1	2018-01-01		0	1	
5585	13474	2	\N	1	2018-01-01		0	1	
5593	13491	3	\N	1	2018-01-01		0	1	
5601	13506	2	\N	1	2018-01-01		0	1	
5609	13531	3	4	1	2018-01-01		0	1	
5617	13558	2	\N	1	2018-01-01		0	1	
5625	13570	2	2	1	2018-01-01		0	1	
5633	13590	3	\N	1	2018-01-01		0	1	
5641	13617	2	\N	1	2018-01-01		0	1	
5649	13636	3	2	1	2018-01-01		0	1	
5657	13662	3	\N	1	2018-01-01		0	1	
5665	13684	3	2	1	2018-01-01		0	1	
5673	13703	2	\N	1	2018-01-01		0	1	
5681	13732	2	\N	1	2018-01-01		0	1	
5689	13746	2	\N	1	2018-01-01		0	1	
5697	13773	2	\N	1	2018-01-01		0	1	
5705	13782	3	\N	1	2018-01-01		0	1	
5713	13803	2	\N	1	2018-01-01		0	1	
5721	13825	1	\N	1	2018-01-01		0	1	
5729	13835	3	2	1	2018-01-01		0	1	
5737	13849	2	\N	1	2018-01-01		0	1	
5745	13866	3	2	1	2018-01-01		0	1	
5753	13887	2	\N	1	2018-01-01		0	1	
5761	13906	3	\N	1	2018-01-01		0	1	
5769	13921	3	\N	1	2018-01-01		0	1	
5777	13939	3	\N	1	2018-01-01		0	1	
5785	13952	3	\N	1	2018-01-01		0	1	
5793	13967	3	\N	1	2018-01-01		0	1	
5801	13977	3	\N	1	2018-01-01		0	1	
5809	13997	3	\N	1	2018-01-01		0	1	
5817	14020	2	2	1	2018-01-01		0	1	
5825	14033	3	6	1	2018-01-01		0	1	
5833	14056	2	2	1	2018-01-01		0	1	
5841	14070	3	2	1	2018-01-01		0	1	
5849	14081	2	\N	1	2018-01-01		0	1	
5857	14110	3	2	1	2018-01-01		0	1	
5865	14137	3	\N	1	2018-01-01		0	1	
5873	14157	3	\N	1	2018-01-01		0	1	
5881	14170	3	2	1	2018-01-01		0	1	
5889	14184	3	\N	1	2018-01-01		0	1	
5897	14214	3	\N	1	2018-01-01		0	1	
5905	14234	1	\N	1	2018-01-01		0	1	
5913	14252	3	\N	1	2018-01-01		0	1	
5921	14270	3	\N	1	2018-01-01		0	1	
5929	14292	2	\N	1	2018-01-01		0	1	
5937	14310	3	\N	1	2018-01-01		0	1	
5945	14343	2	\N	1	2018-01-01		0	1	
5953	14366	3	5	1	2018-01-01		0	1	
5961	14382	2	\N	1	2018-01-01		0	1	
5969	14402	2	2	1	2018-01-01		0	1	
5977	14416	2	\N	1	2018-01-01		0	1	
5985	14430	2	\N	1	2018-01-01		0	1	
5993	14448	2	2	1	2018-01-01		0	1	
6001	14459	3	2	1	2018-01-01		0	1	
6009	14476	2	\N	1	2018-01-01		0	1	
6017	14515	2	\N	1	2018-01-01		0	1	
6025	14535	2	\N	1	2018-01-01		0	1	
6033	14567	2	1	1	2018-01-01		0	1	
6041	14585	3	2	1	2018-01-01		0	1	
6049	14607	1	2	1	2018-01-01		0	1	
6057	14626	2	2	1	2018-01-01		0	1	
6065	14647	3	1	1	2018-01-01		0	1	
6073	14675	3	6	1	2018-01-01		0	1	
6081	14696	2	\N	1	2018-01-01		0	1	
6089	14709	2	\N	1	2018-01-01		0	1	
6097	14720	2	\N	1	2018-01-01		0	1	
6105	14741	3	\N	1	2018-01-01		0	1	
6113	14753	2	\N	1	2018-01-01		0	1	
6121	14772	2	\N	1	2018-01-01		0	1	
6129	14810	3	\N	1	2018-01-01		0	1	
6137	14830	2	2	1	2018-01-01		0	1	
6145	14849	3	2	1	2018-01-01		0	1	
6153	14873	2	\N	1	2018-01-01		0	1	
6161	14890	\N	5	1	2018-01-01		0	1	
6169	14911	2	\N	1	2018-01-01		0	1	
6177	14933	1	\N	1	2018-01-01		0	1	
6185	14955	2	1	1	2018-01-01		0	1	
6193	14966	2	\N	1	2018-01-01		0	1	
6201	14980	3	2	1	2018-01-01		0	1	
6209	14999	3	1	1	2018-01-01		0	1	
6217	15017	2	2	1	2018-01-01		0	1	
6225	15035	2	\N	1	2018-01-01		0	1	
6233	15049	3	5	1	2018-01-01		0	1	
6241	15082	2	\N	1	2018-01-01		0	1	
6249	15102	2	\N	1	2018-01-01		0	1	
6257	15121	3	\N	1	2018-01-01		0	1	
6265	15137	2	\N	1	2018-01-01		0	1	
6273	15160	3	\N	1	2018-01-01		0	1	
4931	11913	2	\N	1	2018-01-01		0	1	
4939	11925	\N	2	1	2018-01-01		0	1	
4947	11938	3	\N	1	2018-01-01		0	1	
4955	11955	2	\N	1	2018-01-01		0	1	
4963	11985	3	\N	1	2018-01-01		0	1	
4971	12001	2	2	1	2018-01-01		0	1	
4979	12017	3	\N	1	2018-01-01		0	1	
4987	12028	3	\N	1	2018-01-01		0	1	
4995	12055	2	\N	1	2018-01-01		0	1	
5003	12073	3	2	1	2018-01-01		0	1	
5011	12097	2	2	1	2018-01-01		0	1	
5019	12118	2	1	1	2018-01-01		0	1	
5027	12140	3	2	1	2018-01-01		0	1	
5035	12166	3	\N	1	2018-01-01		0	1	
5043	12187	3	2	1	2018-01-01		0	1	
5051	12204	2	\N	1	2018-01-01		0	1	
5059	12222	3	\N	1	2018-01-01		0	1	
5067	12241	2	\N	1	2018-01-01		0	1	
5075	12258	2	2	1	2018-01-01		0	1	
5083	12276	2	\N	1	2018-01-01		0	1	
5091	12292	3	\N	1	2018-01-01		0	1	
5099	12309	\N	6	1	2018-01-01		0	1	
5107	12321	3	1	1	2018-01-01		0	1	
5115	12344	3	6	1	2018-01-01		0	1	
5123	12366	2	\N	1	2018-01-01		0	1	
5131	12391	2	\N	1	2018-01-01		0	1	
5139	12405	3	\N	1	2018-01-01		0	1	
5147	12426	3	2	1	2018-01-01		0	1	
5155	12437	3	1	1	2018-01-01		0	1	
5163	12455	3	\N	1	2018-01-01		0	1	
5171	12469	3	2	1	2018-01-01		0	1	
5179	12483	2	\N	1	2018-01-01		0	1	
5187	12502	2	\N	1	2018-01-01		0	1	
5195	12519	3	6	1	2018-01-01		0	1	
5203	12539	2	\N	1	2018-01-01		0	1	
5211	12552	3	2	1	2018-01-01		0	1	
5219	12563	3	6	1	2018-01-01		0	1	
5227	12591	2	\N	1	2018-01-01		0	1	
5235	12605	3	2	1	2018-01-01		0	1	
5243	12624	3	\N	1	2018-01-01		0	1	
5251	12648	2	2	1	2018-01-01		0	1	
5259	12670	3	\N	1	2018-01-01		0	1	
5267	12697	3	\N	1	2018-01-01		0	1	
5275	12713	1	2	1	2018-01-01		0	1	
5283	12733	3	2	1	2018-01-01		0	1	
5291	12748	2	\N	1	2018-01-01		0	1	
5299	12758	2	\N	1	2018-01-01		0	1	
5307	12771	3	2	1	2018-01-01		0	1	
5315	12788	2	2	1	2018-01-01		0	1	
5323	12802	2	\N	1	2018-01-01		0	1	
5331	12826	1	\N	1	2018-01-01		0	1	
5339	12852	3	2	1	2018-01-01		0	1	
5347	12875	3	\N	1	2018-01-01		0	1	
5355	12897	2	\N	1	2018-01-01		0	1	
5363	12911	3	2	1	2018-01-01		0	1	
5371	12930	\N	7	1	2018-01-01		0	1	
5379	12950	3	6	1	2018-01-01		0	1	
5387	12968	1	\N	1	2018-01-01		0	1	
5395	12987	3	\N	1	2018-01-01		0	1	
5403	13007	2	\N	1	2018-01-01		0	1	
5411	13027	2	\N	1	2018-01-01		0	1	
5419	13053	3	2	1	2018-01-01		0	1	
5427	13073	3	6	1	2018-01-01		0	1	
5435	13102	2	2	1	2018-01-01		0	1	
5443	13138	3	\N	1	2018-01-01		0	1	
5451	13155	3	2	1	2018-01-01		0	1	
5459	13179	3	1	1	2018-01-01		0	1	
5467	13194	3	2	1	2018-01-01		0	1	
5475	13209	3	\N	1	2018-01-01		0	1	
5483	13223	3	7	1	2018-01-01		0	1	
5491	13244	2	\N	1	2018-01-01		0	1	
5499	13271	3	\N	1	2018-01-01		0	1	
5507	13293	2	\N	1	2018-01-01		0	1	
5515	13317	3	\N	1	2018-01-01		0	1	
5523	13330	3	\N	1	2018-01-01		0	1	
5531	13353	\N	2	1	2018-01-01		0	1	
5539	13365	1	\N	1	2018-01-01		0	1	
5547	13390	3	2	1	2018-01-01		0	1	
5555	13415	3	2	1	2018-01-01		0	1	
5563	13437	2	\N	1	2018-01-01		0	1	
5571	13457	2	\N	1	2018-01-01		0	1	
5579	13467	2	\N	1	2018-01-01		0	1	
5587	13478	2	\N	1	2018-01-01		0	1	
5595	13493	2	\N	1	2018-01-01		0	1	
5603	13511	3	2	1	2018-01-01		0	1	
5611	13541	2	\N	1	2018-01-01		0	1	
5619	13560	3	\N	1	2018-01-01		0	1	
5627	13576	3	7	1	2018-01-01		0	1	
5635	13595	3	\N	1	2018-01-01		0	1	
5643	13622	3	2	1	2018-01-01		0	1	
5651	13645	2	\N	1	2018-01-01		0	1	
5659	13671	3	2	1	2018-01-01		0	1	
5667	13687	3	2	1	2018-01-01		0	1	
5675	13710	\N	2	1	2018-01-01		0	1	
5683	13737	3	2	1	2018-01-01		0	1	
5691	13749	2	2	1	2018-01-01		0	1	
5699	13776	3	1	1	2018-01-01		0	1	
5707	13793	3	2	1	2018-01-01		0	1	
5715	13811	3	\N	1	2018-01-01		0	1	
5723	13827	3	2	1	2018-01-01		0	1	
5731	13837	3	6	1	2018-01-01		0	1	
5739	13853	2	\N	1	2018-01-01		0	1	
5747	13874	3	2	1	2018-01-01		0	1	
5755	13890	2	\N	1	2018-01-01		0	1	
5763	13909	2	\N	1	2018-01-01		0	1	
5771	13928	3	\N	1	2018-01-01		0	1	
5779	13943	3	2	1	2018-01-01		0	1	
5787	13956	2	\N	1	2018-01-01		0	1	
5795	13969	2	1	1	2018-01-01		0	1	
5803	13981	3	5	1	2018-01-01		0	1	
5811	14004	3	\N	1	2018-01-01		0	1	
5819	14024	2	\N	1	2018-01-01		0	1	
5311	12781	2	1	1	2018-01-01		0	1	
5319	12795	2	\N	1	2018-01-01		0	1	
5327	12811	3	\N	1	2018-01-01		0	1	
5335	12842	3	7	1	2018-01-01		0	1	
5343	12868	2	\N	1	2018-01-01		0	1	
5351	12891	2	\N	1	2018-01-01		0	1	
5359	12902	\N	2	1	2018-01-01		0	1	
5367	12925	3	\N	1	2018-01-01		0	1	
5375	12940	2	\N	1	2018-01-01		0	1	
5383	12960	3	2	1	2018-01-01		0	1	
5391	12976	2	1	1	2018-01-01		0	1	
5399	12997	3	2	1	2018-01-01		0	1	
5407	13017	2	\N	1	2018-01-01		0	1	
5415	13044	3	2	1	2018-01-01		0	1	
5423	13062	2	1	1	2018-01-01		0	1	
5431	13083	1	\N	1	2018-01-01		0	1	
5439	13116	2	1	1	2018-01-01		0	1	
5447	13150	2	2	1	2018-01-01		0	1	
5455	13166	2	\N	1	2018-01-01		0	1	
5463	13190	3	2	1	2018-01-01		0	1	
5471	13204	2	1	1	2018-01-01		0	1	
5479	13218	2	\N	1	2018-01-01		0	1	
5487	13238	2	\N	1	2018-01-01		0	1	
5495	13261	3	2	1	2018-01-01		0	1	
5503	13288	2	2	1	2018-01-01		0	1	
5511	13309	2	\N	1	2018-01-01		0	1	
5519	13326	2	2	1	2018-01-01		0	1	
5527	13343	3	\N	1	2018-01-01		0	1	
5535	13359	2	\N	1	2018-01-01		0	1	
5543	13373	2	\N	1	2018-01-01		0	1	
5551	13399	3	\N	1	2018-01-01		0	1	
5559	13427	3	\N	1	2018-01-01		0	1	
5567	13451	1	\N	1	2018-01-01		0	1	
5575	13462	2	\N	1	2018-01-01		0	1	
5583	13472	2	\N	1	2018-01-01		0	1	
5591	13485	2	\N	1	2018-01-01		0	1	
5599	13502	2	8	1	2018-01-01		0	1	
5607	13525	3	\N	1	2018-01-01		0	1	
5615	13550	3	\N	1	2018-01-01		0	1	
5623	13567	2	\N	1	2018-01-01		0	1	
5631	13584	2	\N	1	2018-01-01		0	1	
5639	13602	2	\N	1	2018-01-01		0	1	
5647	13628	2	2	1	2018-01-01		0	1	
5655	13659	3	2	1	2018-01-01		0	1	
5663	13679	1	2	1	2018-01-01		0	1	
5671	13699	2	\N	1	2018-01-01		0	1	
5679	13722	2	\N	1	2018-01-01		0	1	
5687	13744	3	6	1	2018-01-01		0	1	
5695	13763	3	\N	1	2018-01-01		0	1	
5703	13780	2	\N	1	2018-01-01		0	1	
5711	13798	2	\N	1	2018-01-01		0	1	
5719	13820	3	2	1	2018-01-01		0	1	
5727	13833	3	\N	1	2018-01-01		0	1	
5735	13844	2	\N	1	2018-01-01		0	1	
5743	13860	3	2	1	2018-01-01		0	1	
5751	13881	3	5	1	2018-01-01		0	1	
5759	13901	1	2	1	2018-01-01		0	1	
5767	13917	2	\N	1	2018-01-01		0	1	
5775	13937	2	\N	1	2018-01-01		0	1	
5783	13948	3	\N	1	2018-01-01		0	1	
5791	13963	3	2	1	2018-01-01		0	1	
5799	13974	2	\N	1	2018-01-01		0	1	
5807	13995	2	\N	1	2018-01-01		0	1	
5815	14010	3	6	1	2018-01-01		0	1	
5823	14030	3	1	1	2018-01-01		0	1	
5831	14047	2	1	1	2018-01-01		0	1	
5839	14066	3	6	1	2018-01-01		0	1	
5847	14078	3	2	1	2018-01-01		0	1	
5855	14106	3	7	1	2018-01-01		0	1	
5863	14134	3	\N	1	2018-01-01		0	1	
5871	14150	2	\N	1	2018-01-01		0	1	
5879	14168	2	\N	1	2018-01-01		0	1	
5887	14179	3	2	1	2018-01-01		0	1	
5895	14207	3	\N	1	2018-01-01		0	1	
5903	14230	2	\N	1	2018-01-01		0	1	
5911	14249	3	\N	1	2018-01-01		0	1	
5919	14266	3	2	1	2018-01-01		0	1	
5927	14290	2	\N	1	2018-01-01		0	1	
5935	14304	2	\N	1	2018-01-01		0	1	
5943	14337	3	2	1	2018-01-01		0	1	
5951	14362	2	\N	1	2018-01-01		0	1	
5959	14375	2	2	1	2018-01-01		0	1	
5967	14398	3	\N	1	2018-01-01		0	1	
5975	14412	2	\N	1	2018-01-01		0	1	
5983	14427	2	\N	1	2018-01-01		0	1	
5991	14446	2	\N	1	2018-01-01		0	1	
5999	14457	2	\N	1	2018-01-01		0	1	
6007	14470	2	\N	1	2018-01-01		0	1	
6015	14499	1	2	1	2018-01-01		0	1	
6023	14528	2	\N	1	2018-01-01		0	1	
6031	14559	3	2	1	2018-01-01		0	1	
6039	14580	3	7	1	2018-01-01		0	1	
6047	14600	2	\N	1	2018-01-01		0	1	
6055	14616	3	2	1	2018-01-01		0	1	
6063	14639	1	\N	1	2018-01-01		0	1	
6071	14672	2	\N	1	2018-01-01		0	1	
6079	14694	3	2	1	2018-01-01		0	1	
6087	14704	2	2	1	2018-01-01		0	1	
6095	14715	2	\N	1	2018-01-01		0	1	
6103	14733	3	2	1	2018-01-01		0	1	
6111	14749	2	2	1	2018-01-01		0	1	
6119	14767	2	\N	1	2018-01-01		0	1	
6127	14804	2	\N	1	2018-01-01		0	1	
6135	14827	2	\N	1	2018-01-01		0	1	
6143	14845	3	\N	1	2018-01-01		0	1	
6151	14871	2	\N	1	2018-01-01		0	1	
6159	14888	2	\N	1	2018-01-01		0	1	
6167	14904	2	\N	1	2018-01-01		0	1	
6175	14928	3	2	1	2018-01-01		0	1	
6183	14952	3	1	1	2018-01-01		0	1	
6191	14964	3	2	1	2018-01-01		0	1	
6199	14977	2	2	1	2018-01-01		0	1	
5368	12927	3	\N	1	2018-01-01		0	1	
5376	12943	3	2	1	2018-01-01		0	1	
5384	12961	3	\N	1	2018-01-01		0	1	
5392	12979	2	\N	1	2018-01-01		0	1	
5400	12999	3	\N	1	2018-01-01		0	1	
5408	13018	2	\N	1	2018-01-01		0	1	
5416	13046	1	\N	1	2018-01-01		0	1	
5424	13066	3	\N	1	2018-01-01		0	1	
5432	13096	2	\N	1	2018-01-01		0	1	
5440	13118	3	6	1	2018-01-01		0	1	
5448	13151	2	2	1	2018-01-01		0	1	
5456	13168	3	\N	1	2018-01-01		0	1	
5464	13191	3	2	1	2018-01-01		0	1	
5472	13205	2	2	1	2018-01-01		0	1	
5480	13220	2	\N	1	2018-01-01		0	1	
5488	13239	2	2	1	2018-01-01		0	1	
5496	13263	3	6	1	2018-01-01		0	1	
5504	13289	3	2	1	2018-01-01		0	1	
5512	13311	2	\N	1	2018-01-01		0	1	
5520	13327	2	\N	1	2018-01-01		0	1	
5528	13344	2	\N	1	2018-01-01		0	1	
5536	13362	3	5	1	2018-01-01		0	1	
5544	13380	3	6	1	2018-01-01		0	1	
5552	13400	3	2	1	2018-01-01		0	1	
5560	13431	3	6	1	2018-01-01		0	1	
5568	13452	3	\N	1	2018-01-01		0	1	
5576	13463	3	\N	1	2018-01-01		0	1	
5584	13473	2	\N	1	2018-01-01		0	1	
5592	13489	3	2	1	2018-01-01		0	1	
5600	13503	\N	2	1	2018-01-01		0	1	
5608	13530	3	\N	1	2018-01-01		0	1	
5616	13555	3	5	1	2018-01-01		0	1	
5624	13568	3	2	1	2018-01-01		0	1	
5632	13588	3	\N	1	2018-01-01		0	1	
5640	13603	3	\N	1	2018-01-01		0	1	
5648	13635	\N	2	1	2018-01-01		0	1	
5656	13661	3	2	1	2018-01-01		0	1	
5664	13683	3	2	1	2018-01-01		0	1	
5672	13701	2	\N	1	2018-01-01		0	1	
5680	13723	2	\N	1	2018-01-01		0	1	
5688	13745	2	2	1	2018-01-01		0	1	
5696	13765	2	\N	1	2018-01-01		0	1	
5704	13781	3	\N	1	2018-01-01		0	1	
5712	13802	2	2	1	2018-01-01		0	1	
5720	13821	2	\N	1	2018-01-01		0	1	
5728	13834	2	\N	1	2018-01-01		0	1	
5736	13847	2	\N	1	2018-01-01		0	1	
5744	13862	3	2	1	2018-01-01		0	1	
5752	13882	2	\N	1	2018-01-01		0	1	
5760	13902	1	\N	1	2018-01-01		0	1	
5768	13919	2	\N	1	2018-01-01		0	1	
5776	13938	2	\N	1	2018-01-01		0	1	
5784	13950	2	\N	1	2018-01-01		0	1	
5792	13964	3	\N	1	2018-01-01		0	1	
5800	13976	3	2	1	2018-01-01		0	1	
5808	13996	1	\N	1	2018-01-01		0	1	
5816	14015	3	\N	1	2018-01-01		0	1	
5824	14031	2	\N	1	2018-01-01		0	1	
5832	14055	2	2	1	2018-01-01		0	1	
5840	14069	3	2	1	2018-01-01		0	1	
5848	14079	2	\N	1	2018-01-01		0	1	
5856	14108	3	\N	1	2018-01-01		0	1	
5864	14135	2	\N	1	2018-01-01		0	1	
5872	14153	2	\N	1	2018-01-01		0	1	
5880	14169	2	\N	1	2018-01-01		0	1	
5888	14182	2	\N	1	2018-01-01		0	1	
5896	14208	3	1	1	2018-01-01		0	1	
5904	14231	2	2	1	2018-01-01		0	1	
5912	14251	2	\N	1	2018-01-01		0	1	
5920	14269	2	\N	1	2018-01-01		0	1	
5928	14291	2	\N	1	2018-01-01		0	1	
5936	14307	1	\N	1	2018-01-01		0	1	
5944	14339	2	2	1	2018-01-01		0	1	
5952	14363	3	\N	1	2018-01-01		0	1	
5960	14376	2	\N	1	2018-01-01		0	1	
5968	14400	2	\N	1	2018-01-01		0	1	
5976	14415	3	\N	1	2018-01-01		0	1	
5984	14429	2	2	1	2018-01-01		0	1	
5992	14447	2	\N	1	2018-01-01		0	1	
6000	14458	3	\N	1	2018-01-01		0	1	
6008	14473	3	\N	1	2018-01-01		0	1	
6016	14511	3	\N	1	2018-01-01		0	1	
6024	14533	2	\N	1	2018-01-01		0	1	
6032	14562	2	\N	1	2018-01-01		0	1	
6040	14583	3	2	1	2018-01-01		0	1	
6048	14606	2	\N	1	2018-01-01		0	1	
6056	14625	2	\N	1	2018-01-01		0	1	
6064	14643	2	\N	1	2018-01-01		0	1	
6072	14673	2	\N	1	2018-01-01		0	1	
6080	14695	2	\N	1	2018-01-01		0	1	
6088	14705	3	1	1	2018-01-01		0	1	
6096	14716	3	\N	1	2018-01-01		0	1	
6104	14739	2	1	1	2018-01-01		0	1	
6112	14750	2	2	1	2018-01-01		0	1	
6120	14769	3	7	1	2018-01-01		0	1	
6128	14808	2	\N	1	2018-01-01		0	1	
6136	14828	2	2	1	2018-01-01		0	1	
6144	14847	2	2	1	2018-01-01		0	1	
6152	14872	2	\N	1	2018-01-01		0	1	
6160	14889	2	\N	1	2018-01-01		0	1	
6168	14906	1	\N	1	2018-01-01		0	1	
6176	14930	3	\N	1	2018-01-01		0	1	
6184	14953	3	\N	1	2018-01-01		0	1	
6192	14965	2	\N	1	2018-01-01		0	1	
6200	14978	3	2	1	2018-01-01		0	1	
6208	14998	2	2	1	2018-01-01		0	1	
6216	15016	2	2	1	2018-01-01		0	1	
6224	15029	3	5	1	2018-01-01		0	1	
6232	15048	2	\N	1	2018-01-01		0	1	
6240	15076	2	\N	1	2018-01-01		0	1	
6248	15101	2	\N	1	2018-01-01		0	1	
5870	14148	1	2	1	2018-01-01		0	1	
5878	14167	3	\N	1	2018-01-01		0	1	
5886	14178	2	\N	1	2018-01-01		0	1	
5894	14198	3	6	1	2018-01-01		0	1	
5902	14225	3	2	1	2018-01-01		0	1	
5910	14246	2	\N	1	2018-01-01		0	1	
5918	14265	2	\N	1	2018-01-01		0	1	
5926	14288	3	\N	1	2018-01-01		0	1	
5934	14301	3	2	1	2018-01-01		0	1	
5942	14334	3	2	1	2018-01-01		0	1	
5950	14357	2	1	1	2018-01-01		0	1	
5958	14373	2	\N	1	2018-01-01		0	1	
5966	14397	3	2	1	2018-01-01		0	1	
5974	14411	2	\N	1	2018-01-01		0	1	
5982	14425	2	\N	1	2018-01-01		0	1	
5990	14445	\N	2	1	2018-01-01		0	1	
5998	14456	2	1	1	2018-01-01		0	1	
6006	14468	2	\N	1	2018-01-01		0	1	
6014	14498	2	\N	1	2018-01-01		0	1	
6022	14525	1	2	1	2018-01-01		0	1	
6030	14555	2	\N	1	2018-01-01		0	1	
6038	14577	2	2	1	2018-01-01		0	1	
6046	14599	2	\N	1	2018-01-01		0	1	
6054	14615	2	\N	1	2018-01-01		0	1	
6062	14636	2	\N	1	2018-01-01		0	1	
6070	14658	2	\N	1	2018-01-01		0	1	
6078	14692	2	1	1	2018-01-01		0	1	
6086	14703	2	\N	1	2018-01-01		0	1	
6094	14714	3	\N	1	2018-01-01		0	1	
6102	14732	3	2	1	2018-01-01		0	1	
6110	14746	2	\N	1	2018-01-01		0	1	
6118	14766	2	\N	1	2018-01-01		0	1	
6126	14801	2	\N	1	2018-01-01		0	1	
6134	14826	3	2	1	2018-01-01		0	1	
6142	14841	2	\N	1	2018-01-01		0	1	
6150	14870	2	\N	1	2018-01-01		0	1	
6158	14886	3	2	1	2018-01-01		0	1	
6166	14902	\N	\N	1	2018-01-01		0	1	
6174	14922	2	\N	1	2018-01-01		0	1	
6182	14951	3	2	1	2018-01-01		0	1	
6190	14961	2	\N	1	2018-01-01		0	1	
6198	14975	3	\N	1	2018-01-01		0	1	
6206	14988	3	\N	1	2018-01-01		0	1	
6214	15013	2	\N	1	2018-01-01		0	1	
6222	15027	2	4	1	2018-01-01		0	1	
6230	15046	2	\N	1	2018-01-01		0	1	
6238	15073	3	2	1	2018-01-01		0	1	
6246	15095	2	\N	1	2018-01-01		0	1	
6254	15113	2	\N	1	2018-01-01		0	1	
6262	15127	3	2	1	2018-01-01		0	1	
6270	15152	1	\N	1	2018-01-01		0	1	
6278	15170	3	\N	1	2018-01-01		0	1	
6286	15189	3	2	1	2018-01-01		0	1	
6294	15215	2	\N	1	2018-01-01		0	1	
6302	15232	3	\N	1	2018-01-01		0	1	
6310	15251	3	\N	1	2018-01-01		0	1	
6318	15264	3	2	1	2018-01-01		0	1	
6326	15292	2	\N	1	2018-01-01		0	1	
6334	15305	3	\N	1	2018-01-01		0	1	
6342	15319	3	\N	1	2018-01-01		0	1	
6350	15333	2	\N	1	2018-01-01		0	1	
6358	15348	2	\N	1	2018-01-01		0	1	
6366	15364	2	\N	1	2018-01-01		0	1	
6374	15385	3	2	1	2018-01-01		0	1	
6382	15402	1	\N	1	2018-01-01		0	1	
6390	15418	3	2	1	2018-01-01		0	1	
6398	15443	3	2	1	2018-01-01		0	1	
6406	15458	3	6	1	2018-01-01		0	1	
6414	15475	2	\N	1	2018-01-01		0	1	
6422	15497	3	2	1	2018-01-01		0	1	
6430	15515	3	1	1	2018-01-01		0	1	
6438	15536	3	\N	1	2018-01-01		0	1	
6446	15557	2	\N	1	2018-01-01		0	1	
6454	15577	2	\N	1	2018-01-01		0	1	
6462	15595	3	2	1	2018-01-01		0	1	
6470	15610	3	2	1	2018-01-01		0	1	
6478	15629	2	1	1	2018-01-01		0	1	
6486	15643	3	\N	1	2018-01-01		0	1	
6494	15678	3	2	1	2018-01-01		0	1	
6502	15693	3	1	1	2018-01-01		0	1	
6510	15708	3	\N	1	2018-01-01		0	1	
6518	15727	1	\N	1	2018-01-01		0	1	
6526	15749	2	\N	1	2018-01-01		0	1	
6534	15773	3	2	1	2018-01-01		0	1	
6542	15791	3	2	1	2018-01-01		0	1	
6550	15801	3	2	1	2018-01-01		0	1	
6558	15821	3	\N	1	2018-01-01		0	1	
6566	15840	2	1	1	2018-01-01		0	1	
6574	15860	2	1	1	2018-01-01		0	1	
6582	15873	3	\N	1	2018-01-01		0	1	
6590	15889	3	6	1	2018-01-01		0	1	
6598	15903	3	\N	1	2018-01-01		0	1	
6606	15915	2	\N	1	2018-01-01		0	1	
6614	15932	2	\N	1	2018-01-01		0	1	
6622	15950	3	2	1	2018-01-01		0	1	
6630	15966	2	\N	1	2018-01-01		0	1	
6638	15990	3	\N	1	2018-01-01		0	1	
6646	16013	3	\N	1	2018-01-01		0	1	
6654	16036	1	\N	1	2018-01-01		0	1	
6662	16050	2	1	1	2018-01-01		0	1	
6670	16067	2	\N	1	2018-01-01		0	1	
6678	16084	3	2	1	2018-01-01		0	1	
6686	16112	3	\N	1	2018-01-01		0	1	
6694	16129	3	6	1	2018-01-01		0	1	
6702	16143	3	\N	1	2018-01-01		0	1	
6710	16159	3	2	1	2018-01-01		0	1	
6718	16176	2	\N	1	2018-01-01		0	1	
6726	16197	2	\N	1	2018-01-01		0	1	
6734	16219	2	\N	1	2018-01-01		0	1	
6742	16235	3	2	1	2018-01-01		0	1	
6750	16252	2	\N	1	2018-01-01		0	1	
6758	16262	2	\N	1	2018-01-01		0	1	
6281	15176	2	\N	1	2018-01-01		0	1	
6289	15198	3	\N	1	2018-01-01		0	1	
6297	15221	2	\N	1	2018-01-01		0	1	
6305	15244	2	\N	1	2018-01-01		0	1	
6313	15254	1	2	1	2018-01-01		0	1	
6321	15277	3	2	1	2018-01-01		0	1	
6329	15295	2	\N	1	2018-01-01		0	1	
6337	15309	2	\N	1	2018-01-01		0	1	
6345	15325	2	2	1	2018-01-01		0	1	
6353	15339	3	2	1	2018-01-01		0	1	
6361	15357	2	2	1	2018-01-01		0	1	
6369	15375	3	\N	1	2018-01-01		0	1	
6377	15390	3	2	1	2018-01-01		0	1	
6385	15407	2	\N	1	2018-01-01		0	1	
6393	15427	2	\N	1	2018-01-01		0	1	
6401	15448	3	\N	1	2018-01-01		0	1	
6409	15467	3	\N	1	2018-01-01		0	1	
6417	15483	3	2	1	2018-01-01		0	1	
6425	15506	2	2	1	2018-01-01		0	1	
6433	15523	3	2	1	2018-01-01		0	1	
6441	15544	2	2	1	2018-01-01		0	1	
6449	15567	3	2	1	2018-01-01		0	1	
6457	15584	2	1	1	2018-01-01		0	1	
6465	15599	2	\N	1	2018-01-01		0	1	
6473	15619	1	\N	1	2018-01-01		0	1	
6481	15634	2	\N	1	2018-01-01		0	1	
6489	15663	3	7	1	2018-01-01		0	1	
6497	15685	2	\N	1	2018-01-01		0	1	
6505	15698	3	\N	1	2018-01-01		0	1	
6513	15717	2	\N	1	2018-01-01		0	1	
6521	15734	2	1	1	2018-01-01		0	1	
6529	15760	1	\N	1	2018-01-01		0	1	
6537	15781	2	\N	1	2018-01-01		0	1	
6545	15794	2	\N	1	2018-01-01		0	1	
6553	15807	2	\N	1	2018-01-01		0	1	
6561	15828	3	\N	1	2018-01-01		0	1	
6569	15849	3	\N	1	2018-01-01		0	1	
6577	15866	3	2	1	2018-01-01		0	1	
6585	15879	2	\N	1	2018-01-01		0	1	
6593	15897	2	\N	1	2018-01-01		0	1	
6601	15907	3	2	1	2018-01-01		0	1	
6609	15921	2	\N	1	2018-01-01		0	1	
6617	15936	2	\N	1	2018-01-01		0	1	
6625	15956	2	\N	1	2018-01-01		0	1	
6633	15975	3	\N	1	2018-01-01		0	1	
6641	16000	2	\N	1	2018-01-01		0	1	
6649	16022	3	2	1	2018-01-01		0	1	
6657	16043	1	\N	1	2018-01-01		0	1	
6665	16055	2	\N	1	2018-01-01		0	1	
6673	16072	2	\N	1	2018-01-01		0	1	
6681	16093	2	\N	1	2018-01-01		0	1	
6689	16121	3	6	1	2018-01-01		0	1	
6697	16135	2	\N	1	2018-01-01		0	1	
6705	16149	3	\N	1	2018-01-01		0	1	
6713	16168	3	1	1	2018-01-01		0	1	
6721	16180	3	\N	1	2018-01-01		0	1	
6729	16207	3	7	1	2018-01-01		0	1	
6737	16224	2	\N	1	2018-01-01		0	1	
6745	16240	3	2	1	2018-01-01		0	1	
6753	16256	2	\N	1	2018-01-01		0	1	
6761	16267	2	\N	1	2018-01-01		0	1	
6769	16287	2	1	1	2018-01-01		0	1	
6777	16307	3	\N	1	2018-01-01		0	1	
6785	16327	3	2	1	2018-01-01		0	1	
6793	16355	2	\N	1	2018-01-01		0	1	
6801	16376	2	\N	1	2018-01-01		0	1	
6809	16404	3	2	1	2018-01-01		0	1	
6817	16421	3	2	1	2018-01-01		0	1	
6825	16433	2	1	1	2018-01-01		0	1	
6833	16464	3	2	1	2018-01-01		0	1	
6841	16491	2	\N	1	2018-01-01		0	1	
6849	16507	3	4	1	2018-01-01		0	1	
6857	16532	2	\N	1	2018-01-01		0	1	
6865	16552	3	\N	1	2018-01-01		0	1	
6873	16570	3	\N	1	2018-01-01		0	1	
6881	16586	2	\N	1	2018-01-01		0	1	
6889	16606	3	6	1	2018-01-01		0	1	
6897	16622	2	\N	1	2018-01-01		0	1	
6905	16646	2	\N	1	2018-01-01		0	1	
6913	16664	2	\N	1	2018-01-01		0	1	
6921	16683	2	\N	1	2018-01-01		0	1	
6929	16699	1	\N	1	2018-01-01		0	1	
6937	16714	2	2	1	2018-01-01		0	1	
6945	16733	2	\N	1	2018-01-01		0	1	
6953	16747	2	2	1	2018-01-01		0	1	
6961	16760	2	\N	1	2018-01-01		0	1	
6969	16775	3	\N	1	2018-01-01		0	1	
6977	16798	2	\N	1	2018-01-01		0	1	
6985	16824	2	\N	1	2018-01-01		0	1	
6993	16851	\N	6	1	2018-01-01		0	1	
7001	16867	3	6	1	2018-01-01		0	1	
7009	16883	2	\N	1	2018-01-01		0	1	
7017	16911	3	\N	1	2018-01-01		0	1	
7025	16932	3	2	1	2018-01-01		0	1	
7033	16943	2	\N	1	2018-01-01		0	1	
7041	16963	3	1	1	2018-01-01		0	1	
7049	16979	2	\N	1	2018-01-01		0	1	
7057	17004	3	\N	1	2018-01-01		0	1	
7065	17028	1	\N	1	2018-01-01		0	1	
7073	17050	2	\N	1	2018-01-01		0	1	
7081	17069	2	\N	1	2018-01-01		0	1	
7089	17087	3	2	1	2018-01-01		0	1	
7097	17099	2	\N	1	2018-01-01		0	1	
7105	17118	2	2	1	2018-01-01		0	1	
7113	17153	2	\N	1	2018-01-01		0	1	
7121	17178	2	\N	1	2018-01-01		0	1	
7129	17192	3	2	1	2018-01-01		0	1	
7137	17214	2	\N	1	2018-01-01		0	1	
7145	17232	2	\N	1	2018-01-01		0	1	
7153	17242	3	\N	1	2018-01-01		0	1	
7161	17260	3	\N	1	2018-01-01		0	1	
6322	15279	2	1	1	2018-01-01		0	1	
6330	15298	3	\N	1	2018-01-01		0	1	
6338	15310	3	2	1	2018-01-01		0	1	
6346	15326	2	\N	1	2018-01-01		0	1	
6354	15343	2	\N	1	2018-01-01		0	1	
6362	15359	3	\N	1	2018-01-01		0	1	
6370	15377	2	\N	1	2018-01-01		0	1	
6378	15391	1	\N	1	2018-01-01		0	1	
6386	15409	2	\N	1	2018-01-01		0	1	
6394	15428	2	\N	1	2018-01-01		0	1	
6402	15450	2	\N	1	2018-01-01		0	1	
6410	15468	3	2	1	2018-01-01		0	1	
6418	15485	2	\N	1	2018-01-01		0	1	
6426	15507	2	\N	1	2018-01-01		0	1	
6434	15526	3	2	1	2018-01-01		0	1	
6442	15550	3	6	1	2018-01-01		0	1	
6450	15568	2	\N	1	2018-01-01		0	1	
6458	15586	3	2	1	2018-01-01		0	1	
6466	15600	3	2	1	2018-01-01		0	1	
6474	15620	3	2	1	2018-01-01		0	1	
6482	15636	3	\N	1	2018-01-01		0	1	
6490	15664	2	2	1	2018-01-01		0	1	
6498	15687	3	\N	1	2018-01-01		0	1	
6506	15700	1	\N	1	2018-01-01		0	1	
6514	15718	2	\N	1	2018-01-01		0	1	
6522	15736	2	\N	1	2018-01-01		0	1	
6530	15767	3	\N	1	2018-01-01		0	1	
6538	15784	2	4	1	2018-01-01		0	1	
6546	15796	3	2	1	2018-01-01		0	1	
6554	15810	3	2	1	2018-01-01		0	1	
6562	15832	2	\N	1	2018-01-01		0	1	
6570	15850	2	2	1	2018-01-01		0	1	
6578	15867	2	\N	1	2018-01-01		0	1	
6586	15880	2	\N	1	2018-01-01		0	1	
6594	15898	2	2	1	2018-01-01		0	1	
6602	15908	2	2	1	2018-01-01		0	1	
6610	15923	2	\N	1	2018-01-01		0	1	
6618	15939	2	\N	1	2018-01-01		0	1	
6626	15958	3	\N	1	2018-01-01		0	1	
6634	15978	2	\N	1	2018-01-01		0	1	
6642	16003	2	\N	1	2018-01-01		0	1	
6650	16023	3	\N	1	2018-01-01		0	1	
6658	16044	2	\N	1	2018-01-01		0	1	
6666	16057	2	\N	1	2018-01-01		0	1	
6674	16073	3	2	1	2018-01-01		0	1	
6682	16094	2	2	1	2018-01-01		0	1	
6690	16123	3	2	1	2018-01-01		0	1	
6698	16136	3	\N	1	2018-01-01		0	1	
6706	16150	3	2	1	2018-01-01		0	1	
6714	16169	2	2	1	2018-01-01		0	1	
6722	16182	2	\N	1	2018-01-01		0	1	
6730	16208	2	2	1	2018-01-01		0	1	
6738	16228	2	\N	1	2018-01-01		0	1	
6746	16245	2	\N	1	2018-01-01		0	1	
6754	16257	3	2	1	2018-01-01		0	1	
6762	16269	2	\N	1	2018-01-01		0	1	
6770	16289	2	\N	1	2018-01-01		0	1	
6778	16309	1	2	1	2018-01-01		0	1	
6786	16330	3	\N	1	2018-01-01		0	1	
6794	16358	3	2	1	2018-01-01		0	1	
6802	16377	3	\N	1	2018-01-01		0	1	
6810	16407	2	\N	1	2018-01-01		0	1	
6818	16422	3	\N	1	2018-01-01		0	1	
6826	16436	3	2	1	2018-01-01		0	1	
6834	16467	2	\N	1	2018-01-01		0	1	
6842	16492	3	\N	1	2018-01-01		0	1	
6850	16511	2	2	1	2018-01-01		0	1	
6858	16533	3	\N	1	2018-01-01		0	1	
6866	16555	1	\N	1	2018-01-01		0	1	
6874	16574	1	\N	1	2018-01-01		0	1	
6882	16588	\N	2	1	2018-01-01		0	1	
6890	16611	2	\N	1	2018-01-01		0	1	
6898	16624	\N	2	1	2018-01-01		0	1	
6906	16650	2	\N	1	2018-01-01		0	1	
6914	16667	2	\N	1	2018-01-01		0	1	
6922	16685	3	2	1	2018-01-01		0	1	
6930	16702	2	\N	1	2018-01-01		0	1	
6938	16715	2	\N	1	2018-01-01		0	1	
6946	16734	2	\N	1	2018-01-01		0	1	
6954	16748	3	2	1	2018-01-01		0	1	
6962	16761	2	\N	1	2018-01-01		0	1	
6970	16780	2	\N	1	2018-01-01		0	1	
6978	16801	2	2	1	2018-01-01		0	1	
6986	16826	3	6	1	2018-01-01		0	1	
6994	16852	2	\N	1	2018-01-01		0	1	
7002	16869	2	\N	1	2018-01-01		0	1	
7010	16886	2	\N	1	2018-01-01		0	1	
7018	16912	2	\N	1	2018-01-01		0	1	
7026	16934	2	\N	1	2018-01-01		0	1	
7034	16944	3	2	1	2018-01-01		0	1	
7042	16967	2	\N	1	2018-01-01		0	1	
7050	16981	2	\N	1	2018-01-01		0	1	
7058	17005	3	\N	1	2018-01-01		0	1	
7066	17030	2	\N	1	2018-01-01		0	1	
7074	17051	2	2	1	2018-01-01		0	1	
7082	17071	2	\N	1	2018-01-01		0	1	
7090	17088	3	5	1	2018-01-01		0	1	
7098	17101	2	\N	1	2018-01-01		0	1	
7106	17120	2	\N	1	2018-01-01		0	1	
7114	17156	3	2	1	2018-01-01		0	1	
7122	17179	2	\N	1	2018-01-01		0	1	
7130	17193	2	2	1	2018-01-01		0	1	
7138	17217	2	\N	1	2018-01-01		0	1	
7146	17234	2	\N	1	2018-01-01		0	1	
7154	17246	2	2	1	2018-01-01		0	1	
7162	17263	3	\N	1	2018-01-01		0	1	
7170	17278	1	\N	1	2018-01-01		0	1	
7178	17298	2	\N	1	2018-01-01		0	1	
7186	17317	3	2	1	2018-01-01		0	1	
7194	17338	2	\N	1	2018-01-01		0	1	
7202	17360	3	6	1	2018-01-01		0	1	
6207	14993	3	2	1	2018-01-01		0	1	
6215	15014	2	2	1	2018-01-01		0	1	
6223	15028	3	2	1	2018-01-01		0	1	
6231	15047	2	1	1	2018-01-01		0	1	
6239	15075	3	2	1	2018-01-01		0	1	
6247	15096	2	\N	1	2018-01-01		0	1	
6255	15118	2	2	1	2018-01-01		0	1	
6263	15134	2	\N	1	2018-01-01		0	1	
6271	15157	3	\N	1	2018-01-01		0	1	
6279	15172	3	\N	1	2018-01-01		0	1	
6287	15190	3	\N	1	2018-01-01		0	1	
6295	15219	2	\N	1	2018-01-01		0	1	
6303	15236	2	\N	1	2018-01-01		0	1	
6311	15252	3	\N	1	2018-01-01		0	1	
6319	15265	3	2	1	2018-01-01		0	1	
6327	15293	2	\N	1	2018-01-01		0	1	
6335	15307	3	2	1	2018-01-01		0	1	
6343	15322	3	2	1	2018-01-01		0	1	
6351	15336	2	\N	1	2018-01-01		0	1	
6359	15353	2	2	1	2018-01-01		0	1	
6367	15365	2	1	1	2018-01-01		0	1	
6375	15386	1	\N	1	2018-01-01		0	1	
6383	15404	2	2	1	2018-01-01		0	1	
6391	15421	3	\N	1	2018-01-01		0	1	
6399	15444	3	2	1	2018-01-01		0	1	
6407	15461	\N	2	1	2018-01-01		0	1	
6415	15478	3	\N	1	2018-01-01		0	1	
6423	15499	\N	2	1	2018-01-01		0	1	
6431	15518	1	\N	1	2018-01-01		0	1	
6439	15540	2	\N	1	2018-01-01		0	1	
6447	15558	2	\N	1	2018-01-01		0	1	
6455	15579	2	\N	1	2018-01-01		0	1	
6463	15596	3	\N	1	2018-01-01		0	1	
6471	15611	3	\N	1	2018-01-01		0	1	
6479	15631	1	\N	1	2018-01-01		0	1	
6487	15645	2	\N	1	2018-01-01		0	1	
6495	15680	3	2	1	2018-01-01		0	1	
6503	15695	2	\N	1	2018-01-01		0	1	
6511	15713	2	\N	1	2018-01-01		0	1	
6519	15729	2	\N	1	2018-01-01		0	1	
6527	15751	2	\N	1	2018-01-01		0	1	
6535	15774	3	6	1	2018-01-01		0	1	
6543	15792	3	2	1	2018-01-01		0	1	
6551	15805	2	\N	1	2018-01-01		0	1	
6559	15824	3	2	1	2018-01-01		0	1	
6567	15845	1	\N	1	2018-01-01		0	1	
6575	15862	1	\N	1	2018-01-01		0	1	
6583	15874	2	2	1	2018-01-01		0	1	
6591	15890	2	4	1	2018-01-01		0	1	
6599	15905	3	2	1	2018-01-01		0	1	
6607	15918	2	1	1	2018-01-01		0	1	
6615	15933	2	1	1	2018-01-01		0	1	
6623	15952	2	\N	1	2018-01-01		0	1	
6631	15970	3	1	1	2018-01-01		0	1	
6639	15994	3	\N	1	2018-01-01		0	1	
6647	16018	2	\N	1	2018-01-01		0	1	
6655	16039	3	2	1	2018-01-01		0	1	
6663	16051	2	\N	1	2018-01-01		0	1	
6671	16068	1	2	1	2018-01-01		0	1	
6679	16087	3	4	1	2018-01-01		0	1	
6687	16115	1	\N	1	2018-01-01		0	1	
6695	16130	2	\N	1	2018-01-01		0	1	
6703	16145	2	\N	1	2018-01-01		0	1	
6711	16160	2	2	1	2018-01-01		0	1	
6719	16178	3	\N	1	2018-01-01		0	1	
6727	16199	3	\N	1	2018-01-01		0	1	
6735	16220	3	\N	1	2018-01-01		0	1	
6743	16237	2	\N	1	2018-01-01		0	1	
6751	16253	2	2	1	2018-01-01		0	1	
6759	16263	2	\N	1	2018-01-01		0	1	
6767	16283	3	\N	1	2018-01-01		0	1	
6775	16304	2	2	1	2018-01-01		0	1	
6783	16325	3	\N	1	2018-01-01		0	1	
6791	16348	2	\N	1	2018-01-01		0	1	
6799	16372	2	\N	1	2018-01-01		0	1	
6807	16397	2	\N	1	2018-01-01		0	1	
6815	16413	2	\N	1	2018-01-01		0	1	
6823	16431	2	\N	1	2018-01-01		0	1	
6831	16459	2	\N	1	2018-01-01		0	1	
6839	16487	2	\N	1	2018-01-01		0	1	
6847	16505	2	\N	1	2018-01-01		0	1	
6855	16528	2	\N	1	2018-01-01		0	1	
6863	16543	2	\N	1	2018-01-01		0	1	
6871	16562	2	\N	1	2018-01-01		0	1	
6879	16584	2	\N	1	2018-01-01		0	1	
6887	16597	3	2	1	2018-01-01		0	1	
6895	16616	3	\N	1	2018-01-01		0	1	
6903	16641	2	2	1	2018-01-01		0	1	
6911	16658	3	6	1	2018-01-01		0	1	
6919	16679	3	2	1	2018-01-01		0	1	
6927	16695	2	\N	1	2018-01-01		0	1	
6935	16709	3	2	1	2018-01-01		0	1	
6943	16729	3	2	1	2018-01-01		0	1	
6951	16745	2	\N	1	2018-01-01		0	1	
6959	16755	3	2	1	2018-01-01		0	1	
6967	16772	3	2	1	2018-01-01		0	1	
6975	16796	3	\N	1	2018-01-01		0	1	
6983	16816	3	1	1	2018-01-01		0	1	
6991	16845	3	5	1	2018-01-01		0	1	
6999	16864	2	\N	1	2018-01-01		0	1	
7007	16879	3	\N	1	2018-01-01		0	1	
7015	16902	2	\N	1	2018-01-01		0	1	
7023	16928	2	\N	1	2018-01-01		0	1	
7031	16940	2	\N	1	2018-01-01		0	1	
7039	16960	2	\N	1	2018-01-01		0	1	
7047	16977	2	2	1	2018-01-01		0	1	
7055	16996	2	2	1	2018-01-01		0	1	
7063	17018	3	\N	1	2018-01-01		0	1	
7071	17041	3	\N	1	2018-01-01		0	1	
7079	17060	3	\N	1	2018-01-01		0	1	
7087	17081	2	\N	1	2018-01-01		0	1	
5827	14040	2	\N	1	2018-01-01		0	1	
5835	14061	2	\N	1	2018-01-01		0	1	
5843	14072	2	\N	1	2018-01-01		0	1	
5851	14085	3	2	1	2018-01-01		0	1	
5859	14115	3	5	1	2018-01-01		0	1	
5867	14142	3	\N	1	2018-01-01		0	1	
5875	14160	2	\N	1	2018-01-01		0	1	
5883	14172	3	\N	1	2018-01-01		0	1	
5891	14188	3	2	1	2018-01-01		0	1	
5899	14221	3	2	1	2018-01-01		0	1	
5907	14237	3	2	1	2018-01-01		0	1	
5915	14256	2	\N	1	2018-01-01		0	1	
5923	14281	2	\N	1	2018-01-01		0	1	
5931	14296	2	\N	1	2018-01-01		0	1	
5939	14316	2	\N	1	2018-01-01		0	1	
5947	14349	2	\N	1	2018-01-01		0	1	
5955	14370	3	\N	1	2018-01-01		0	1	
5963	14392	3	6	1	2018-01-01		0	1	
5971	14408	2	\N	1	2018-01-01		0	1	
5979	14418	3	\N	1	2018-01-01		0	1	
5987	14433	2	\N	1	2018-01-01		0	1	
5995	14452	2	2	1	2018-01-01		0	1	
6003	14461	2	\N	1	2018-01-01		0	1	
6011	14479	2	\N	1	2018-01-01		0	1	
6019	14520	3	2	1	2018-01-01		0	1	
6027	14542	2	\N	1	2018-01-01		0	1	
6035	14569	2	2	1	2018-01-01		0	1	
6043	14591	2	\N	1	2018-01-01		0	1	
6051	14609	2	\N	1	2018-01-01		0	1	
6059	14633	3	2	1	2018-01-01		0	1	
6067	14653	3	\N	1	2018-01-01		0	1	
6075	14680	2	\N	1	2018-01-01		0	1	
6083	14700	2	2	1	2018-01-01		0	1	
6091	14711	3	7	1	2018-01-01		0	1	
6099	14728	2	\N	1	2018-01-01		0	1	
6107	14743	3	\N	1	2018-01-01		0	1	
6115	14756	2	\N	1	2018-01-01		0	1	
6123	14775	2	\N	1	2018-01-01		0	1	
6131	14818	3	\N	1	2018-01-01		0	1	
6139	14835	2	\N	1	2018-01-01		0	1	
6147	14851	2	2	1	2018-01-01		0	1	
6155	14875	3	1	1	2018-01-01		0	1	
6163	14897	2	2	1	2018-01-01		0	1	
6171	14913	2	\N	1	2018-01-01		0	1	
6179	14938	3	2	1	2018-01-01		0	1	
6187	14957	3	\N	1	2018-01-01		0	1	
6195	14969	2	2	1	2018-01-01		0	1	
6203	14984	3	7	1	2018-01-01		0	1	
6211	15005	2	1	1	2018-01-01		0	1	
6219	15024	3	6	1	2018-01-01		0	1	
6227	15039	1	2	1	2018-01-01		0	1	
6235	15055	2	\N	1	2018-01-01		0	1	
6243	15088	2	\N	1	2018-01-01		0	1	
6251	15108	3	2	1	2018-01-01		0	1	
6259	15124	3	\N	1	2018-01-01		0	1	
6267	15142	2	\N	1	2018-01-01		0	1	
6275	15162	2	\N	1	2018-01-01		0	1	
6283	15183	2	\N	1	2018-01-01		0	1	
6291	15210	3	2	1	2018-01-01		0	1	
6299	15223	3	2	1	2018-01-01		0	1	
6307	15247	2	\N	1	2018-01-01		0	1	
6315	15259	3	\N	1	2018-01-01		0	1	
6323	15280	3	2	1	2018-01-01		0	1	
6331	15299	3	\N	1	2018-01-01		0	1	
6339	15311	3	2	1	2018-01-01		0	1	
6347	15328	3	2	1	2018-01-01		0	1	
6355	15345	2	\N	1	2018-01-01		0	1	
6363	15360	2	1	1	2018-01-01		0	1	
6371	15378	2	\N	1	2018-01-01		0	1	
6379	15393	3	2	1	2018-01-01		0	1	
6387	15413	2	\N	1	2018-01-01		0	1	
6395	15429	2	1	1	2018-01-01		0	1	
6403	15451	2	2	1	2018-01-01		0	1	
6411	15471	2	\N	1	2018-01-01		0	1	
6419	15486	3	2	1	2018-01-01		0	1	
6427	15509	2	\N	1	2018-01-01		0	1	
6435	15528	2	\N	1	2018-01-01		0	1	
6443	15553	3	\N	1	2018-01-01		0	1	
6451	15569	2	2	1	2018-01-01		0	1	
6459	15589	2	2	1	2018-01-01		0	1	
6467	15603	2	1	1	2018-01-01		0	1	
6475	15625	\N	5	1	2018-01-01		0	1	
6483	15637	1	\N	1	2018-01-01		0	1	
6491	15670	3	\N	1	2018-01-01		0	1	
6499	15689	2	\N	1	2018-01-01		0	1	
6507	15703	3	2	1	2018-01-01		0	1	
6515	15720	2	\N	1	2018-01-01		0	1	
6523	15737	3	\N	1	2018-01-01		0	1	
6531	15768	2	\N	1	2018-01-01		0	1	
6539	15785	1	\N	1	2018-01-01		0	1	
6547	15798	2	\N	1	2018-01-01		0	1	
6555	15812	2	1	1	2018-01-01		0	1	
6563	15834	3	2	1	2018-01-01		0	1	
6571	15852	3	4	1	2018-01-01		0	1	
6579	15870	3	2	1	2018-01-01		0	1	
6587	15881	2	\N	1	2018-01-01		0	1	
6595	15900	2	\N	1	2018-01-01		0	1	
6603	15911	2	\N	1	2018-01-01		0	1	
6611	15925	2	\N	1	2018-01-01		0	1	
6619	15940	1	2	1	2018-01-01		0	1	
6627	15959	3	1	1	2018-01-01		0	1	
6635	15980	2	\N	1	2018-01-01		0	1	
6643	16007	2	\N	1	2018-01-01		0	1	
6651	16024	3	4	1	2018-01-01		0	1	
6659	16046	2	\N	1	2018-01-01		0	1	
6667	16058	3	\N	1	2018-01-01		0	1	
6675	16077	1	\N	1	2018-01-01		0	1	
6683	16097	3	1	1	2018-01-01		0	1	
6691	16124	2	\N	1	2018-01-01		0	1	
6699	16139	2	\N	1	2018-01-01		0	1	
6707	16151	3	2	1	2018-01-01		0	1	
6715	16170	1	\N	1	2018-01-01		0	1	
6252	15109	3	7	1	2018-01-01		0	1	
6260	15125	2	\N	1	2018-01-01		0	1	
6268	15146	2	\N	1	2018-01-01		0	1	
6276	15165	3	2	1	2018-01-01		0	1	
6284	15184	3	2	1	2018-01-01		0	1	
6292	15211	3	6	1	2018-01-01		0	1	
6300	15225	1	\N	1	2018-01-01		0	1	
6308	15249	3	7	1	2018-01-01		0	1	
6316	15261	2	\N	1	2018-01-01		0	1	
6324	15283	3	6	1	2018-01-01		0	1	
6332	15301	3	2	1	2018-01-01		0	1	
6340	15316	2	\N	1	2018-01-01		0	1	
6348	15329	3	\N	1	2018-01-01		0	1	
6356	15346	2	\N	1	2018-01-01		0	1	
6364	15361	2	\N	1	2018-01-01		0	1	
6372	15382	2	\N	1	2018-01-01		0	1	
6380	15397	2	\N	1	2018-01-01		0	1	
6388	15414	2	\N	1	2018-01-01		0	1	
6396	15438	2	\N	1	2018-01-01		0	1	
6404	15452	3	2	1	2018-01-01		0	1	
6412	15472	2	\N	1	2018-01-01		0	1	
6420	15495	2	\N	1	2018-01-01		0	1	
6428	15510	2	\N	1	2018-01-01		0	1	
6436	15530	3	6	1	2018-01-01		0	1	
6444	15554	3	2	1	2018-01-01		0	1	
6452	15570	2	\N	1	2018-01-01		0	1	
6460	15592	3	\N	1	2018-01-01		0	1	
6468	15605	2	\N	1	2018-01-01		0	1	
6476	15626	2	\N	1	2018-01-01		0	1	
6484	15639	2	\N	1	2018-01-01		0	1	
6492	15671	2	\N	1	2018-01-01		0	1	
6500	15691	2	2	1	2018-01-01		0	1	
6508	15706	3	6	1	2018-01-01		0	1	
6516	15724	2	\N	1	2018-01-01		0	1	
6524	15742	3	\N	1	2018-01-01		0	1	
6532	15770	3	2	1	2018-01-01		0	1	
6540	15787	2	\N	1	2018-01-01		0	1	
6548	15799	2	\N	1	2018-01-01		0	1	
6556	15816	2	\N	1	2018-01-01		0	1	
6564	15836	3	2	1	2018-01-01		0	1	
6572	15854	2	2	1	2018-01-01		0	1	
6580	15871	3	\N	1	2018-01-01		0	1	
6588	15882	2	\N	1	2018-01-01		0	1	
6596	15901	3	\N	1	2018-01-01		0	1	
6604	15913	3	7	1	2018-01-01		0	1	
6612	15927	2	\N	1	2018-01-01		0	1	
6620	15941	2	\N	1	2018-01-01		0	1	
6628	15962	1	2	1	2018-01-01		0	1	
6636	15985	3	\N	1	2018-01-01		0	1	
6644	16008	3	\N	1	2018-01-01		0	1	
6652	16032	2	2	1	2018-01-01		0	1	
6660	16048	2	\N	1	2018-01-01		0	1	
6668	16063	3	7	1	2018-01-01		0	1	
6676	16078	2	\N	1	2018-01-01		0	1	
6684	16101	2	1	1	2018-01-01		0	1	
6692	16125	2	\N	1	2018-01-01		0	1	
6700	16140	3	2	1	2018-01-01		0	1	
6708	16157	3	\N	1	2018-01-01		0	1	
6716	16172	3	2	1	2018-01-01		0	1	
6724	16190	3	2	1	2018-01-01		0	1	
6732	16212	2	\N	1	2018-01-01		0	1	
6740	16232	2	\N	1	2018-01-01		0	1	
6748	16249	2	\N	1	2018-01-01		0	1	
6756	16259	2	2	1	2018-01-01		0	1	
6764	16273	2	\N	1	2018-01-01		0	1	
6772	16291	2	\N	1	2018-01-01		0	1	
6780	16312	1	\N	1	2018-01-01		0	1	
6788	16336	3	2	1	2018-01-01		0	1	
6796	16363	2	1	1	2018-01-01		0	1	
6804	16393	3	\N	1	2018-01-01		0	1	
6812	16409	2	\N	1	2018-01-01		0	1	
6820	16427	2	\N	1	2018-01-01		0	1	
6828	16444	2	\N	1	2018-01-01		0	1	
6836	16479	2	2	1	2018-01-01		0	1	
6844	16497	2	\N	1	2018-01-01		0	1	
6852	16519	3	4	1	2018-01-01		0	1	
6860	16536	3	2	1	2018-01-01		0	1	
6868	16557	3	2	1	2018-01-01		0	1	
6876	16578	2	\N	1	2018-01-01		0	1	
6884	16591	3	\N	1	2018-01-01		0	1	
6892	16613	2	\N	1	2018-01-01		0	1	
6900	16637	2	\N	1	2018-01-01		0	1	
6908	16654	2	\N	1	2018-01-01		0	1	
6916	16670	3	\N	1	2018-01-01		0	1	
6924	16690	2	\N	1	2018-01-01		0	1	
6932	16706	3	\N	1	2018-01-01		0	1	
6940	16718	2	2	1	2018-01-01		0	1	
6948	16739	2	\N	1	2018-01-01		0	1	
6956	16751	2	\N	1	2018-01-01		0	1	
6964	16763	2	\N	1	2018-01-01		0	1	
6972	16782	3	6	1	2018-01-01		0	1	
6980	16805	2	\N	1	2018-01-01		0	1	
6988	16831	3	2	1	2018-01-01		0	1	
6996	16857	2	2	1	2018-01-01		0	1	
7004	16871	3	5	1	2018-01-01		0	1	
7012	16899	3	2	1	2018-01-01		0	1	
7020	16915	1	2	1	2018-01-01		0	1	
7028	16936	1	\N	1	2018-01-01		0	1	
7036	16946	1	\N	1	2018-01-01		0	1	
7044	16970	3	6	1	2018-01-01		0	1	
7052	16984	2	\N	1	2018-01-01		0	1	
7060	17008	2	\N	1	2018-01-01		0	1	
7068	17035	2	\N	1	2018-01-01		0	1	
7076	17053	2	\N	1	2018-01-01		0	1	
7084	17078	3	2	1	2018-01-01		0	1	
7092	17092	3	2	1	2018-01-01		0	1	
7100	17105	2	\N	1	2018-01-01		0	1	
7108	17133	2	\N	1	2018-01-01		0	1	
7116	17167	2	\N	1	2018-01-01		0	1	
7124	17181	3	\N	1	2018-01-01		0	1	
7132	17196	\N	2	1	2018-01-01		0	1	
6165	14899	2	2	1	2018-01-01		0	1	
6173	14918	3	6	1	2018-01-01		0	1	
6181	14949	3	\N	1	2018-01-01		0	1	
6189	14959	2	\N	1	2018-01-01		0	1	
6197	14974	2	\N	1	2018-01-01		0	1	
6205	14987	3	\N	1	2018-01-01		0	1	
6213	15011	3	\N	1	2018-01-01		0	1	
6221	15026	2	\N	1	2018-01-01		0	1	
6229	15044	2	\N	1	2018-01-01		0	1	
6237	15070	3	7	1	2018-01-01		0	1	
6245	15090	2	\N	1	2018-01-01		0	1	
6253	15111	3	2	1	2018-01-01		0	1	
6261	15126	3	5	1	2018-01-01		0	1	
6269	15147	3	2	1	2018-01-01		0	1	
6277	15166	3	\N	1	2018-01-01		0	1	
6285	15185	2	\N	1	2018-01-01		0	1	
6293	15214	2	\N	1	2018-01-01		0	1	
6301	15226	3	\N	1	2018-01-01		0	1	
6309	15250	3	2	1	2018-01-01		0	1	
6317	15262	3	\N	1	2018-01-01		0	1	
6325	15286	3	6	1	2018-01-01		0	1	
6333	15304	3	\N	1	2018-01-01		0	1	
6341	15318	2	2	1	2018-01-01		0	1	
6349	15331	3	2	1	2018-01-01		0	1	
6357	15347	2	\N	1	2018-01-01		0	1	
6365	15362	2	\N	1	2018-01-01		0	1	
6373	15383	3	2	1	2018-01-01		0	1	
6381	15400	2	2	1	2018-01-01		0	1	
6389	15416	2	\N	1	2018-01-01		0	1	
6397	15441	3	2	1	2018-01-01		0	1	
6405	15454	3	2	1	2018-01-01		0	1	
6413	15473	2	\N	1	2018-01-01		0	1	
6421	15496	3	2	1	2018-01-01		0	1	
6429	15513	2	\N	1	2018-01-01		0	1	
6437	15532	2	\N	1	2018-01-01		0	1	
6445	15555	3	\N	1	2018-01-01		0	1	
6453	15573	2	\N	1	2018-01-01		0	1	
6461	15594	2	\N	1	2018-01-01		0	1	
6469	15609	3	6	1	2018-01-01		0	1	
6477	15627	3	2	1	2018-01-01		0	1	
6485	15642	2	\N	1	2018-01-01		0	1	
6493	15676	2	1	1	2018-01-01		0	1	
6501	15692	2	\N	1	2018-01-01		0	1	
6509	15707	3	2	1	2018-01-01		0	1	
6517	15725	2	2	1	2018-01-01		0	1	
6525	15746	2	\N	1	2018-01-01		0	1	
6533	15772	2	2	1	2018-01-01		0	1	
6541	15789	2	\N	1	2018-01-01		0	1	
6549	15800	3	\N	1	2018-01-01		0	1	
6557	15817	1	2	1	2018-01-01		0	1	
6565	15837	2	\N	1	2018-01-01		0	1	
6573	15857	2	\N	1	2018-01-01		0	1	
6581	15872	3	\N	1	2018-01-01		0	1	
6589	15884	2	\N	1	2018-01-01		0	1	
6597	15902	3	\N	1	2018-01-01		0	1	
6605	15914	2	\N	1	2018-01-01		0	1	
6613	15931	3	2	1	2018-01-01		0	1	
6621	15946	3	2	1	2018-01-01		0	1	
6629	15963	2	\N	1	2018-01-01		0	1	
6637	15987	2	\N	1	2018-01-01		0	1	
6645	16012	3	\N	1	2018-01-01		0	1	
6653	16033	2	\N	1	2018-01-01		0	1	
6661	16049	3	\N	1	2018-01-01		0	1	
6669	16065	2	\N	1	2018-01-01		0	1	
6677	16082	3	\N	1	2018-01-01		0	1	
6685	16106	2	\N	1	2018-01-01		0	1	
6693	16126	2	1	1	2018-01-01		0	1	
6701	16142	2	\N	1	2018-01-01		0	1	
6709	16158	3	2	1	2018-01-01		0	1	
6717	16174	3	2	1	2018-01-01		0	1	
6725	16195	3	1	1	2018-01-01		0	1	
6733	16216	2	\N	1	2018-01-01		0	1	
6741	16234	3	2	1	2018-01-01		0	1	
6749	16251	3	2	1	2018-01-01		0	1	
6757	16260	2	\N	1	2018-01-01		0	1	
6765	16276	3	7	1	2018-01-01		0	1	
6773	16293	3	\N	1	2018-01-01		0	1	
6781	16314	3	2	1	2018-01-01		0	1	
6789	16340	3	\N	1	2018-01-01		0	1	
6797	16364	2	\N	1	2018-01-01		0	1	
6805	16395	2	\N	1	2018-01-01		0	1	
6813	16410	3	\N	1	2018-01-01		0	1	
6821	16429	2	2	1	2018-01-01		0	1	
6829	16446	3	2	1	2018-01-01		0	1	
6837	16480	2	\N	1	2018-01-01		0	1	
6845	16498	2	\N	1	2018-01-01		0	1	
6853	16520	2	\N	1	2018-01-01		0	1	
6861	16537	2	\N	1	2018-01-01		0	1	
6869	16558	2	2	1	2018-01-01		0	1	
6877	16579	2	\N	1	2018-01-01		0	1	
6885	16592	3	2	1	2018-01-01		0	1	
6893	16614	3	2	1	2018-01-01		0	1	
6901	16638	2	\N	1	2018-01-01		0	1	
6909	16656	2	\N	1	2018-01-01		0	1	
6917	16671	2	2	1	2018-01-01		0	1	
6925	16691	2	\N	1	2018-01-01		0	1	
6933	16707	2	\N	1	2018-01-01		0	1	
6941	16719	\N	2	1	2018-01-01		0	1	
6949	16741	2	\N	1	2018-01-01		0	1	
6957	16752	2	\N	1	2018-01-01		0	1	
6965	16769	3	\N	1	2018-01-01		0	1	
6973	16789	2	\N	1	2018-01-01		0	1	
6981	16814	2	\N	1	2018-01-01		0	1	
6989	16834	3	2	1	2018-01-01		0	1	
6997	16858	2	\N	1	2018-01-01		0	1	
7005	16872	2	\N	1	2018-01-01		0	1	
7013	16900	1	\N	1	2018-01-01		0	1	
7021	16920	2	\N	1	2018-01-01		0	1	
7029	16937	2	\N	1	2018-01-01		0	1	
7037	16949	3	2	1	2018-01-01		0	1	
7045	16975	2	\N	1	2018-01-01		0	1	
6256	15119	1	\N	1	2018-01-01		0	1	
6264	15135	2	\N	1	2018-01-01		0	1	
6272	15159	3	2	1	2018-01-01		0	1	
6280	15174	3	\N	1	2018-01-01		0	1	
6288	15192	3	6	1	2018-01-01		0	1	
6296	15220	2	\N	1	2018-01-01		0	1	
6304	15243	3	\N	1	2018-01-01		0	1	
6312	15253	3	2	1	2018-01-01		0	1	
6320	15266	3	2	1	2018-01-01		0	1	
6328	15294	3	2	1	2018-01-01		0	1	
6336	15308	2	\N	1	2018-01-01		0	1	
6344	15324	3	2	1	2018-01-01		0	1	
6352	15337	3	\N	1	2018-01-01		0	1	
6360	15354	2	\N	1	2018-01-01		0	1	
6368	15374	2	\N	1	2018-01-01		0	1	
6376	15387	2	5	1	2018-01-01		0	1	
6384	15405	3	2	1	2018-01-01		0	1	
6392	15422	2	\N	1	2018-01-01		0	1	
6400	15447	3	\N	1	2018-01-01		0	1	
6408	15465	2	\N	1	2018-01-01		0	1	
6416	15479	\N	2	1	2018-01-01		0	1	
6424	15501	2	\N	1	2018-01-01		0	1	
6432	15519	2	\N	1	2018-01-01		0	1	
6440	15543	2	\N	1	2018-01-01		0	1	
6448	15564	3	6	1	2018-01-01		0	1	
6456	15583	2	\N	1	2018-01-01		0	1	
6464	15597	2	\N	1	2018-01-01		0	1	
6472	15615	2	1	1	2018-01-01		0	1	
6480	15633	3	\N	1	2018-01-01		0	1	
6488	15651	2	\N	1	2018-01-01		0	1	
6496	15684	1	\N	1	2018-01-01		0	1	
6504	15697	2	\N	1	2018-01-01		0	1	
6512	15715	3	2	1	2018-01-01		0	1	
6520	15730	3	2	1	2018-01-01		0	1	
6528	15753	3	\N	1	2018-01-01		0	1	
6536	15776	2	\N	1	2018-01-01		0	1	
6544	15793	3	\N	1	2018-01-01		0	1	
6552	15806	2	\N	1	2018-01-01		0	1	
6560	15826	2	1	1	2018-01-01		0	1	
6568	15847	2	\N	1	2018-01-01		0	1	
6576	15865	3	\N	1	2018-01-01		0	1	
6584	15876	2	\N	1	2018-01-01		0	1	
6592	15893	2	\N	1	2018-01-01		0	1	
6600	15906	3	\N	1	2018-01-01		0	1	
6608	15920	2	\N	1	2018-01-01		0	1	
6616	15934	2	\N	1	2018-01-01		0	1	
6624	15955	3	\N	1	2018-01-01		0	1	
6632	15971	1	\N	1	2018-01-01		0	1	
6640	15995	3	2	1	2018-01-01		0	1	
6648	16019	3	\N	1	2018-01-01		0	1	
6656	16042	2	\N	1	2018-01-01		0	1	
6664	16054	3	\N	1	2018-01-01		0	1	
6672	16069	2	\N	1	2018-01-01		0	1	
6680	16091	3	2	1	2018-01-01		0	1	
6688	16120	3	\N	1	2018-01-01		0	1	
6696	16131	2	\N	1	2018-01-01		0	1	
6704	16147	3	\N	1	2018-01-01		0	1	
6712	16167	2	\N	1	2018-01-01		0	1	
6720	16179	2	\N	1	2018-01-01		0	1	
6728	16206	2	\N	1	2018-01-01		0	1	
6736	16221	2	\N	1	2018-01-01		0	1	
6744	16238	2	\N	1	2018-01-01		0	1	
6752	16255	1	2	1	2018-01-01		0	1	
6760	16265	2	\N	1	2018-01-01		0	1	
6768	16286	2	\N	1	2018-01-01		0	1	
6776	16305	2	\N	1	2018-01-01		0	1	
6784	16326	3	\N	1	2018-01-01		0	1	
6792	16352	2	\N	1	2018-01-01		0	1	
6800	16375	3	\N	1	2018-01-01		0	1	
6808	16403	3	2	1	2018-01-01		0	1	
6816	16418	2	2	1	2018-01-01		0	1	
6824	16432	2	\N	1	2018-01-01		0	1	
6832	16461	3	\N	1	2018-01-01		0	1	
6840	16488	2	\N	1	2018-01-01		0	1	
6848	16506	2	\N	1	2018-01-01		0	1	
6856	16530	2	\N	1	2018-01-01		0	1	
6864	16546	3	7	1	2018-01-01		0	1	
6872	16569	2	\N	1	2018-01-01		0	1	
6880	16585	2	1	1	2018-01-01		0	1	
6888	16599	1	\N	1	2018-01-01		0	1	
6896	16621	2	\N	1	2018-01-01		0	1	
6904	16645	2	\N	1	2018-01-01		0	1	
6912	16661	2	\N	1	2018-01-01		0	1	
6920	16680	3	\N	1	2018-01-01		0	1	
6928	16697	2	2	1	2018-01-01		0	1	
6936	16713	3	1	1	2018-01-01		0	1	
6944	16730	3	2	1	2018-01-01		0	1	
6952	16746	1	2	1	2018-01-01		0	1	
6960	16756	3	\N	1	2018-01-01		0	1	
6968	16773	3	4	1	2018-01-01		0	1	
6976	16797	1	\N	1	2018-01-01		0	1	
6984	16820	3	2	1	2018-01-01		0	1	
6992	16850	2	1	1	2018-01-01		0	1	
7000	16865	2	\N	1	2018-01-01		0	1	
7008	16882	2	\N	1	2018-01-01		0	1	
7016	16905	2	\N	1	2018-01-01		0	1	
7024	16931	2	\N	1	2018-01-01		0	1	
7032	16941	2	\N	1	2018-01-01		0	1	
7040	16961	2	2	1	2018-01-01		0	1	
7048	16978	2	\N	1	2018-01-01		0	1	
7056	16999	1	\N	1	2018-01-01		0	1	
7064	17025	3	\N	1	2018-01-01		0	1	
7072	17042	3	2	1	2018-01-01		0	1	
7080	17064	2	\N	1	2018-01-01		0	1	
7088	17086	3	1	1	2018-01-01		0	1	
7096	17097	3	\N	1	2018-01-01		0	1	
7104	17117	1	\N	1	2018-01-01		0	1	
7112	17140	\N	2	1	2018-01-01		0	1	
7120	17176	2	\N	1	2018-01-01		0	1	
7128	17191	3	2	1	2018-01-01		0	1	
6766	16280	2	\N	1	2018-01-01		0	1	
6774	16297	3	\N	1	2018-01-01		0	1	
6782	16318	3	2	1	2018-01-01		0	1	
6790	16343	3	5	1	2018-01-01		0	1	
6798	16368	1	2	1	2018-01-01		0	1	
6806	16396	2	\N	1	2018-01-01		0	1	
6814	16411	3	2	1	2018-01-01		0	1	
6822	16430	3	5	1	2018-01-01		0	1	
6830	16454	3	\N	1	2018-01-01		0	1	
6838	16486	2	\N	1	2018-01-01		0	1	
6846	16502	2	\N	1	2018-01-01		0	1	
6854	16526	2	\N	1	2018-01-01		0	1	
6862	16541	3	2	1	2018-01-01		0	1	
6870	16559	1	\N	1	2018-01-01		0	1	
6878	16583	2	\N	1	2018-01-01		0	1	
6886	16596	2	\N	1	2018-01-01		0	1	
6894	16615	3	\N	1	2018-01-01		0	1	
6902	16640	3	6	1	2018-01-01		0	1	
6910	16657	3	\N	1	2018-01-01		0	1	
6918	16673	2	\N	1	2018-01-01		0	1	
6926	16692	3	2	1	2018-01-01		0	1	
6934	16708	2	\N	1	2018-01-01		0	1	
6942	16726	2	2	1	2018-01-01		0	1	
6950	16743	3	2	1	2018-01-01		0	1	
6958	16754	2	\N	1	2018-01-01		0	1	
6966	16770	2	\N	1	2018-01-01		0	1	
6974	16790	2	\N	1	2018-01-01		0	1	
6982	16815	3	2	1	2018-01-01		0	1	
6990	16839	3	2	1	2018-01-01		0	1	
6998	16861	2	\N	1	2018-01-01		0	1	
7006	16874	3	2	1	2018-01-01		0	1	
7014	16901	2	2	1	2018-01-01		0	1	
7022	16925	3	\N	1	2018-01-01		0	1	
7030	16938	1	2	1	2018-01-01		0	1	
7038	16955	3	2	1	2018-01-01		0	1	
7046	16976	3	\N	1	2018-01-01		0	1	
7054	16989	2	\N	1	2018-01-01		0	1	
7062	17010	2	2	1	2018-01-01		0	1	
7070	17037	2	\N	1	2018-01-01		0	1	
7078	17056	3	\N	1	2018-01-01		0	1	
7086	17080	2	\N	1	2018-01-01		0	1	
7094	17094	2	\N	1	2018-01-01		0	1	
7102	17110	2	\N	1	2018-01-01		0	1	
7110	17136	3	5	1	2018-01-01		0	1	
7118	17173	3	\N	1	2018-01-01		0	1	
7126	17184	2	\N	1	2018-01-01		0	1	
7134	17201	2	1	1	2018-01-01		0	1	
7142	17229	2	\N	1	2018-01-01		0	1	
7150	17239	1	2	1	2018-01-01		0	1	
7158	17256	3	2	1	2018-01-01		0	1	
7166	17271	1	\N	1	2018-01-01		0	1	
7174	17286	2	\N	1	2018-01-01		0	1	
7182	17306	2	1	1	2018-01-01		0	1	
7190	17332	2	\N	1	2018-01-01		0	1	
7198	17348	2	\N	1	2018-01-01		0	1	
7206	17366	3	2	1	2018-01-01		0	1	
7214	17380	2	\N	1	2018-01-01		0	1	
7222	17404	3	2	1	2018-01-01		0	1	
7230	17439	3	2	1	2018-01-01		0	1	
7238	17463	3	\N	1	2018-01-01		0	1	
7246	17479	2	\N	1	2018-01-01		0	1	
7254	17507	2	\N	1	2018-01-01		0	1	
7262	17522	2	\N	1	2018-01-01		0	1	
7270	17556	3	2	1	2018-01-01		0	1	
7278	17573	3	1	1	2018-01-01		0	1	
7286	17592	2	\N	1	2018-01-01		0	1	
7294	17610	3	2	1	2018-01-01		0	1	
7302	17636	2	\N	1	2018-01-01		0	1	
7310	17659	3	\N	1	2018-01-01		0	1	
7318	17678	2	\N	1	2018-01-01		0	1	
7326	17702	3	2	1	2018-01-01		0	1	
7334	17713	2	2	1	2018-01-01		0	1	
7342	17734	2	\N	1	2018-01-01		0	1	
7350	17757	3	2	1	2018-01-01		0	1	
7358	17783	2	\N	1	2018-01-01		0	1	
7366	17802	2	\N	1	2018-01-01		0	1	
7374	17818	3	\N	1	2018-01-01		0	1	
7382	17835	2	\N	1	2018-01-01		0	1	
7390	17863	2	\N	1	2018-01-01		0	1	
7398	17882	3	7	1	2018-01-01		0	1	
7406	17903	2	\N	1	2018-01-01		0	1	
7414	17926	3	2	1	2018-01-01		0	1	
7422	17950	2	\N	1	2018-01-01		0	1	
7430	17969	3	\N	1	2018-01-01		0	1	
7438	17983	2	\N	1	2018-01-01		0	1	
7446	17994	3	7	1	2018-01-01		0	1	
7454	18007	3	2	1	2018-01-01		0	1	
7462	18032	2	\N	1	2018-01-01		0	1	
7470	18051	3	\N	1	2018-01-01		0	1	
7478	18065	2	\N	1	2018-01-01		0	1	
7486	18084	2	\N	1	2018-01-01		0	1	
7494	18113	3	6	1	2018-01-01		0	1	
7502	18136	2	2	1	2018-01-01		0	1	
7510	18152	2	\N	1	2018-01-01		0	1	
7518	18172	2	2	1	2018-01-01		0	1	
7526	18198	2	2	1	2018-01-01		0	1	
7534	18218	2	\N	1	2018-01-01		0	1	
7542	18240	2	\N	1	2018-01-01		0	1	
7550	18264	3	2	1	2018-01-01		0	1	
7558	18292	2	\N	1	2018-01-01		0	1	
7566	18316	3	4	1	2018-01-01		0	1	
7574	18340	2	\N	1	2018-01-01		0	1	
7582	18356	2	\N	1	2018-01-01		0	1	
7590	18378	2	\N	1	2018-01-01		0	1	
7598	18396	3	2	1	2018-01-01		0	1	
7606	18416	2	2	1	2018-01-01		0	1	
7614	18437	2	\N	1	2018-01-01		0	1	
7622	18451	2	2	1	2018-01-01		0	1	
7630	18468	3	2	1	2018-01-01		0	1	
7638	18496	2	\N	1	2018-01-01		0	1	
7646	18512	1	2	1	2018-01-01		0	1	
7654	18529	2	\N	1	2018-01-01		0	1	
6723	16187	3	6	1	2018-01-01		0	1	
6731	16209	2	7	1	2018-01-01		0	1	
6739	16229	3	2	1	2018-01-01		0	1	
6747	16247	3	\N	1	2018-01-01		0	1	
6755	16258	2	2	1	2018-01-01		0	1	
6763	16270	2	1	1	2018-01-01		0	1	
6771	16290	2	\N	1	2018-01-01		0	1	
6779	16311	3	\N	1	2018-01-01		0	1	
6787	16334	2	\N	1	2018-01-01		0	1	
6795	16359	3	\N	1	2018-01-01		0	1	
6803	16388	3	6	1	2018-01-01		0	1	
6811	16408	2	\N	1	2018-01-01		0	1	
6819	16426	3	\N	1	2018-01-01		0	1	
6827	16438	2	1	1	2018-01-01		0	1	
6835	16470	3	6	1	2018-01-01		0	1	
6843	16495	2	\N	1	2018-01-01		0	1	
6851	16515	2	\N	1	2018-01-01		0	1	
6859	16535	3	\N	1	2018-01-01		0	1	
6867	16556	3	7	1	2018-01-01		0	1	
6875	16577	2	\N	1	2018-01-01		0	1	
6883	16590	2	1	1	2018-01-01		0	1	
6891	16612	2	2	1	2018-01-01		0	1	
6899	16626	3	\N	1	2018-01-01		0	1	
6907	16651	3	\N	1	2018-01-01		0	1	
6915	16669	3	2	1	2018-01-01		0	1	
6923	16689	2	\N	1	2018-01-01		0	1	
6931	16705	2	\N	1	2018-01-01		0	1	
6939	16716	\N	2	1	2018-01-01		0	1	
6947	16738	2	1	1	2018-01-01		0	1	
6955	16749	2	\N	1	2018-01-01		0	1	
6963	16762	3	2	1	2018-01-01		0	1	
6971	16781	2	\N	1	2018-01-01		0	1	
6979	16802	2	\N	1	2018-01-01		0	1	
6987	16827	3	2	1	2018-01-01		0	1	
6995	16853	2	\N	1	2018-01-01		0	1	
7003	16870	2	\N	1	2018-01-01		0	1	
7011	16897	3	6	1	2018-01-01		0	1	
7019	16914	3	1	1	2018-01-01		0	1	
7027	16935	3	\N	1	2018-01-01		0	1	
7035	16945	1	\N	1	2018-01-01		0	1	
7043	16969	2	\N	1	2018-01-01		0	1	
7051	16982	2	\N	1	2018-01-01		0	1	
7059	17007	2	\N	1	2018-01-01		0	1	
7067	17031	2	\N	1	2018-01-01		0	1	
7075	17052	2	\N	1	2018-01-01		0	1	
7083	17074	3	6	1	2018-01-01		0	1	
7091	17090	2	\N	1	2018-01-01		0	1	
7099	17103	3	2	1	2018-01-01		0	1	
7107	17121	2	\N	1	2018-01-01		0	1	
7115	17163	2	\N	1	2018-01-01		0	1	
7123	17180	2	\N	1	2018-01-01		0	1	
7131	17195	2	2	1	2018-01-01		0	1	
7139	17218	2	\N	1	2018-01-01		0	1	
7147	17236	2	\N	1	2018-01-01		0	1	
7155	17247	3	2	1	2018-01-01		0	1	
7163	17265	2	\N	1	2018-01-01		0	1	
7171	17279	3	6	1	2018-01-01		0	1	
7179	17303	3	\N	1	2018-01-01		0	1	
7187	17322	3	\N	1	2018-01-01		0	1	
7195	17340	2	\N	1	2018-01-01		0	1	
7203	17361	3	2	1	2018-01-01		0	1	
7211	17377	2	\N	1	2018-01-01		0	1	
7219	17392	1	\N	1	2018-01-01		0	1	
7227	17417	2	\N	1	2018-01-01		0	1	
7235	17458	3	2	1	2018-01-01		0	1	
7243	17473	3	\N	1	2018-01-01		0	1	
7251	17501	1	\N	1	2018-01-01		0	1	
7259	17518	2	\N	1	2018-01-01		0	1	
7267	17534	2	\N	1	2018-01-01		0	1	
7275	17567	2	\N	1	2018-01-01		0	1	
7283	17587	2	2	1	2018-01-01		0	1	
7291	17604	3	\N	1	2018-01-01		0	1	
7299	17622	2	\N	1	2018-01-01		0	1	
7307	17650	1	\N	1	2018-01-01		0	1	
7315	17672	2	\N	1	2018-01-01		0	1	
7323	17695	2	\N	1	2018-01-01		0	1	
7331	17708	2	\N	1	2018-01-01		0	1	
7339	17723	3	\N	1	2018-01-01		0	1	
7347	17749	3	2	1	2018-01-01		0	1	
7355	17776	3	2	1	2018-01-01		0	1	
7363	17795	3	\N	1	2018-01-01		0	1	
7371	17814	3	2	1	2018-01-01		0	1	
7379	17830	2	\N	1	2018-01-01		0	1	
7387	17851	1	\N	1	2018-01-01		0	1	
7395	17871	3	2	1	2018-01-01		0	1	
7403	17894	2	2	1	2018-01-01		0	1	
7411	17917	2	\N	1	2018-01-01		0	1	
7419	17941	3	2	1	2018-01-01		0	1	
7427	17965	2	\N	1	2018-01-01		0	1	
7435	17979	2	\N	1	2018-01-01		0	1	
7443	17989	3	2	1	2018-01-01		0	1	
7451	18002	1	2	1	2018-01-01		0	1	
7459	18023	3	\N	1	2018-01-01		0	1	
7467	18044	2	\N	1	2018-01-01		0	1	
7475	18060	3	2	1	2018-01-01		0	1	
7483	18076	2	\N	1	2018-01-01		0	1	
7491	18101	3	\N	1	2018-01-01		0	1	
7499	18127	3	\N	1	2018-01-01		0	1	
7507	18142	2	\N	1	2018-01-01		0	1	
7515	18166	3	2	1	2018-01-01		0	1	
7523	18192	3	\N	1	2018-01-01		0	1	
7531	18211	2	\N	1	2018-01-01		0	1	
7539	18231	3	2	1	2018-01-01		0	1	
7547	18252	3	6	1	2018-01-01		0	1	
7555	18280	2	2	1	2018-01-01		0	1	
7563	18307	3	2	1	2018-01-01		0	1	
7571	18333	2	\N	1	2018-01-01		0	1	
7579	18348	2	\N	1	2018-01-01		0	1	
7587	18371	3	7	1	2018-01-01		0	1	
7595	18387	2	\N	1	2018-01-01		0	1	
7603	18408	2	\N	1	2018-01-01		0	1	
7095	17096	2	\N	1	2018-01-01		0	1	
7103	17113	2	\N	1	2018-01-01		0	1	
7111	17139	2	\N	1	2018-01-01		0	1	
7119	17175	2	\N	1	2018-01-01		0	1	
7127	17187	3	6	1	2018-01-01		0	1	
7135	17202	2	\N	1	2018-01-01		0	1	
7143	17230	2	\N	1	2018-01-01		0	1	
7151	17240	2	\N	1	2018-01-01		0	1	
7159	17257	2	\N	1	2018-01-01		0	1	
7167	17272	3	\N	1	2018-01-01		0	1	
7175	17289	3	2	1	2018-01-01		0	1	
7183	17311	2	2	1	2018-01-01		0	1	
7191	17334	2	\N	1	2018-01-01		0	1	
7199	17350	1	\N	1	2018-01-01		0	1	
7207	17370	2	\N	1	2018-01-01		0	1	
7215	17381	2	\N	1	2018-01-01		0	1	
7223	17406	3	2	1	2018-01-01		0	1	
7231	17440	2	2	1	2018-01-01		0	1	
7239	17465	3	\N	1	2018-01-01		0	1	
7247	17485	2	\N	1	2018-01-01		0	1	
7255	17510	2	\N	1	2018-01-01		0	1	
7263	17529	2	\N	1	2018-01-01		0	1	
7271	17558	2	2	1	2018-01-01		0	1	
7279	17574	2	\N	1	2018-01-01		0	1	
7287	17593	3	\N	1	2018-01-01		0	1	
7295	17612	2	\N	1	2018-01-01		0	1	
7303	17638	1	\N	1	2018-01-01		0	1	
7311	17660	2	\N	1	2018-01-01		0	1	
7319	17679	2	\N	1	2018-01-01		0	1	
7327	17703	1	\N	1	2018-01-01		0	1	
7335	17714	3	4	1	2018-01-01		0	1	
7343	17737	2	2	1	2018-01-01		0	1	
7351	17760	2	\N	1	2018-01-01		0	1	
7359	17789	2	2	1	2018-01-01		0	1	
7367	17807	2	\N	1	2018-01-01		0	1	
7375	17819	2	2	1	2018-01-01		0	1	
7383	17836	2	\N	1	2018-01-01		0	1	
7391	17864	2	2	1	2018-01-01		0	1	
7399	17885	3	\N	1	2018-01-01		0	1	
7407	17904	3	2	1	2018-01-01		0	1	
7415	17929	3	\N	1	2018-01-01		0	1	
7423	17955	3	2	1	2018-01-01		0	1	
7431	17971	2	\N	1	2018-01-01		0	1	
7439	17984	2	\N	1	2018-01-01		0	1	
7447	17995	3	2	1	2018-01-01		0	1	
7455	18011	3	\N	1	2018-01-01		0	1	
7463	18035	3	2	1	2018-01-01		0	1	
7471	18053	2	\N	1	2018-01-01		0	1	
7479	18069	2	2	1	2018-01-01		0	1	
7487	18085	2	\N	1	2018-01-01		0	1	
7495	18115	3	2	1	2018-01-01		0	1	
7503	18137	2	2	1	2018-01-01		0	1	
7511	18156	2	\N	1	2018-01-01		0	1	
7519	18175	3	2	1	2018-01-01		0	1	
7527	18200	2	2	1	2018-01-01		0	1	
7535	18220	2	2	1	2018-01-01		0	1	
7543	18242	3	2	1	2018-01-01		0	1	
7551	18265	2	\N	1	2018-01-01		0	1	
7559	18299	2	\N	1	2018-01-01		0	1	
7567	18319	3	\N	1	2018-01-01		0	1	
7575	18341	3	\N	1	2018-01-01		0	1	
7583	18359	2	1	1	2018-01-01		0	1	
7591	18382	2	\N	1	2018-01-01		0	1	
7599	18401	2	\N	1	2018-01-01		0	1	
7607	18418	\N	2	1	2018-01-01		0	1	
7615	18439	2	1	1	2018-01-01		0	1	
7623	18453	2	\N	1	2018-01-01		0	1	
7631	18470	2	2	1	2018-01-01		0	1	
7639	18498	3	2	1	2018-01-01		0	1	
7647	18514	2	\N	1	2018-01-01		0	1	
7655	18532	2	2	1	2018-01-01		0	1	
7663	18549	2	\N	1	2018-01-01		0	1	
7671	18576	3	\N	1	2018-01-01		0	1	
7679	18595	3	6	1	2018-01-01		0	1	
7687	18616	2	\N	1	2018-01-01		0	1	
7695	18649	2	\N	1	2018-01-01		0	1	
7703	18674	2	2	1	2018-01-01		0	1	
7711	18698	2	\N	1	2018-01-01		0	1	
7719	18721	2	\N	1	2018-01-01		0	1	
7727	18732	3	1	1	2018-01-01		0	1	
7735	18754	2	\N	1	2018-01-01		0	1	
7743	18770	2	\N	1	2018-01-01		0	1	
7751	18787	2	\N	1	2018-01-01		0	1	
7759	18805	2	\N	1	2018-01-01		0	1	
7767	18835	1	\N	1	2018-01-01		0	1	
7775	18852	2	\N	1	2018-01-01		0	1	
7783	18872	1	\N	1	2018-01-01		0	1	
7791	18896	3	\N	1	2018-01-01		0	1	
7799	18916	2	\N	1	2018-01-01		0	1	
7807	18935	3	2	1	2018-01-01		0	1	
7815	18944	3	5	1	2018-01-01		0	1	
7823	18967	2	\N	1	2018-01-01		0	1	
7831	18989	2	\N	1	2018-01-01		0	1	
7839	19017	2	\N	1	2018-01-01		0	1	
7847	19042	2	\N	1	2018-01-01		0	1	
7855	19059	2	\N	1	2018-01-01		0	1	
7863	19085	3	2	1	2018-01-01		0	1	
7871	19096	3	\N	1	2018-01-01		0	1	
7879	19108	1	\N	1	2018-01-01		0	1	
7887	19123	2	\N	1	2018-01-01		0	1	
7895	19153	2	2	1	2018-01-01		0	1	
7903	19169	2	\N	1	2018-01-01		0	1	
7911	19193	3	2	1	2018-01-01		0	1	
7919	19218	2	\N	1	2018-01-01		0	1	
7927	19241	2	\N	1	2018-01-01		0	1	
7935	19266	3	2	1	2018-01-01		0	1	
7943	19287	2	\N	1	2018-01-01		0	1	
7951	19302	3	2	1	2018-01-01		0	1	
7959	19315	2	1	1	2018-01-01		0	1	
7967	19332	3	2	1	2018-01-01		0	1	
7975	19355	2	\N	1	2018-01-01		0	1	
7140	17222	3	2	1	2018-01-01		0	1	
7148	17237	2	1	1	2018-01-01		0	1	
7156	17248	2	2	1	2018-01-01		0	1	
7164	17266	2	\N	1	2018-01-01		0	1	
7172	17280	2	\N	1	2018-01-01		0	1	
7180	17304	2	\N	1	2018-01-01		0	1	
7188	17324	2	\N	1	2018-01-01		0	1	
7196	17343	1	\N	1	2018-01-01		0	1	
7204	17362	3	\N	1	2018-01-01		0	1	
7212	17378	2	\N	1	2018-01-01		0	1	
7220	17395	1	\N	1	2018-01-01		0	1	
7228	17418	3	1	1	2018-01-01		0	1	
7236	17460	1	\N	1	2018-01-01		0	1	
7244	17476	2	2	1	2018-01-01		0	1	
7252	17502	1	\N	1	2018-01-01		0	1	
7260	17520	3	2	1	2018-01-01		0	1	
7268	17535	3	2	1	2018-01-01		0	1	
7276	17569	3	\N	1	2018-01-01		0	1	
7284	17590	2	2	1	2018-01-01		0	1	
7292	17607	2	\N	1	2018-01-01		0	1	
7300	17632	3	\N	1	2018-01-01		0	1	
7308	17656	3	2	1	2018-01-01		0	1	
7316	17673	3	2	1	2018-01-01		0	1	
7324	17697	3	\N	1	2018-01-01		0	1	
7332	17709	\N	2	1	2018-01-01		0	1	
7340	17729	1	\N	1	2018-01-01		0	1	
7348	17750	3	7	1	2018-01-01		0	1	
7356	17779	2	\N	1	2018-01-01		0	1	
7364	17797	2	\N	1	2018-01-01		0	1	
7372	17815	\N	6	1	2018-01-01		0	1	
7380	17833	2	\N	1	2018-01-01		0	1	
7388	17853	3	\N	1	2018-01-01		0	1	
7396	17875	2	2	1	2018-01-01		0	1	
7404	17901	2	2	1	2018-01-01		0	1	
7412	17918	3	\N	1	2018-01-01		0	1	
7420	17942	2	\N	1	2018-01-01		0	1	
7428	17966	3	\N	1	2018-01-01		0	1	
7436	17980	1	\N	1	2018-01-01		0	1	
7444	17990	3	2	1	2018-01-01		0	1	
7452	18004	2	\N	1	2018-01-01		0	1	
7460	18024	3	\N	1	2018-01-01		0	1	
7468	18048	2	1	1	2018-01-01		0	1	
7476	18062	2	\N	1	2018-01-01		0	1	
7484	18080	3	2	1	2018-01-01		0	1	
7492	18107	2	\N	1	2018-01-01		0	1	
7500	18132	2	\N	1	2018-01-01		0	1	
7508	18147	3	6	1	2018-01-01		0	1	
7516	18169	2	\N	1	2018-01-01		0	1	
7524	18194	2	1	1	2018-01-01		0	1	
7532	18212	3	2	1	2018-01-01		0	1	
7540	18232	2	\N	1	2018-01-01		0	1	
7548	18255	3	7	1	2018-01-01		0	1	
7556	18282	2	\N	1	2018-01-01		0	1	
7564	18311	2	\N	1	2018-01-01		0	1	
7572	18336	3	\N	1	2018-01-01		0	1	
7580	18352	2	2	1	2018-01-01		0	1	
7588	18375	3	\N	1	2018-01-01		0	1	
7596	18388	3	\N	1	2018-01-01		0	1	
7604	18413	2	2	1	2018-01-01		0	1	
7612	18433	2	\N	1	2018-01-01		0	1	
7620	18448	2	\N	1	2018-01-01		0	1	
7628	18464	3	2	1	2018-01-01		0	1	
7636	18490	2	\N	1	2018-01-01		0	1	
7644	18508	3	2	1	2018-01-01		0	1	
7652	18525	3	\N	1	2018-01-01		0	1	
7660	18546	3	2	1	2018-01-01		0	1	
7668	18561	3	\N	1	2018-01-01		0	1	
7676	18590	2	2	1	2018-01-01		0	1	
7684	18612	2	\N	1	2018-01-01		0	1	
7692	18641	3	\N	1	2018-01-01		0	1	
7700	18660	2	\N	1	2018-01-01		0	1	
7708	18691	2	2	1	2018-01-01		0	1	
7716	18715	3	2	1	2018-01-01		0	1	
7724	18728	3	2	1	2018-01-01		0	1	
7732	18742	1	2	1	2018-01-01		0	1	
7740	18762	3	\N	1	2018-01-01		0	1	
7748	18782	3	6	1	2018-01-01		0	1	
7756	18798	3	\N	1	2018-01-01		0	1	
7764	18825	2	\N	1	2018-01-01		0	1	
7772	18848	2	2	1	2018-01-01		0	1	
7780	18865	2	2	1	2018-01-01		0	1	
7788	18887	3	2	1	2018-01-01		0	1	
7796	18906	2	\N	1	2018-01-01		0	1	
7804	18931	3	2	1	2018-01-01		0	1	
7812	18941	2	\N	1	2018-01-01		0	1	
7820	18953	3	1	1	2018-01-01		0	1	
7828	18985	2	2	1	2018-01-01		0	1	
7836	19007	2	\N	1	2018-01-01		0	1	
7844	19034	2	\N	1	2018-01-01		0	1	
7852	19051	3	\N	1	2018-01-01		0	1	
7860	19072	3	2	1	2018-01-01		0	1	
7868	19093	2	\N	1	2018-01-01		0	1	
7876	19104	3	\N	1	2018-01-01		0	1	
7884	19114	3	\N	1	2018-01-01		0	1	
7892	19139	\N	\N	1	2018-01-01		0	1	
7900	19162	2	\N	1	2018-01-01		0	1	
7908	19182	3	\N	1	2018-01-01		0	1	
7916	19214	3	2	1	2018-01-01		0	1	
7924	19227	2	\N	1	2018-01-01		0	1	
7932	19262	2	\N	1	2018-01-01		0	1	
7940	19283	2	\N	1	2018-01-01		0	1	
7948	19297	3	\N	1	2018-01-01		0	1	
7956	19310	3	2	1	2018-01-01		0	1	
7964	19326	2	\N	1	2018-01-01		0	1	
7972	19348	3	\N	1	2018-01-01		0	1	
7980	19366	2	\N	1	2018-01-01		0	1	
7988	19382	2	2	1	2018-01-01		0	1	
7996	19402	2	\N	1	2018-01-01		0	1	
8004	19417	3	6	1	2018-01-01		0	1	
8012	19431	3	\N	1	2018-01-01		0	1	
8020	19453	2	\N	1	2018-01-01		0	1	
8028	19471	3	4	1	2018-01-01		0	1	
7136	17204	2	\N	1	2018-01-01		0	1	
7144	17231	2	\N	1	2018-01-01		0	1	
7152	17241	2	2	1	2018-01-01		0	1	
7160	17259	3	2	1	2018-01-01		0	1	
7168	17273	\N	7	1	2018-01-01		0	1	
7176	17293	2	\N	1	2018-01-01		0	1	
7184	17312	3	\N	1	2018-01-01		0	1	
7192	17335	2	\N	1	2018-01-01		0	1	
7200	17351	3	5	1	2018-01-01		0	1	
7208	17371	2	\N	1	2018-01-01		0	1	
7216	17383	1	\N	1	2018-01-01		0	1	
7224	17407	2	\N	1	2018-01-01		0	1	
7232	17444	2	\N	1	2018-01-01		0	1	
7240	17466	2	\N	1	2018-01-01		0	1	
7248	17493	3	2	1	2018-01-01		0	1	
7256	17514	3	2	1	2018-01-01		0	1	
7264	17530	2	\N	1	2018-01-01		0	1	
7272	17559	2	2	1	2018-01-01		0	1	
7280	17579	3	\N	1	2018-01-01		0	1	
7288	17594	2	\N	1	2018-01-01		0	1	
7296	17613	3	2	1	2018-01-01		0	1	
7304	17644	2	\N	1	2018-01-01		0	1	
7312	17662	3	\N	1	2018-01-01		0	1	
7320	17684	3	2	1	2018-01-01		0	1	
7328	17704	3	\N	1	2018-01-01		0	1	
7336	17717	2	2	1	2018-01-01		0	1	
7344	17739	2	2	1	2018-01-01		0	1	
7352	17767	2	\N	1	2018-01-01		0	1	
7360	17790	3	\N	1	2018-01-01		0	1	
7368	17808	1	\N	1	2018-01-01		0	1	
7376	17820	2	\N	1	2018-01-01		0	1	
7384	17837	2	\N	1	2018-01-01		0	1	
7392	17866	2	\N	1	2018-01-01		0	1	
7400	17888	2	\N	1	2018-01-01		0	1	
7408	17907	3	6	1	2018-01-01		0	1	
7416	17933	2	2	1	2018-01-01		0	1	
7424	17960	3	\N	1	2018-01-01		0	1	
7432	17974	2	\N	1	2018-01-01		0	1	
7440	17986	2	\N	1	2018-01-01		0	1	
7448	17996	3	\N	1	2018-01-01		0	1	
7456	18016	\N	5	1	2018-01-01		0	1	
7464	18037	2	2	1	2018-01-01		0	1	
7472	18055	2	2	1	2018-01-01		0	1	
7480	18071	3	2	1	2018-01-01		0	1	
7488	18087	2	\N	1	2018-01-01		0	1	
7496	18117	2	\N	1	2018-01-01		0	1	
7504	18138	3	\N	1	2018-01-01		0	1	
7512	18161	2	2	1	2018-01-01		0	1	
7520	18181	2	\N	1	2018-01-01		0	1	
7528	18203	2	\N	1	2018-01-01		0	1	
7536	18221	3	2	1	2018-01-01		0	1	
7544	18244	3	\N	1	2018-01-01		0	1	
7552	18269	2	\N	1	2018-01-01		0	1	
7560	18302	3	2	1	2018-01-01		0	1	
7568	18321	2	\N	1	2018-01-01		0	1	
7576	18343	3	6	1	2018-01-01		0	1	
7584	18362	1	2	1	2018-01-01		0	1	
7592	18384	2	\N	1	2018-01-01		0	1	
7600	18403	2	\N	1	2018-01-01		0	1	
7608	18420	2	\N	1	2018-01-01		0	1	
7616	18443	2	2	1	2018-01-01		0	1	
7624	18455	2	\N	1	2018-01-01		0	1	
7632	18472	3	2	1	2018-01-01		0	1	
7640	18499	\N	7	1	2018-01-01		0	1	
7648	18516	2	2	1	2018-01-01		0	1	
7656	18533	2	\N	1	2018-01-01		0	1	
7664	18550	3	2	1	2018-01-01		0	1	
7672	18578	3	\N	1	2018-01-01		0	1	
7680	18596	2	2	1	2018-01-01		0	1	
7688	18628	2	\N	1	2018-01-01		0	1	
7696	18650	2	\N	1	2018-01-01		0	1	
7704	18677	2	\N	1	2018-01-01		0	1	
7712	18702	2	\N	1	2018-01-01		0	1	
7720	18723	2	\N	1	2018-01-01		0	1	
7728	18735	2	\N	1	2018-01-01		0	1	
7736	18755	2	\N	1	2018-01-01		0	1	
7744	18772	3	\N	1	2018-01-01		0	1	
7752	18792	2	\N	1	2018-01-01		0	1	
7760	18806	3	\N	1	2018-01-01		0	1	
7768	18840	3	2	1	2018-01-01		0	1	
7776	18855	3	5	1	2018-01-01		0	1	
7784	18873	2	\N	1	2018-01-01		0	1	
7792	18897	2	1	1	2018-01-01		0	1	
7800	18919	2	\N	1	2018-01-01		0	1	
7808	18936	2	2	1	2018-01-01		0	1	
7816	18945	2	2	1	2018-01-01		0	1	
7824	18976	2	2	1	2018-01-01		0	1	
7832	18991	2	\N	1	2018-01-01		0	1	
7840	19019	2	\N	1	2018-01-01		0	1	
7848	19043	3	\N	1	2018-01-01		0	1	
7856	19060	2	\N	1	2018-01-01		0	1	
7864	19087	2	\N	1	2018-01-01		0	1	
7872	19097	3	2	1	2018-01-01		0	1	
7880	19109	3	2	1	2018-01-01		0	1	
7888	19126	3	\N	1	2018-01-01		0	1	
7896	19155	2	2	1	2018-01-01		0	1	
7904	19171	3	2	1	2018-01-01		0	1	
7912	19201	3	5	1	2018-01-01		0	1	
7920	19219	2	\N	1	2018-01-01		0	1	
7928	19245	2	\N	1	2018-01-01		0	1	
7936	19268	3	\N	1	2018-01-01		0	1	
7944	19290	2	\N	1	2018-01-01		0	1	
7952	19303	2	\N	1	2018-01-01		0	1	
7960	19316	2	\N	1	2018-01-01		0	1	
7968	19334	2	\N	1	2018-01-01		0	1	
7976	19357	3	7	1	2018-01-01		0	1	
7984	19377	2	\N	1	2018-01-01		0	1	
7992	19388	3	2	1	2018-01-01		0	1	
8000	19410	3	2	1	2018-01-01		0	1	
8008	19426	3	7	1	2018-01-01		0	1	
8016	19444	2	\N	1	2018-01-01		0	1	
7053	16986	2	\N	1	2018-01-01		0	1	
7061	17009	2	\N	1	2018-01-01		0	1	
7069	17036	3	2	1	2018-01-01		0	1	
7077	17055	3	\N	1	2018-01-01		0	1	
7085	17079	2	2	1	2018-01-01		0	1	
7093	17093	2	\N	1	2018-01-01		0	1	
7101	17106	3	\N	1	2018-01-01		0	1	
7109	17134	3	2	1	2018-01-01		0	1	
7117	17168	3	2	1	2018-01-01		0	1	
7125	17183	2	\N	1	2018-01-01		0	1	
7133	17197	2	\N	1	2018-01-01		0	1	
7141	17226	2	\N	1	2018-01-01		0	1	
7149	17238	1	\N	1	2018-01-01		0	1	
7157	17253	3	2	1	2018-01-01		0	1	
7165	17268	2	\N	1	2018-01-01		0	1	
7173	17284	3	6	1	2018-01-01		0	1	
7181	17305	3	\N	1	2018-01-01		0	1	
7189	17330	3	\N	1	2018-01-01		0	1	
7197	17347	2	\N	1	2018-01-01		0	1	
7205	17364	3	\N	1	2018-01-01		0	1	
7213	17379	2	\N	1	2018-01-01		0	1	
7221	17400	3	2	1	2018-01-01		0	1	
7229	17432	3	\N	1	2018-01-01		0	1	
7237	17461	2	\N	1	2018-01-01		0	1	
7245	17478	2	2	1	2018-01-01		0	1	
7253	17503	3	2	1	2018-01-01		0	1	
7261	17521	1	\N	1	2018-01-01		0	1	
7269	17539	2	\N	1	2018-01-01		0	1	
7277	17570	2	\N	1	2018-01-01		0	1	
7285	17591	3	\N	1	2018-01-01		0	1	
7293	17608	2	\N	1	2018-01-01		0	1	
7301	17635	2	\N	1	2018-01-01		0	1	
7309	17658	3	2	1	2018-01-01		0	1	
7317	17675	3	2	1	2018-01-01		0	1	
7325	17700	2	\N	1	2018-01-01		0	1	
7333	17711	2	\N	1	2018-01-01		0	1	
7341	17730	3	6	1	2018-01-01		0	1	
7349	17752	2	\N	1	2018-01-01		0	1	
7357	17780	2	\N	1	2018-01-01		0	1	
7365	17798	2	\N	1	2018-01-01		0	1	
7373	17817	2	\N	1	2018-01-01		0	1	
7381	17834	2	\N	1	2018-01-01		0	1	
7389	17856	2	\N	1	2018-01-01		0	1	
7397	17880	3	2	1	2018-01-01		0	1	
7405	17902	3	2	1	2018-01-01		0	1	
7413	17919	2	\N	1	2018-01-01		0	1	
7421	17946	3	2	1	2018-01-01		0	1	
7429	17967	2	\N	1	2018-01-01		0	1	
7437	17981	2	1	1	2018-01-01		0	1	
7445	17993	2	\N	1	2018-01-01		0	1	
7453	18006	3	2	1	2018-01-01		0	1	
7461	18025	2	\N	1	2018-01-01		0	1	
7469	18050	2	\N	1	2018-01-01		0	1	
7477	18064	2	\N	1	2018-01-01		0	1	
7485	18081	2	2	1	2018-01-01		0	1	
7493	18108	2	\N	1	2018-01-01		0	1	
7501	18134	2	2	1	2018-01-01		0	1	
7509	18150	3	2	1	2018-01-01		0	1	
7517	18171	3	2	1	2018-01-01		0	1	
7525	18196	3	\N	1	2018-01-01		0	1	
7533	18215	2	2	1	2018-01-01		0	1	
7541	18234	2	\N	1	2018-01-01		0	1	
7549	18256	2	\N	1	2018-01-01		0	1	
7557	18287	3	5	1	2018-01-01		0	1	
7565	18314	2	\N	1	2018-01-01		0	1	
7573	18337	2	\N	1	2018-01-01		0	1	
7581	18355	2	2	1	2018-01-01		0	1	
7589	18377	3	\N	1	2018-01-01		0	1	
7597	18390	2	\N	1	2018-01-01		0	1	
7605	18414	3	6	1	2018-01-01		0	1	
7613	18436	2	2	1	2018-01-01		0	1	
7621	18449	2	2	1	2018-01-01		0	1	
7629	18465	3	6	1	2018-01-01		0	1	
7637	18493	2	2	1	2018-01-01		0	1	
7645	18509	2	\N	1	2018-01-01		0	1	
7653	18526	2	\N	1	2018-01-01		0	1	
7661	18547	3	\N	1	2018-01-01		0	1	
7669	18564	2	\N	1	2018-01-01		0	1	
7677	18591	\N	7	1	2018-01-01		0	1	
7685	18613	3	2	1	2018-01-01		0	1	
7693	18643	3	5	1	2018-01-01		0	1	
7701	18665	3	\N	1	2018-01-01		0	1	
7709	18692	2	\N	1	2018-01-01		0	1	
7717	18716	2	\N	1	2018-01-01		0	1	
7725	18729	2	\N	1	2018-01-01		0	1	
7733	18747	2	2	1	2018-01-01		0	1	
7741	18764	3	\N	1	2018-01-01		0	1	
7749	18783	2	\N	1	2018-01-01		0	1	
7757	18802	2	\N	1	2018-01-01		0	1	
7765	18827	2	2	1	2018-01-01		0	1	
7773	18849	3	2	1	2018-01-01		0	1	
7781	18866	3	\N	1	2018-01-01		0	1	
7789	18890	3	6	1	2018-01-01		0	1	
7797	18911	3	2	1	2018-01-01		0	1	
7805	18933	2	\N	1	2018-01-01		0	1	
7813	18942	2	2	1	2018-01-01		0	1	
7821	18958	3	6	1	2018-01-01		0	1	
7829	18986	2	1	1	2018-01-01		0	1	
7837	19010	3	2	1	2018-01-01		0	1	
7845	19039	2	\N	1	2018-01-01		0	1	
7853	19052	3	2	1	2018-01-01		0	1	
7861	19074	2	2	1	2018-01-01		0	1	
7869	19094	2	\N	1	2018-01-01		0	1	
7877	19105	2	\N	1	2018-01-01		0	1	
7885	19116	3	2	1	2018-01-01		0	1	
7893	19140	2	1	1	2018-01-01		0	1	
7901	19165	3	6	1	2018-01-01		0	1	
7909	19188	3	\N	1	2018-01-01		0	1	
7917	19215	2	\N	1	2018-01-01		0	1	
7925	19232	3	2	1	2018-01-01		0	1	
7933	19263	2	\N	1	2018-01-01		0	1	
7941	19284	2	\N	1	2018-01-01		0	1	
7169	17277	2	2	1	2018-01-01		0	1	
7177	17294	3	\N	1	2018-01-01		0	1	
7185	17313	2	\N	1	2018-01-01		0	1	
7193	17337	2	\N	1	2018-01-01		0	1	
7201	17356	3	2	1	2018-01-01		0	1	
7209	17372	3	2	1	2018-01-01		0	1	
7217	17388	3	5	1	2018-01-01		0	1	
7225	17410	2	\N	1	2018-01-01		0	1	
7233	17447	2	\N	1	2018-01-01		0	1	
7241	17467	3	5	1	2018-01-01		0	1	
7249	17495	3	\N	1	2018-01-01		0	1	
7257	17516	2	\N	1	2018-01-01		0	1	
7265	17531	2	\N	1	2018-01-01		0	1	
7273	17561	3	\N	1	2018-01-01		0	1	
7281	17583	3	2	1	2018-01-01		0	1	
7289	17595	1	\N	1	2018-01-01		0	1	
7297	17615	3	2	1	2018-01-01		0	1	
7305	17646	1	\N	1	2018-01-01		0	1	
7313	17665	2	\N	1	2018-01-01		0	1	
7321	17690	2	\N	1	2018-01-01		0	1	
7329	17706	2	\N	1	2018-01-01		0	1	
7337	17720	3	\N	1	2018-01-01		0	1	
7345	17744	3	2	1	2018-01-01		0	1	
7353	17773	2	\N	1	2018-01-01		0	1	
7361	17791	2	\N	1	2018-01-01		0	1	
7369	17809	2	2	1	2018-01-01		0	1	
7377	17821	3	2	1	2018-01-01		0	1	
7385	17844	3	2	1	2018-01-01		0	1	
7393	17868	2	\N	1	2018-01-01		0	1	
7401	17889	3	\N	1	2018-01-01		0	1	
7409	17915	2	2	1	2018-01-01		0	1	
7417	17934	3	2	1	2018-01-01		0	1	
7425	17962	3	2	1	2018-01-01		0	1	
7433	17975	3	2	1	2018-01-01		0	1	
7441	17987	2	2	1	2018-01-01		0	1	
7449	17998	3	\N	1	2018-01-01		0	1	
7457	18018	3	1	1	2018-01-01		0	1	
7465	18039	3	6	1	2018-01-01		0	1	
7473	18058	1	\N	1	2018-01-01		0	1	
7481	18074	3	5	1	2018-01-01		0	1	
7489	18088	2	2	1	2018-01-01		0	1	
7497	18118	3	2	1	2018-01-01		0	1	
7505	18140	2	\N	1	2018-01-01		0	1	
7513	18162	2	2	1	2018-01-01		0	1	
7521	18184	3	2	1	2018-01-01		0	1	
7529	18207	2	\N	1	2018-01-01		0	1	
7537	18225	3	2	1	2018-01-01		0	1	
7545	18246	3	2	1	2018-01-01		0	1	
7553	18271	3	\N	1	2018-01-01		0	1	
7561	18303	2	\N	1	2018-01-01		0	1	
7569	18325	2	2	1	2018-01-01		0	1	
7577	18345	2	2	1	2018-01-01		0	1	
7585	18365	2	\N	1	2018-01-01		0	1	
7593	18385	3	2	1	2018-01-01		0	1	
7601	18404	2	\N	1	2018-01-01		0	1	
7609	18424	2	\N	1	2018-01-01		0	1	
7617	18444	3	2	1	2018-01-01		0	1	
7625	18459	2	\N	1	2018-01-01		0	1	
7633	18473	3	\N	1	2018-01-01		0	1	
7641	18500	3	2	1	2018-01-01		0	1	
7649	18518	2	\N	1	2018-01-01		0	1	
7657	18535	3	\N	1	2018-01-01		0	1	
7665	18551	3	\N	1	2018-01-01		0	1	
7673	18581	3	2	1	2018-01-01		0	1	
7681	18604	3	2	1	2018-01-01		0	1	
7689	18629	2	\N	1	2018-01-01		0	1	
7697	18654	3	\N	1	2018-01-01		0	1	
7705	18678	3	\N	1	2018-01-01		0	1	
7713	18708	2	\N	1	2018-01-01		0	1	
7721	18724	3	2	1	2018-01-01		0	1	
7729	18736	3	4	1	2018-01-01		0	1	
7737	18757	3	\N	1	2018-01-01		0	1	
7745	18773	2	2	1	2018-01-01		0	1	
7753	18793	2	\N	1	2018-01-01		0	1	
7761	18808	\N	2	1	2018-01-01		0	1	
7769	18842	2	\N	1	2018-01-01		0	1	
7777	18856	2	\N	1	2018-01-01		0	1	
7785	18876	3	2	1	2018-01-01		0	1	
7793	18901	3	\N	1	2018-01-01		0	1	
7801	18920	3	2	1	2018-01-01		0	1	
7809	18937	2	\N	1	2018-01-01		0	1	
7817	18946	3	2	1	2018-01-01		0	1	
7825	18978	2	\N	1	2018-01-01		0	1	
7833	18998	3	\N	1	2018-01-01		0	1	
7841	19023	2	\N	1	2018-01-01		0	1	
7849	19045	2	\N	1	2018-01-01		0	1	
7857	19062	2	\N	1	2018-01-01		0	1	
7865	19090	3	7	1	2018-01-01		0	1	
7873	19099	3	7	1	2018-01-01		0	1	
7881	19110	2	\N	1	2018-01-01		0	1	
7889	19130	2	2	1	2018-01-01		0	1	
7897	19156	2	\N	1	2018-01-01		0	1	
7905	19175	2	1	1	2018-01-01		0	1	
7913	19206	3	2	1	2018-01-01		0	1	
7921	19220	2	\N	1	2018-01-01		0	1	
7929	19253	2	2	1	2018-01-01		0	1	
7937	19271	2	\N	1	2018-01-01		0	1	
7945	19291	2	\N	1	2018-01-01		0	1	
7953	19306	2	\N	1	2018-01-01		0	1	
7961	19317	2	\N	1	2018-01-01		0	1	
7969	19342	2	2	1	2018-01-01		0	1	
7977	19359	3	6	1	2018-01-01		0	1	
7985	19378	2	\N	1	2018-01-01		0	1	
7993	19389	2	2	1	2018-01-01		0	1	
8001	19411	3	\N	1	2018-01-01		0	1	
8009	19427	2	2	1	2018-01-01		0	1	
8017	19445	3	2	1	2018-01-01		0	1	
8025	19462	2	\N	1	2018-01-01		0	1	
8033	19483	3	2	1	2018-01-01		0	1	
8041	19509	2	\N	1	2018-01-01		0	1	
8049	19531	2	\N	1	2018-01-01		0	1	
8057	19544	2	\N	1	2018-01-01		0	1	
7210	17376	3	2	1	2018-01-01		0	1	
7218	17390	2	\N	1	2018-01-01		0	1	
7226	17413	3	6	1	2018-01-01		0	1	
7234	17456	2	2	1	2018-01-01		0	1	
7242	17472	2	\N	1	2018-01-01		0	1	
7250	17499	2	\N	1	2018-01-01		0	1	
7258	17517	3	2	1	2018-01-01		0	1	
7266	17532	2	\N	1	2018-01-01		0	1	
7274	17564	3	\N	1	2018-01-01		0	1	
7282	17585	2	2	1	2018-01-01		0	1	
7290	17596	2	\N	1	2018-01-01		0	1	
7298	17616	3	2	1	2018-01-01		0	1	
7306	17647	2	\N	1	2018-01-01		0	1	
7314	17667	2	\N	1	2018-01-01		0	1	
7322	17694	2	\N	1	2018-01-01		0	1	
7330	17707	2	\N	1	2018-01-01		0	1	
7338	17722	2	\N	1	2018-01-01		0	1	
7346	17747	3	6	1	2018-01-01		0	1	
7354	17775	3	7	1	2018-01-01		0	1	
7362	17794	2	\N	1	2018-01-01		0	1	
7370	17813	3	7	1	2018-01-01		0	1	
7378	17825	3	\N	1	2018-01-01		0	1	
7386	17848	3	6	1	2018-01-01		0	1	
7394	17869	3	2	1	2018-01-01		0	1	
7402	17893	2	\N	1	2018-01-01		0	1	
7410	17916	2	1	1	2018-01-01		0	1	
7418	17935	2	\N	1	2018-01-01		0	1	
7426	17963	2	2	1	2018-01-01		0	1	
7434	17977	1	\N	1	2018-01-01		0	1	
7442	17988	2	\N	1	2018-01-01		0	1	
7450	18000	1	\N	1	2018-01-01		0	1	
7458	18022	2	\N	1	2018-01-01		0	1	
7466	18042	2	\N	1	2018-01-01		0	1	
7474	18059	3	6	1	2018-01-01		0	1	
7482	18075	3	2	1	2018-01-01		0	1	
7490	18093	2	\N	1	2018-01-01		0	1	
7498	18120	3	\N	1	2018-01-01		0	1	
7506	18141	3	\N	1	2018-01-01		0	1	
7514	18163	2	\N	1	2018-01-01		0	1	
7522	18189	2	2	1	2018-01-01		0	1	
7530	18209	2	2	1	2018-01-01		0	1	
7538	18226	3	2	1	2018-01-01		0	1	
7546	18249	2	\N	1	2018-01-01		0	1	
7554	18273	3	2	1	2018-01-01		0	1	
7562	18304	3	\N	1	2018-01-01		0	1	
7570	18329	2	\N	1	2018-01-01		0	1	
7578	18346	2	\N	1	2018-01-01		0	1	
7586	18368	3	\N	1	2018-01-01		0	1	
7594	18386	2	\N	1	2018-01-01		0	1	
7602	18405	2	1	1	2018-01-01		0	1	
7610	18425	3	4	1	2018-01-01		0	1	
7618	18445	3	\N	1	2018-01-01		0	1	
7626	18460	2	2	1	2018-01-01		0	1	
7634	18474	2	2	1	2018-01-01		0	1	
7642	18504	3	6	1	2018-01-01		0	1	
7650	18519	3	4	1	2018-01-01		0	1	
7658	18537	2	\N	1	2018-01-01		0	1	
7666	18555	2	\N	1	2018-01-01		0	1	
7674	18587	1	2	1	2018-01-01		0	1	
7682	18606	2	\N	1	2018-01-01		0	1	
7690	18631	3	2	1	2018-01-01		0	1	
7698	18657	2	\N	1	2018-01-01		0	1	
7706	18681	2	\N	1	2018-01-01		0	1	
7714	18709	3	1	1	2018-01-01		0	1	
7722	18725	3	6	1	2018-01-01		0	1	
7730	18738	3	\N	1	2018-01-01		0	1	
7738	18759	2	\N	1	2018-01-01		0	1	
7746	18780	3	2	1	2018-01-01		0	1	
7754	18794	2	\N	1	2018-01-01		0	1	
7762	18816	3	2	1	2018-01-01		0	1	
7770	18843	3	2	1	2018-01-01		0	1	
7778	18858	1	\N	1	2018-01-01		0	1	
7786	18877	3	2	1	2018-01-01		0	1	
7794	18903	3	\N	1	2018-01-01		0	1	
7802	18921	1	\N	1	2018-01-01		0	1	
7810	18938	2	\N	1	2018-01-01		0	1	
7818	18947	2	\N	1	2018-01-01		0	1	
7826	18980	2	\N	1	2018-01-01		0	1	
7834	18999	2	\N	1	2018-01-01		0	1	
7842	19027	2	2	1	2018-01-01		0	1	
7850	19047	1	\N	1	2018-01-01		0	1	
7858	19064	2	2	1	2018-01-01		0	1	
7866	19091	2	\N	1	2018-01-01		0	1	
7874	19101	2	2	1	2018-01-01		0	1	
7882	19111	2	\N	1	2018-01-01		0	1	
7890	19131	3	2	1	2018-01-01		0	1	
7898	19158	3	\N	1	2018-01-01		0	1	
7906	19177	2	\N	1	2018-01-01		0	1	
7914	19208	3	\N	1	2018-01-01		0	1	
7922	19222	1	\N	1	2018-01-01		0	1	
7930	19255	3	2	1	2018-01-01		0	1	
7938	19275	3	2	1	2018-01-01		0	1	
7946	19292	2	\N	1	2018-01-01		0	1	
7954	19308	2	\N	1	2018-01-01		0	1	
7962	19319	\N	2	1	2018-01-01		0	1	
7970	19345	2	\N	1	2018-01-01		0	1	
7978	19360	1	\N	1	2018-01-01		0	1	
7986	19379	3	\N	1	2018-01-01		0	1	
7994	19390	3	7	1	2018-01-01		0	1	
8002	19412	3	\N	1	2018-01-01		0	1	
8010	19428	3	1	1	2018-01-01		0	1	
8018	19449	3	2	1	2018-01-01		0	1	
8026	19463	2	2	1	2018-01-01		0	1	
8034	19490	2	\N	1	2018-01-01		0	1	
8042	19511	3	2	1	2018-01-01		0	1	
8050	19533	3	\N	1	2018-01-01		0	1	
8058	19545	2	\N	1	2018-01-01		0	1	
8066	19562	2	\N	1	2018-01-01		0	1	
8074	19579	3	\N	1	2018-01-01		0	1	
8082	19593	2	\N	1	2018-01-01		0	1	
8090	19609	1	\N	1	2018-01-01		0	1	
8098	19628	2	1	1	2018-01-01		0	1	
7611	18429	1	\N	1	2018-01-01		0	1	
7619	18446	2	2	1	2018-01-01		0	1	
7627	18463	3	\N	1	2018-01-01		0	1	
7635	18485	2	\N	1	2018-01-01		0	1	
7643	18505	3	\N	1	2018-01-01		0	1	
7651	18520	2	1	1	2018-01-01		0	1	
7659	18540	2	\N	1	2018-01-01		0	1	
7667	18559	2	\N	1	2018-01-01		0	1	
7675	18588	2	\N	1	2018-01-01		0	1	
7683	18610	2	2	1	2018-01-01		0	1	
7691	18640	2	\N	1	2018-01-01		0	1	
7699	18658	3	2	1	2018-01-01		0	1	
7707	18688	3	\N	1	2018-01-01		0	1	
7715	18711	3	2	1	2018-01-01		0	1	
7723	18726	2	\N	1	2018-01-01		0	1	
7731	18739	3	2	1	2018-01-01		0	1	
7739	18761	3	2	1	2018-01-01		0	1	
7747	18781	2	2	1	2018-01-01		0	1	
7755	18795	2	2	1	2018-01-01		0	1	
7763	18824	2	\N	1	2018-01-01		0	1	
7771	18845	2	2	1	2018-01-01		0	1	
7779	18864	3	1	1	2018-01-01		0	1	
7787	18879	2	\N	1	2018-01-01		0	1	
7795	18904	2	\N	1	2018-01-01		0	1	
7803	18928	3	\N	1	2018-01-01		0	1	
7811	18939	2	\N	1	2018-01-01		0	1	
7819	18952	2	2	1	2018-01-01		0	1	
7827	18981	3	7	1	2018-01-01		0	1	
7835	19003	3	\N	1	2018-01-01		0	1	
7843	19032	3	\N	1	2018-01-01		0	1	
7851	19048	3	\N	1	2018-01-01		0	1	
7859	19070	2	2	1	2018-01-01		0	1	
7867	19092	3	\N	1	2018-01-01		0	1	
7875	19103	2	\N	1	2018-01-01		0	1	
7883	19113	2	\N	1	2018-01-01		0	1	
7891	19135	3	6	1	2018-01-01		0	1	
7899	19159	2	2	1	2018-01-01		0	1	
7907	19178	2	1	1	2018-01-01		0	1	
7915	19213	2	\N	1	2018-01-01		0	1	
7923	19224	3	\N	1	2018-01-01		0	1	
7931	19258	3	\N	1	2018-01-01		0	1	
7939	19282	3	\N	1	2018-01-01		0	1	
7947	19296	1	\N	1	2018-01-01		0	1	
7955	19309	2	\N	1	2018-01-01		0	1	
7963	19322	2	\N	1	2018-01-01		0	1	
7971	19346	2	\N	1	2018-01-01		0	1	
7979	19365	3	2	1	2018-01-01		0	1	
7987	19380	3	6	1	2018-01-01		0	1	
7995	19400	1	\N	1	2018-01-01		0	1	
8003	19416	2	\N	1	2018-01-01		0	1	
8011	19429	2	\N	1	2018-01-01		0	1	
8019	19450	2	\N	1	2018-01-01		0	1	
8027	19465	3	\N	1	2018-01-01		0	1	
8035	19493	3	2	1	2018-01-01		0	1	
8043	19514	2	\N	1	2018-01-01		0	1	
8051	19534	3	2	1	2018-01-01		0	1	
8059	19546	3	\N	1	2018-01-01		0	1	
8067	19565	2	\N	1	2018-01-01		0	1	
8075	19581	3	6	1	2018-01-01		0	1	
8083	19594	2	\N	1	2018-01-01		0	1	
8091	19615	2	\N	1	2018-01-01		0	1	
8099	19630	2	\N	1	2018-01-01		0	1	
8107	19648	3	2	1	2018-01-01		0	1	
8115	19663	2	\N	1	2018-01-01		0	1	
8123	19682	3	\N	1	2018-01-01		0	1	
8131	19708	2	\N	1	2018-01-01		0	1	
8139	19723	2	\N	1	2018-01-01		0	1	
8147	19752	1	\N	1	2018-01-01		0	1	
8155	19777	3	\N	1	2018-01-01		0	1	
8163	19794	2	\N	1	2018-01-01		0	1	
8171	19821	3	\N	1	2018-01-01		0	1	
8179	19843	3	2	1	2018-01-01		0	1	
8187	19859	2	\N	1	2018-01-01		0	1	
8195	19872	3	2	1	2018-01-01		0	1	
8203	19891	2	\N	1	2018-01-01		0	1	
8211	19912	3	2	1	2018-01-01		0	1	
8219	19947	3	2	1	2018-01-01		0	1	
8227	19956	3	5	1	2018-01-01		0	1	
8235	19971	1	2	1	2018-01-01		0	1	
8243	19985	3	2	1	2018-01-01		0	1	
8251	20005	3	2	1	2018-01-01		0	1	
8259	20020	2	2	1	2018-01-01		0	1	
8267	20039	2	2	1	2018-01-01		0	1	
8275	20057	2	\N	1	2018-01-01		0	1	
8283	20091	3	\N	1	2018-01-01		0	1	
8291	20119	2	\N	1	2018-01-01		0	1	
8299	20130	3	\N	1	2018-01-01		0	1	
8307	20140	3	2	1	2018-01-01		0	1	
8315	20163	2	\N	1	2018-01-01		0	1	
8323	20174	2	\N	1	2018-01-01		0	1	
8331	20194	3	5	1	2018-01-01		0	1	
8339	20217	1	\N	1	2018-01-01		0	1	
8347	20236	2	\N	1	2018-01-01		0	1	
8355	20251	2	\N	1	2018-01-01		0	1	
8363	20269	3	2	1	2018-01-01		0	1	
8371	20289	3	\N	1	2018-01-01		0	1	
8379	20305	3	2	1	2018-01-01		0	1	
8387	20333	2	\N	1	2018-01-01		0	1	
8395	20351	2	\N	1	2018-01-01		0	1	
8403	20379	3	6	1	2018-01-01		0	1	
8411	20397	2	\N	1	2018-01-01		0	1	
8419	20412	2	\N	1	2018-01-01		0	1	
8427	20425	3	\N	1	2018-01-01		0	1	
8435	20445	1	2	1	2018-01-01		0	1	
8443	20463	2	\N	1	2018-01-01		0	1	
8451	20483	3	2	1	2018-01-01		0	1	
8459	20497	3	4	1	2018-01-01		0	1	
8467	20510	3	6	1	2018-01-01		0	1	
8475	20539	3	\N	1	2018-01-01		0	1	
8483	20547	2	\N	1	2018-01-01		0	1	
8491	20574	3	\N	1	2018-01-01		0	1	
8499	20595	3	2	1	2018-01-01		0	1	
7949	19299	2	1	1	2018-01-01		0	1	
7957	19311	2	\N	1	2018-01-01		0	1	
7965	19329	3	7	1	2018-01-01		0	1	
7973	19350	1	2	1	2018-01-01		0	1	
7981	19373	2	2	1	2018-01-01		0	1	
7989	19383	\N	2	1	2018-01-01		0	1	
7997	19406	3	\N	1	2018-01-01		0	1	
8005	19418	2	\N	1	2018-01-01		0	1	
8013	19432	3	\N	1	2018-01-01		0	1	
8021	19455	2	\N	1	2018-01-01		0	1	
8029	19476	2	\N	1	2018-01-01		0	1	
8037	19497	3	\N	1	2018-01-01		0	1	
8045	19516	2	\N	1	2018-01-01		0	1	
8053	19537	2	\N	1	2018-01-01		0	1	
8061	19548	3	\N	1	2018-01-01		0	1	
8069	19568	3	2	1	2018-01-01		0	1	
8077	19583	3	\N	1	2018-01-01		0	1	
8085	19600	3	2	1	2018-01-01		0	1	
8093	19620	3	\N	1	2018-01-01		0	1	
8101	19635	3	\N	1	2018-01-01		0	1	
8109	19651	2	2	1	2018-01-01		0	1	
8117	19675	3	2	1	2018-01-01		0	1	
8125	19685	2	\N	1	2018-01-01		0	1	
8133	19711	3	2	1	2018-01-01		0	1	
8141	19730	2	\N	1	2018-01-01		0	1	
8149	19766	2	\N	1	2018-01-01		0	1	
8157	19781	2	\N	1	2018-01-01		0	1	
8165	19797	3	\N	1	2018-01-01		0	1	
8173	19825	2	\N	1	2018-01-01		0	1	
8181	19845	3	6	1	2018-01-01		0	1	
8189	19864	3	4	1	2018-01-01		0	1	
8197	19876	2	\N	1	2018-01-01		0	1	
8205	19898	1	\N	1	2018-01-01		0	1	
8213	19917	2	2	1	2018-01-01		0	1	
8221	19950	3	2	1	2018-01-01		0	1	
8229	19959	2	\N	1	2018-01-01		0	1	
8237	19974	3	2	1	2018-01-01		0	1	
8245	19989	3	6	1	2018-01-01		0	1	
8253	20010	2	\N	1	2018-01-01		0	1	
8261	20024	3	2	1	2018-01-01		0	1	
8269	20043	3	2	1	2018-01-01		0	1	
8277	20067	3	\N	1	2018-01-01		0	1	
8285	20094	2	\N	1	2018-01-01		0	1	
8293	20123	3	2	1	2018-01-01		0	1	
8301	20132	2	1	1	2018-01-01		0	1	
8309	20143	3	2	1	2018-01-01		0	1	
8317	20166	2	2	1	2018-01-01		0	1	
8325	20176	1	\N	1	2018-01-01		0	1	
8333	20197	3	2	1	2018-01-01		0	1	
8341	20222	2	\N	1	2018-01-01		0	1	
8349	20240	3	2	1	2018-01-01		0	1	
8357	20260	2	1	1	2018-01-01		0	1	
8365	20276	3	2	1	2018-01-01		0	1	
8373	20292	3	\N	1	2018-01-01		0	1	
8381	20318	3	2	1	2018-01-01		0	1	
8389	20340	3	\N	1	2018-01-01		0	1	
8397	20359	1	\N	1	2018-01-01		0	1	
8405	20387	2	\N	1	2018-01-01		0	1	
8413	20399	2	\N	1	2018-01-01		0	1	
8421	20418	2	\N	1	2018-01-01		0	1	
8429	20429	2	\N	1	2018-01-01		0	1	
8437	20447	2	\N	1	2018-01-01		0	1	
8445	20465	2	\N	1	2018-01-01		0	1	
8453	20486	3	2	1	2018-01-01		0	1	
8461	20502	2	\N	1	2018-01-01		0	1	
8469	20522	2	\N	1	2018-01-01		0	1	
8477	20541	3	\N	1	2018-01-01		0	1	
8485	20555	3	2	1	2018-01-01		0	1	
8493	20580	2	\N	1	2018-01-01		0	1	
8501	20597	3	\N	1	2018-01-01		0	1	
8509	20610	2	\N	1	2018-01-01		0	1	
8517	20631	3	\N	1	2018-01-01		0	1	
8525	20644	2	2	1	2018-01-01		0	1	
8533	20672	3	2	1	2018-01-01		0	1	
8541	20697	2	\N	1	2018-01-01		0	1	
8549	20717	2	\N	1	2018-01-01		0	1	
8557	20732	3	2	1	2018-01-01		0	1	
8565	20748	2	\N	1	2018-01-01		0	1	
8573	20767	3	2	1	2018-01-01		0	1	
8581	20784	3	\N	1	2018-01-01		0	1	
8589	20815	3	\N	1	2018-01-01		0	1	
8597	20832	2	\N	1	2018-01-01		0	1	
8605	20852	2	\N	1	2018-01-01		0	1	
8613	20875	3	2	1	2018-01-01		0	1	
8621	20892	3	2	1	2018-01-01		0	1	
8629	20913	2	\N	1	2018-01-01		0	1	
8637	20927	3	6	1	2018-01-01		0	1	
8645	20942	1	2	1	2018-01-01		0	1	
8653	20959	3	2	1	2018-01-01		0	1	
8661	20981	3	\N	1	2018-01-01		0	1	
8669	20998	2	\N	1	2018-01-01		0	1	
8677	21017	2	\N	1	2018-01-01		0	1	
8685	21035	3	\N	1	2018-01-01		0	1	
8693	21050	2	2	1	2018-01-01		0	1	
8701	21070	2	\N	1	2018-01-01		0	1	
8709	21089	2	\N	1	2018-01-01		0	1	
8717	21112	2	\N	1	2018-01-01		0	1	
8725	21134	3	1	1	2018-01-01		0	1	
8733	21158	3	\N	1	2018-01-01		0	1	
8741	21187	3	2	1	2018-01-01		0	1	
8749	21205	3	2	1	2018-01-01		0	1	
8757	21221	3	\N	1	2018-01-01		0	1	
8765	21236	3	2	1	2018-01-01		0	1	
8773	21256	2	\N	1	2018-01-01		0	1	
8781	21271	3	\N	1	2018-01-01		0	1	
8789	21295	2	\N	1	2018-01-01		0	1	
8797	21310	3	2	1	2018-01-01		0	1	
8805	21343	2	2	1	2018-01-01		0	1	
8813	21363	2	\N	1	2018-01-01		0	1	
8821	21401	1	\N	1	2018-01-01		0	1	
8829	21418	2	\N	1	2018-01-01		0	1	
8837	21449	2	\N	1	2018-01-01		0	1	
7662	18548	\N	2	1	2018-01-01		0	1	
7670	18567	2	2	1	2018-01-01		0	1	
7678	18594	2	1	1	2018-01-01		0	1	
7686	18615	3	7	1	2018-01-01		0	1	
7694	18645	3	\N	1	2018-01-01		0	1	
7702	18672	2	2	1	2018-01-01		0	1	
7710	18696	3	5	1	2018-01-01		0	1	
7718	18717	2	\N	1	2018-01-01		0	1	
7726	18731	2	\N	1	2018-01-01		0	1	
7734	18752	2	\N	1	2018-01-01		0	1	
7742	18768	2	2	1	2018-01-01		0	1	
7750	18784	2	2	1	2018-01-01		0	1	
7758	18803	3	\N	1	2018-01-01		0	1	
7766	18832	2	\N	1	2018-01-01		0	1	
7774	18850	3	2	1	2018-01-01		0	1	
7782	18870	3	2	1	2018-01-01		0	1	
7790	18894	3	1	1	2018-01-01		0	1	
7798	18913	2	\N	1	2018-01-01		0	1	
7806	18934	2	\N	1	2018-01-01		0	1	
7814	18943	3	1	1	2018-01-01		0	1	
7822	18961	2	2	1	2018-01-01		0	1	
7830	18988	2	\N	1	2018-01-01		0	1	
7838	19012	2	\N	1	2018-01-01		0	1	
7846	19040	3	\N	1	2018-01-01		0	1	
7854	19055	3	6	1	2018-01-01		0	1	
7862	19076	2	4	1	2018-01-01		0	1	
7870	19095	2	\N	1	2018-01-01		0	1	
7878	19107	2	\N	1	2018-01-01		0	1	
7886	19118	2	\N	1	2018-01-01		0	1	
7894	19149	2	\N	1	2018-01-01		0	1	
7902	19167	3	1	1	2018-01-01		0	1	
7910	19191	3	\N	1	2018-01-01		0	1	
7918	19216	2	\N	1	2018-01-01		0	1	
7926	19239	3	2	1	2018-01-01		0	1	
7934	19264	2	2	1	2018-01-01		0	1	
7942	19286	1	\N	1	2018-01-01		0	1	
7950	19300	2	\N	1	2018-01-01		0	1	
7958	19313	2	\N	1	2018-01-01		0	1	
7966	19331	3	2	1	2018-01-01		0	1	
7974	19351	2	\N	1	2018-01-01		0	1	
7982	19375	3	2	1	2018-01-01		0	1	
7990	19385	3	6	1	2018-01-01		0	1	
7998	19408	3	\N	1	2018-01-01		0	1	
8006	19422	3	2	1	2018-01-01		0	1	
8014	19436	3	2	1	2018-01-01		0	1	
8022	19456	2	2	1	2018-01-01		0	1	
8030	19477	2	1	1	2018-01-01		0	1	
8038	19498	2	\N	1	2018-01-01		0	1	
8046	19520	3	2	1	2018-01-01		0	1	
8054	19538	2	\N	1	2018-01-01		0	1	
8062	19558	2	\N	1	2018-01-01		0	1	
8070	19571	2	2	1	2018-01-01		0	1	
8078	19584	3	2	1	2018-01-01		0	1	
8086	19601	2	\N	1	2018-01-01		0	1	
8094	19622	2	\N	1	2018-01-01		0	1	
8102	19637	3	\N	1	2018-01-01		0	1	
8110	19655	2	1	1	2018-01-01		0	1	
8118	19676	3	6	1	2018-01-01		0	1	
8126	19695	3	6	1	2018-01-01		0	1	
8134	19714	3	2	1	2018-01-01		0	1	
8142	19734	3	6	1	2018-01-01		0	1	
8150	19767	3	2	1	2018-01-01		0	1	
8158	19783	2	\N	1	2018-01-01		0	1	
8166	19804	2	2	1	2018-01-01		0	1	
8174	19827	3	2	1	2018-01-01		0	1	
8182	19847	3	\N	1	2018-01-01		0	1	
8190	19865	2	\N	1	2018-01-01		0	1	
8198	19882	3	2	1	2018-01-01		0	1	
8206	19906	2	\N	1	2018-01-01		0	1	
8214	19924	2	\N	1	2018-01-01		0	1	
8222	19951	3	\N	1	2018-01-01		0	1	
8230	19960	3	2	1	2018-01-01		0	1	
8238	19976	2	\N	1	2018-01-01		0	1	
8246	19995	3	\N	1	2018-01-01		0	1	
8254	20011	1	\N	1	2018-01-01		0	1	
8262	20029	2	\N	1	2018-01-01		0	1	
8270	20045	3	2	1	2018-01-01		0	1	
8278	20076	3	\N	1	2018-01-01		0	1	
8286	20100	2	\N	1	2018-01-01		0	1	
8294	20124	2	\N	1	2018-01-01		0	1	
8302	20134	3	6	1	2018-01-01		0	1	
8310	20146	3	2	1	2018-01-01		0	1	
8318	20167	3	2	1	2018-01-01		0	1	
8326	20178	2	1	1	2018-01-01		0	1	
8334	20201	1	\N	1	2018-01-01		0	1	
8342	20225	3	\N	1	2018-01-01		0	1	
8350	20241	3	\N	1	2018-01-01		0	1	
8358	20263	3	2	1	2018-01-01		0	1	
8366	20278	3	\N	1	2018-01-01		0	1	
8374	20293	3	2	1	2018-01-01		0	1	
8382	20320	2	\N	1	2018-01-01		0	1	
8390	20342	3	\N	1	2018-01-01		0	1	
8398	20360	2	\N	1	2018-01-01		0	1	
8406	20389	3	\N	1	2018-01-01		0	1	
8414	20400	2	\N	1	2018-01-01		0	1	
8422	20419	2	\N	1	2018-01-01		0	1	
8430	20433	3	6	1	2018-01-01		0	1	
8438	20452	3	2	1	2018-01-01		0	1	
8446	20466	2	\N	1	2018-01-01		0	1	
8454	20489	2	2	1	2018-01-01		0	1	
8462	20504	2	\N	1	2018-01-01		0	1	
8470	20523	2	\N	1	2018-01-01		0	1	
8478	20542	2	2	1	2018-01-01		0	1	
8486	20560	2	\N	1	2018-01-01		0	1	
8494	20581	2	2	1	2018-01-01		0	1	
8502	20599	2	\N	1	2018-01-01		0	1	
8510	20611	2	\N	1	2018-01-01		0	1	
8518	20632	3	1	1	2018-01-01		0	1	
8526	20646	3	\N	1	2018-01-01		0	1	
8534	20676	3	2	1	2018-01-01		0	1	
8542	20699	3	\N	1	2018-01-01		0	1	
8550	20719	2	2	1	2018-01-01		0	1	
8845	21473	3	2	1	2018-01-01		0	1	
7983	19376	3	2	1	2018-01-01		0	1	
7991	19387	2	\N	1	2018-01-01		0	1	
7999	19409	2	\N	1	2018-01-01		0	1	
8007	19424	2	\N	1	2018-01-01		0	1	
8015	19438	3	6	1	2018-01-01		0	1	
8023	19458	2	\N	1	2018-01-01		0	1	
8031	19478	3	2	1	2018-01-01		0	1	
8039	19504	2	\N	1	2018-01-01		0	1	
8047	19524	2	\N	1	2018-01-01		0	1	
8055	19539	2	\N	1	2018-01-01		0	1	
8063	19559	3	\N	1	2018-01-01		0	1	
8071	19572	2	2	1	2018-01-01		0	1	
8079	19585	3	2	1	2018-01-01		0	1	
8087	19603	2	\N	1	2018-01-01		0	1	
8095	19623	2	\N	1	2018-01-01		0	1	
8103	19639	3	\N	1	2018-01-01		0	1	
8111	19656	3	6	1	2018-01-01		0	1	
8119	19677	2	\N	1	2018-01-01		0	1	
8127	19697	3	\N	1	2018-01-01		0	1	
8135	19715	2	\N	1	2018-01-01		0	1	
8143	19742	2	\N	1	2018-01-01		0	1	
8151	19769	2	2	1	2018-01-01		0	1	
8159	19785	1	2	1	2018-01-01		0	1	
8167	19806	3	2	1	2018-01-01		0	1	
8175	19832	2	2	1	2018-01-01		0	1	
8183	19849	2	\N	1	2018-01-01		0	1	
8191	19867	2	\N	1	2018-01-01		0	1	
8199	19886	3	\N	1	2018-01-01		0	1	
8207	19907	2	\N	1	2018-01-01		0	1	
8215	19933	1	\N	1	2018-01-01		0	1	
8223	19952	1	\N	1	2018-01-01		0	1	
8231	19961	3	2	1	2018-01-01		0	1	
8239	19977	3	6	1	2018-01-01		0	1	
8247	19997	2	2	1	2018-01-01		0	1	
8255	20014	3	\N	1	2018-01-01		0	1	
8263	20033	3	2	1	2018-01-01		0	1	
8271	20048	2	\N	1	2018-01-01		0	1	
8279	20079	3	\N	1	2018-01-01		0	1	
8287	20102	2	2	1	2018-01-01		0	1	
8295	20126	1	\N	1	2018-01-01		0	1	
8303	20135	3	\N	1	2018-01-01		0	1	
8311	20149	2	\N	1	2018-01-01		0	1	
8319	20169	2	2	1	2018-01-01		0	1	
8327	20179	2	\N	1	2018-01-01		0	1	
8335	20204	2	1	1	2018-01-01		0	1	
8343	20227	2	\N	1	2018-01-01		0	1	
8351	20243	2	\N	1	2018-01-01		0	1	
8359	20264	1	2	1	2018-01-01		0	1	
8367	20280	2	\N	1	2018-01-01		0	1	
8375	20294	3	\N	1	2018-01-01		0	1	
8383	20323	3	\N	1	2018-01-01		0	1	
8391	20345	2	\N	1	2018-01-01		0	1	
8399	20368	2	\N	1	2018-01-01		0	1	
8407	20391	2	2	1	2018-01-01		0	1	
8415	20402	3	\N	1	2018-01-01		0	1	
8423	20420	2	\N	1	2018-01-01		0	1	
8431	20436	2	\N	1	2018-01-01		0	1	
8439	20453	3	1	1	2018-01-01		0	1	
8447	20471	2	\N	1	2018-01-01		0	1	
8455	20492	3	2	1	2018-01-01		0	1	
8463	20506	2	\N	1	2018-01-01		0	1	
8471	20525	3	\N	1	2018-01-01		0	1	
8479	20543	3	2	1	2018-01-01		0	1	
8487	20561	2	\N	1	2018-01-01		0	1	
8495	20586	2	2	1	2018-01-01		0	1	
8503	20600	3	\N	1	2018-01-01		0	1	
8511	20619	2	\N	1	2018-01-01		0	1	
8519	20633	3	2	1	2018-01-01		0	1	
8527	20657	2	\N	1	2018-01-01		0	1	
8535	20683	2	\N	1	2018-01-01		0	1	
8543	20703	2	\N	1	2018-01-01		0	1	
8551	20720	2	2	1	2018-01-01		0	1	
8559	20734	3	\N	1	2018-01-01		0	1	
8567	20750	2	1	1	2018-01-01		0	1	
8575	20773	3	\N	1	2018-01-01		0	1	
8583	20791	3	2	1	2018-01-01		0	1	
8591	20823	3	2	1	2018-01-01		0	1	
8599	20834	2	2	1	2018-01-01		0	1	
8607	20859	2	\N	1	2018-01-01		0	1	
8615	20879	3	2	1	2018-01-01		0	1	
8623	20898	2	\N	1	2018-01-01		0	1	
8631	20916	1	\N	1	2018-01-01		0	1	
8639	20930	2	\N	1	2018-01-01		0	1	
8647	20946	1	\N	1	2018-01-01		0	1	
8655	20961	2	2	1	2018-01-01		0	1	
8663	20985	2	\N	1	2018-01-01		0	1	
8671	21003	1	2	1	2018-01-01		0	1	
8679	21025	2	2	1	2018-01-01		0	1	
8687	21039	2	\N	1	2018-01-01		0	1	
8695	21053	3	\N	1	2018-01-01		0	1	
8703	21072	3	2	1	2018-01-01		0	1	
8711	21091	2	\N	1	2018-01-01		0	1	
8719	21118	2	2	1	2018-01-01		0	1	
8727	21144	3	2	1	2018-01-01		0	1	
8735	21177	3	2	1	2018-01-01		0	1	
8743	21190	3	\N	1	2018-01-01		0	1	
8751	21207	2	\N	1	2018-01-01		0	1	
8759	21224	3	\N	1	2018-01-01		0	1	
8767	21239	1	\N	1	2018-01-01		0	1	
8775	21261	2	2	1	2018-01-01		0	1	
8783	21274	3	6	1	2018-01-01		0	1	
8791	21300	2	\N	1	2018-01-01		0	1	
8799	21315	2	\N	1	2018-01-01		0	1	
8807	21351	\N	2	1	2018-01-01		0	1	
8815	21369	3	5	1	2018-01-01		0	1	
8823	21403	2	2	1	2018-01-01		0	1	
8831	21426	3	4	1	2018-01-01		0	1	
8839	21455	2	\N	1	2018-01-01		0	1	
8847	21476	3	\N	1	2018-01-01		0	1	
8855	21497	3	7	1	2018-01-01		0	1	
8863	21513	3	2	1	2018-01-01		0	1	
8871	21524	3	2	1	2018-01-01		0	1	
8106	19646	2	\N	1	2018-01-01		0	1	
8114	19659	2	\N	1	2018-01-01		0	1	
8122	19681	2	\N	1	2018-01-01		0	1	
8130	19705	3	2	1	2018-01-01		0	1	
8138	19722	1	\N	1	2018-01-01		0	1	
8146	19751	2	\N	1	2018-01-01		0	1	
8154	19774	2	\N	1	2018-01-01		0	1	
8162	19791	3	\N	1	2018-01-01		0	1	
8170	19818	2	\N	1	2018-01-01		0	1	
8178	19840	1	\N	1	2018-01-01		0	1	
8186	19855	2	\N	1	2018-01-01		0	1	
8194	19870	3	\N	1	2018-01-01		0	1	
8202	19890	2	\N	1	2018-01-01		0	1	
8210	19911	3	2	1	2018-01-01		0	1	
8218	19942	3	1	1	2018-01-01		0	1	
8226	19955	3	2	1	2018-01-01		0	1	
8234	19970	3	2	1	2018-01-01		0	1	
8242	19984	2	\N	1	2018-01-01		0	1	
8250	20004	1	\N	1	2018-01-01		0	1	
8258	20017	3	2	1	2018-01-01		0	1	
8266	20038	2	\N	1	2018-01-01		0	1	
8274	20056	2	\N	1	2018-01-01		0	1	
8282	20087	\N	7	1	2018-01-01		0	1	
8290	20107	3	2	1	2018-01-01		0	1	
8298	20129	2	\N	1	2018-01-01		0	1	
8306	20139	3	4	1	2018-01-01		0	1	
8314	20158	3	\N	1	2018-01-01		0	1	
8322	20173	2	\N	1	2018-01-01		0	1	
8330	20193	3	2	1	2018-01-01		0	1	
8338	20215	3	\N	1	2018-01-01		0	1	
8346	20231	2	\N	1	2018-01-01		0	1	
8354	20249	3	\N	1	2018-01-01		0	1	
8362	20267	3	2	1	2018-01-01		0	1	
8370	20288	2	2	1	2018-01-01		0	1	
8378	20304	1	\N	1	2018-01-01		0	1	
8386	20330	2	\N	1	2018-01-01		0	1	
8394	20349	3	2	1	2018-01-01		0	1	
8402	20375	2	\N	1	2018-01-01		0	1	
8410	20396	2	\N	1	2018-01-01		0	1	
8418	20408	1	\N	1	2018-01-01		0	1	
8426	20423	2	\N	1	2018-01-01		0	1	
8434	20444	1	2	1	2018-01-01		0	1	
8442	20460	2	\N	1	2018-01-01		0	1	
8450	20480	2	\N	1	2018-01-01		0	1	
8458	20496	1	\N	1	2018-01-01		0	1	
8466	20509	2	\N	1	2018-01-01		0	1	
8474	20532	2	2	1	2018-01-01		0	1	
8482	20546	2	1	1	2018-01-01		0	1	
8490	20572	2	1	1	2018-01-01		0	1	
8498	20591	3	2	1	2018-01-01		0	1	
8506	20606	3	2	1	2018-01-01		0	1	
8514	20625	2	\N	1	2018-01-01		0	1	
8522	20638	2	\N	1	2018-01-01		0	1	
8530	20663	1	2	1	2018-01-01		0	1	
8538	20689	2	2	1	2018-01-01		0	1	
8546	20708	3	\N	1	2018-01-01		0	1	
8554	20723	3	2	1	2018-01-01		0	1	
8562	20743	3	2	1	2018-01-01		0	1	
8570	20760	3	\N	1	2018-01-01		0	1	
8578	20776	3	\N	1	2018-01-01		0	1	
8586	20800	2	\N	1	2018-01-01		0	1	
8594	20826	2	\N	1	2018-01-01		0	1	
8602	20842	1	\N	1	2018-01-01		0	1	
8610	20867	3	1	1	2018-01-01		0	1	
8618	20885	3	2	1	2018-01-01		0	1	
8626	20905	1	\N	1	2018-01-01		0	1	
8634	20919	2	\N	1	2018-01-01		0	1	
8642	20935	3	2	1	2018-01-01		0	1	
8650	20954	3	\N	1	2018-01-01		0	1	
8658	20966	3	6	1	2018-01-01		0	1	
8666	20994	2	2	1	2018-01-01		0	1	
8674	21010	2	2	1	2018-01-01		0	1	
8682	21031	2	\N	1	2018-01-01		0	1	
8690	21043	2	\N	1	2018-01-01		0	1	
8698	21064	2	\N	1	2018-01-01		0	1	
8706	21075	3	6	1	2018-01-01		0	1	
8714	21103	2	\N	1	2018-01-01		0	1	
8722	21124	2	\N	1	2018-01-01		0	1	
8730	21150	3	\N	1	2018-01-01		0	1	
8738	21183	3	2	1	2018-01-01		0	1	
8746	21195	2	2	1	2018-01-01		0	1	
8754	21213	3	2	1	2018-01-01		0	1	
8762	21227	3	\N	1	2018-01-01		0	1	
8770	21252	2	2	1	2018-01-01		0	1	
8778	21266	3	2	1	2018-01-01		0	1	
8786	21279	3	\N	1	2018-01-01		0	1	
8794	21303	2	2	1	2018-01-01		0	1	
8802	21334	3	\N	1	2018-01-01		0	1	
8810	21360	3	2	1	2018-01-01		0	1	
8818	21383	2	\N	1	2018-01-01		0	1	
8826	21411	2	\N	1	2018-01-01		0	1	
8834	21431	3	6	1	2018-01-01		0	1	
8842	21468	2	\N	1	2018-01-01		0	1	
8850	21487	2	\N	1	2018-01-01		0	1	
8858	21503	1	\N	1	2018-01-01		0	1	
8866	21518	2	\N	1	2018-01-01		0	1	
8874	21533	2	\N	1	2018-01-01		0	1	
8882	21552	3	2	1	2018-01-01		0	1	
8890	21563	3	\N	1	2018-01-01		0	1	
8898	21595	3	\N	1	2018-01-01		0	1	
8906	21615	2	2	1	2018-01-01		0	1	
8914	21641	2	\N	1	2018-01-01		0	1	
8922	21667	3	6	1	2018-01-01		0	1	
8930	21688	2	\N	1	2018-01-01		0	1	
8938	21714	3	\N	1	2018-01-01		0	1	
8946	21726	3	6	1	2018-01-01		0	1	
8954	21746	2	2	1	2018-01-01		0	1	
8962	21759	1	\N	1	2018-01-01		0	1	
8970	21775	2	\N	1	2018-01-01		0	1	
8978	21804	3	2	1	2018-01-01		0	1	
8986	21822	2	\N	1	2018-01-01		0	1	
8994	21839	2	\N	1	2018-01-01		0	1	
8507	20607	3	\N	1	2018-01-01		0	1	
8515	20626	2	2	1	2018-01-01		0	1	
8523	20639	2	\N	1	2018-01-01		0	1	
8531	20667	3	2	1	2018-01-01		0	1	
8539	20694	2	\N	1	2018-01-01		0	1	
8547	20709	2	\N	1	2018-01-01		0	1	
8555	20724	3	\N	1	2018-01-01		0	1	
8563	20744	3	\N	1	2018-01-01		0	1	
8571	20762	2	\N	1	2018-01-01		0	1	
8579	20777	2	\N	1	2018-01-01		0	1	
8587	20804	2	\N	1	2018-01-01		0	1	
8595	20827	2	\N	1	2018-01-01		0	1	
8603	20847	2	\N	1	2018-01-01		0	1	
8611	20871	3	\N	1	2018-01-01		0	1	
8619	20886	3	\N	1	2018-01-01		0	1	
8627	20906	2	\N	1	2018-01-01		0	1	
8635	20921	3	\N	1	2018-01-01		0	1	
8643	20938	3	7	1	2018-01-01		0	1	
8651	20955	3	2	1	2018-01-01		0	1	
8659	20967	2	\N	1	2018-01-01		0	1	
8667	20995	3	\N	1	2018-01-01		0	1	
8675	21012	2	\N	1	2018-01-01		0	1	
8683	21032	2	2	1	2018-01-01		0	1	
8691	21044	2	\N	1	2018-01-01		0	1	
8699	21065	3	1	1	2018-01-01		0	1	
8707	21076	2	\N	1	2018-01-01		0	1	
8715	21104	2	\N	1	2018-01-01		0	1	
8723	21127	1	\N	1	2018-01-01		0	1	
8731	21151	3	\N	1	2018-01-01		0	1	
8739	21184	2	\N	1	2018-01-01		0	1	
8747	21199	2	\N	1	2018-01-01		0	1	
8755	21214	3	\N	1	2018-01-01		0	1	
8763	21230	2	\N	1	2018-01-01		0	1	
8771	21254	2	\N	1	2018-01-01		0	1	
8779	21267	2	1	1	2018-01-01		0	1	
8787	21282	2	\N	1	2018-01-01		0	1	
8795	21308	3	\N	1	2018-01-01		0	1	
8803	21337	2	\N	1	2018-01-01		0	1	
8811	21361	2	\N	1	2018-01-01		0	1	
8819	21386	3	\N	1	2018-01-01		0	1	
8827	21412	2	\N	1	2018-01-01		0	1	
8835	21437	2	1	1	2018-01-01		0	1	
8843	21471	2	\N	1	2018-01-01		0	1	
8851	21490	2	\N	1	2018-01-01		0	1	
8859	21504	3	\N	1	2018-01-01		0	1	
8867	21519	3	\N	1	2018-01-01		0	1	
8875	21537	2	\N	1	2018-01-01		0	1	
8883	21553	3	\N	1	2018-01-01		0	1	
8891	21572	1	2	1	2018-01-01		0	1	
8899	21596	3	2	1	2018-01-01		0	1	
8907	21618	2	\N	1	2018-01-01		0	1	
8915	21646	2	1	1	2018-01-01		0	1	
8923	21673	3	\N	1	2018-01-01		0	1	
8931	21690	3	\N	1	2018-01-01		0	1	
8939	21715	3	2	1	2018-01-01		0	1	
8947	21732	\N	4	1	2018-01-01		0	1	
8955	21748	2	\N	1	2018-01-01		0	1	
8963	21760	1	\N	1	2018-01-01		0	1	
8971	21778	3	\N	1	2018-01-01		0	1	
8979	21805	2	\N	1	2018-01-01		0	1	
8987	21828	3	\N	1	2018-01-01		0	1	
8995	21847	2	\N	1	2018-01-01		0	1	
9003	21865	2	\N	1	2018-01-01		0	1	
9011	21887	3	\N	1	2018-01-01		0	1	
9019	21906	2	\N	1	2018-01-01		0	1	
9027	21924	2	\N	1	2018-01-01		0	1	
9035	21937	2	\N	1	2018-01-01		0	1	
9043	21964	2	\N	1	2018-01-01		0	1	
9051	21984	2	\N	1	2018-01-01		0	1	
9059	21999	1	\N	1	2018-01-01		0	1	
9067	22020	2	\N	1	2018-01-01		0	1	
9075	22039	2	2	1	2018-01-01		0	1	
9083	22064	2	2	1	2018-01-01		0	1	
9091	22086	2	\N	1	2018-01-01		0	1	
9099	22102	3	2	1	2018-01-01		0	1	
9107	22118	2	\N	1	2018-01-01		0	1	
9115	22151	2	\N	1	2018-01-01		0	1	
9123	22170	3	2	1	2018-01-01		0	1	
9131	22186	3	\N	1	2018-01-01		0	1	
9139	22199	2	2	1	2018-01-01		0	1	
9147	22215	3	2	1	2018-01-01		0	1	
9155	22238	3	2	1	2018-01-01		0	1	
9163	22253	3	\N	1	2018-01-01		0	1	
9171	22294	1	2	1	2018-01-01		0	1	
9179	22319	1	\N	1	2018-01-01		0	1	
9187	22329	3	2	1	2018-01-01		0	1	
9195	22352	2	\N	1	2018-01-01		0	1	
9203	22368	2	\N	1	2018-01-01		0	1	
9211	22391	3	2	1	2018-01-01		0	1	
9219	22409	2	\N	1	2018-01-01		0	1	
9227	22427	2	\N	1	2018-01-01		0	1	
9235	22439	2	2	1	2018-01-01		0	1	
9243	22456	3	\N	1	2018-01-01		0	1	
9251	22472	3	\N	1	2018-01-01		0	1	
9259	22493	2	\N	1	2018-01-01		0	1	
9267	22510	3	2	1	2018-01-01		0	1	
9275	22527	3	2	1	2018-01-01		0	1	
9283	22547	2	\N	1	2018-01-01		0	1	
9291	22571	2	\N	1	2018-01-01		0	1	
9299	22587	3	1	1	2018-01-01		0	1	
9307	22605	3	\N	1	2018-01-01		0	1	
9315	22627	3	1	1	2018-01-01		0	1	
9323	22646	2	\N	1	2018-01-01		0	1	
9331	22663	3	2	1	2018-01-01		0	1	
9339	22683	2	\N	1	2018-01-01		0	1	
9347	22698	2	2	1	2018-01-01		0	1	
9355	22714	2	2	1	2018-01-01		0	1	
9363	22749	2	\N	1	2018-01-01		0	1	
9371	22760	3	2	1	2018-01-01		0	1	
9379	22774	3	2	1	2018-01-01		0	1	
8065	19561	2	\N	1	2018-01-01		0	1	
8073	19574	3	2	1	2018-01-01		0	1	
8081	19592	3	\N	1	2018-01-01		0	1	
8089	19608	3	\N	1	2018-01-01		0	1	
8097	19625	3	2	1	2018-01-01		0	1	
8105	19645	3	\N	1	2018-01-01		0	1	
8113	19658	2	\N	1	2018-01-01		0	1	
8121	19680	2	\N	1	2018-01-01		0	1	
8129	19704	2	2	1	2018-01-01		0	1	
8137	19719	2	\N	1	2018-01-01		0	1	
8145	19750	3	\N	1	2018-01-01		0	1	
8153	19773	2	2	1	2018-01-01		0	1	
8161	19790	2	\N	1	2018-01-01		0	1	
8169	19810	2	\N	1	2018-01-01		0	1	
8177	19835	3	\N	1	2018-01-01		0	1	
8185	19852	3	\N	1	2018-01-01		0	1	
8193	19869	2	\N	1	2018-01-01		0	1	
8201	19889	1	\N	1	2018-01-01		0	1	
8209	19909	2	\N	1	2018-01-01		0	1	
8217	19940	2	\N	1	2018-01-01		0	1	
8225	19954	3	6	1	2018-01-01		0	1	
8233	19966	2	\N	1	2018-01-01		0	1	
8241	19979	2	\N	1	2018-01-01		0	1	
8249	20002	2	1	1	2018-01-01		0	1	
8257	20016	3	4	1	2018-01-01		0	1	
8265	20037	2	\N	1	2018-01-01		0	1	
8273	20054	3	6	1	2018-01-01		0	1	
8281	20084	2	\N	1	2018-01-01		0	1	
8289	20105	3	2	1	2018-01-01		0	1	
8297	20128	2	2	1	2018-01-01		0	1	
8305	20137	3	\N	1	2018-01-01		0	1	
8313	20154	2	\N	1	2018-01-01		0	1	
8321	20172	3	2	1	2018-01-01		0	1	
8329	20190	2	\N	1	2018-01-01		0	1	
8337	20207	3	\N	1	2018-01-01		0	1	
8345	20229	\N	7	1	2018-01-01		0	1	
8353	20248	3	\N	1	2018-01-01		0	1	
8361	20266	3	2	1	2018-01-01		0	1	
8369	20286	2	\N	1	2018-01-01		0	1	
8377	20303	2	\N	1	2018-01-01		0	1	
8385	20327	2	\N	1	2018-01-01		0	1	
8393	20348	3	\N	1	2018-01-01		0	1	
8401	20371	3	\N	1	2018-01-01		0	1	
8409	20393	2	\N	1	2018-01-01		0	1	
8417	20405	3	2	1	2018-01-01		0	1	
8425	20422	2	\N	1	2018-01-01		0	1	
8433	20442	3	7	1	2018-01-01		0	1	
8441	20459	2	\N	1	2018-01-01		0	1	
8449	20476	2	\N	1	2018-01-01		0	1	
8457	20495	3	\N	1	2018-01-01		0	1	
8465	20508	3	6	1	2018-01-01		0	1	
8473	20531	3	2	1	2018-01-01		0	1	
8481	20545	3	\N	1	2018-01-01		0	1	
8489	20569	3	\N	1	2018-01-01		0	1	
8497	20590	2	\N	1	2018-01-01		0	1	
8505	20604	3	\N	1	2018-01-01		0	1	
8513	20622	3	7	1	2018-01-01		0	1	
8521	20637	2	2	1	2018-01-01		0	1	
8529	20662	2	\N	1	2018-01-01		0	1	
8537	20687	2	2	1	2018-01-01		0	1	
8545	20707	2	\N	1	2018-01-01		0	1	
8553	20722	2	\N	1	2018-01-01		0	1	
8561	20739	3	2	1	2018-01-01		0	1	
8569	20753	2	\N	1	2018-01-01		0	1	
8577	20775	1	\N	1	2018-01-01		0	1	
8585	20794	2	\N	1	2018-01-01		0	1	
8593	20825	2	\N	1	2018-01-01		0	1	
8601	20837	2	\N	1	2018-01-01		0	1	
8609	20862	2	\N	1	2018-01-01		0	1	
8617	20884	2	\N	1	2018-01-01		0	1	
8625	20902	2	\N	1	2018-01-01		0	1	
8633	20918	2	\N	1	2018-01-01		0	1	
8641	20932	2	2	1	2018-01-01		0	1	
8649	20953	2	1	1	2018-01-01		0	1	
8657	20964	2	\N	1	2018-01-01		0	1	
8665	20992	3	2	1	2018-01-01		0	1	
8673	21009	2	\N	1	2018-01-01		0	1	
8681	21028	3	2	1	2018-01-01		0	1	
8689	21042	2	\N	1	2018-01-01		0	1	
8697	21059	2	\N	1	2018-01-01		0	1	
8705	21074	3	2	1	2018-01-01		0	1	
8713	21096	2	2	1	2018-01-01		0	1	
8721	21123	2	\N	1	2018-01-01		0	1	
8729	21146	2	2	1	2018-01-01		0	1	
8737	21180	2	\N	1	2018-01-01		0	1	
8745	21194	2	\N	1	2018-01-01		0	1	
8753	21210	2	\N	1	2018-01-01		0	1	
8761	21226	2	\N	1	2018-01-01		0	1	
8769	21242	2	\N	1	2018-01-01		0	1	
8777	21264	2	2	1	2018-01-01		0	1	
8785	21278	2	\N	1	2018-01-01		0	1	
8793	21302	\N	7	1	2018-01-01		0	1	
8801	21328	2	2	1	2018-01-01		0	1	
8809	21359	2	\N	1	2018-01-01		0	1	
8817	21380	2	1	1	2018-01-01		0	1	
8825	21407	2	\N	1	2018-01-01		0	1	
8833	21430	3	\N	1	2018-01-01		0	1	
8841	21465	1	\N	1	2018-01-01		0	1	
8849	21479	3	2	1	2018-01-01		0	1	
8857	21501	3	2	1	2018-01-01		0	1	
8865	21516	3	\N	1	2018-01-01		0	1	
8873	21531	3	2	1	2018-01-01		0	1	
8881	21550	2	2	1	2018-01-01		0	1	
8889	21562	3	1	1	2018-01-01		0	1	
8897	21591	3	2	1	2018-01-01		0	1	
8905	21614	2	\N	1	2018-01-01		0	1	
8913	21640	2	\N	1	2018-01-01		0	1	
8921	21666	2	\N	1	2018-01-01		0	1	
8929	21687	3	7	1	2018-01-01		0	1	
8937	21712	2	\N	1	2018-01-01		0	1	
8945	21722	2	\N	1	2018-01-01		0	1	
8036	19496	2	\N	1	2018-01-01		0	1	
8044	19515	2	\N	1	2018-01-01		0	1	
8052	19535	2	2	1	2018-01-01		0	1	
8060	19547	3	2	1	2018-01-01		0	1	
8068	19566	3	6	1	2018-01-01		0	1	
8076	19582	2	\N	1	2018-01-01		0	1	
8084	19599	3	2	1	2018-01-01		0	1	
8092	19617	3	\N	1	2018-01-01		0	1	
8100	19634	1	\N	1	2018-01-01		0	1	
8108	19649	2	\N	1	2018-01-01		0	1	
8116	19667	1	\N	1	2018-01-01		0	1	
8124	19684	2	\N	1	2018-01-01		0	1	
8132	19710	2	\N	1	2018-01-01		0	1	
8140	19725	2	2	1	2018-01-01		0	1	
8148	19756	2	\N	1	2018-01-01		0	1	
8156	19780	2	\N	1	2018-01-01		0	1	
8164	19796	3	2	1	2018-01-01		0	1	
8172	19823	3	\N	1	2018-01-01		0	1	
8180	19844	3	2	1	2018-01-01		0	1	
8188	19860	2	\N	1	2018-01-01		0	1	
8196	19874	3	2	1	2018-01-01		0	1	
8204	19896	2	\N	1	2018-01-01		0	1	
8212	19916	2	\N	1	2018-01-01		0	1	
8220	19948	2	\N	1	2018-01-01		0	1	
8228	19958	\N	2	1	2018-01-01		0	1	
8236	19972	3	2	1	2018-01-01		0	1	
8244	19986	1	\N	1	2018-01-01		0	1	
8252	20009	2	\N	1	2018-01-01		0	1	
8260	20021	3	2	1	2018-01-01		0	1	
8268	20041	2	4	1	2018-01-01		0	1	
8276	20065	3	4	1	2018-01-01		0	1	
8284	20092	2	\N	1	2018-01-01		0	1	
8292	20122	3	2	1	2018-01-01		0	1	
8300	20131	2	\N	1	2018-01-01		0	1	
8308	20141	2	\N	1	2018-01-01		0	1	
8316	20164	3	2	1	2018-01-01		0	1	
8324	20175	2	1	1	2018-01-01		0	1	
8332	20195	2	\N	1	2018-01-01		0	1	
8340	20219	3	\N	1	2018-01-01		0	1	
8348	20237	2	\N	1	2018-01-01		0	1	
8356	20254	3	\N	1	2018-01-01		0	1	
8364	20274	2	1	1	2018-01-01		0	1	
8372	20290	3	2	1	2018-01-01		0	1	
8380	20313	2	\N	1	2018-01-01		0	1	
8388	20337	2	\N	1	2018-01-01		0	1	
8396	20358	2	\N	1	2018-01-01		0	1	
8404	20381	1	\N	1	2018-01-01		0	1	
8412	20398	3	\N	1	2018-01-01		0	1	
8420	20415	2	\N	1	2018-01-01		0	1	
8428	20427	2	\N	1	2018-01-01		0	1	
8436	20446	2	\N	1	2018-01-01		0	1	
8444	20464	3	\N	1	2018-01-01		0	1	
8452	20485	3	6	1	2018-01-01		0	1	
8460	20501	2	\N	1	2018-01-01		0	1	
8468	20519	2	\N	1	2018-01-01		0	1	
8476	20540	2	\N	1	2018-01-01		0	1	
8484	20554	2	2	1	2018-01-01		0	1	
8492	20575	2	\N	1	2018-01-01		0	1	
8500	20596	3	\N	1	2018-01-01		0	1	
8508	20609	3	\N	1	2018-01-01		0	1	
8516	20629	2	\N	1	2018-01-01		0	1	
8524	20641	2	\N	1	2018-01-01		0	1	
8532	20671	3	\N	1	2018-01-01		0	1	
8540	20695	1	\N	1	2018-01-01		0	1	
8548	20711	3	\N	1	2018-01-01		0	1	
8556	20726	2	\N	1	2018-01-01		0	1	
8564	20747	1	\N	1	2018-01-01		0	1	
8572	20763	3	\N	1	2018-01-01		0	1	
8580	20782	2	\N	1	2018-01-01		0	1	
8588	20812	3	7	1	2018-01-01		0	1	
8596	20828	3	6	1	2018-01-01		0	1	
8604	20850	2	\N	1	2018-01-01		0	1	
8612	20872	3	\N	1	2018-01-01		0	1	
8620	20891	2	2	1	2018-01-01		0	1	
8628	20912	2	\N	1	2018-01-01		0	1	
8636	20923	2	\N	1	2018-01-01		0	1	
8644	20940	2	\N	1	2018-01-01		0	1	
8652	20958	3	2	1	2018-01-01		0	1	
8660	20970	3	\N	1	2018-01-01		0	1	
8668	20997	3	\N	1	2018-01-01		0	1	
8676	21014	2	2	1	2018-01-01		0	1	
8684	21033	2	\N	1	2018-01-01		0	1	
8692	21049	\N	5	1	2018-01-01		0	1	
8700	21069	2	\N	1	2018-01-01		0	1	
8708	21077	2	2	1	2018-01-01		0	1	
8716	21107	3	2	1	2018-01-01		0	1	
8724	21129	2	\N	1	2018-01-01		0	1	
8732	21157	2	\N	1	2018-01-01		0	1	
8740	21186	2	\N	1	2018-01-01		0	1	
8748	21201	3	\N	1	2018-01-01		0	1	
8756	21216	3	\N	1	2018-01-01		0	1	
8764	21235	3	\N	1	2018-01-01		0	1	
8772	21255	2	\N	1	2018-01-01		0	1	
8780	21270	3	2	1	2018-01-01		0	1	
8788	21293	2	\N	1	2018-01-01		0	1	
8796	21309	3	6	1	2018-01-01		0	1	
8804	21341	2	\N	1	2018-01-01		0	1	
8812	21362	3	2	1	2018-01-01		0	1	
8820	21391	2	\N	1	2018-01-01		0	1	
8828	21417	2	\N	1	2018-01-01		0	1	
8836	21442	2	2	1	2018-01-01		0	1	
8844	21472	3	6	1	2018-01-01		0	1	
8852	21491	2	2	1	2018-01-01		0	1	
8860	21505	2	2	1	2018-01-01		0	1	
8868	21520	2	\N	1	2018-01-01		0	1	
8876	21539	2	\N	1	2018-01-01		0	1	
8884	21554	2	\N	1	2018-01-01		0	1	
8892	21579	2	2	1	2018-01-01		0	1	
8900	21600	3	\N	1	2018-01-01		0	1	
8908	21619	2	\N	1	2018-01-01		0	1	
8916	21654	3	\N	1	2018-01-01		0	1	
8024	19459	2	\N	1	2018-01-01		0	1	
8032	19480	2	\N	1	2018-01-01		0	1	
8040	19506	2	\N	1	2018-01-01		0	1	
8048	19528	3	2	1	2018-01-01		0	1	
8056	19543	2	\N	1	2018-01-01		0	1	
8064	19560	1	\N	1	2018-01-01		0	1	
8072	19573	2	\N	1	2018-01-01		0	1	
8080	19590	2	\N	1	2018-01-01		0	1	
8088	19606	2	\N	1	2018-01-01		0	1	
8096	19624	2	\N	1	2018-01-01		0	1	
8104	19641	2	\N	1	2018-01-01		0	1	
8112	19657	2	\N	1	2018-01-01		0	1	
8120	19678	3	\N	1	2018-01-01		0	1	
8128	19701	2	\N	1	2018-01-01		0	1	
8136	19717	3	2	1	2018-01-01		0	1	
8144	19745	3	2	1	2018-01-01		0	1	
8152	19771	2	1	1	2018-01-01		0	1	
8160	19788	3	\N	1	2018-01-01		0	1	
8168	19809	3	\N	1	2018-01-01		0	1	
8176	19833	3	5	1	2018-01-01		0	1	
8184	19850	3	2	1	2018-01-01		0	1	
8192	19868	2	\N	1	2018-01-01		0	1	
8200	19887	2	2	1	2018-01-01		0	1	
8208	19908	3	7	1	2018-01-01		0	1	
8216	19936	2	\N	1	2018-01-01		0	1	
8224	19953	3	\N	1	2018-01-01		0	1	
8232	19962	2	2	1	2018-01-01		0	1	
8240	19978	3	2	1	2018-01-01		0	1	
8248	19999	2	\N	1	2018-01-01		0	1	
8256	20015	1	\N	1	2018-01-01		0	1	
8264	20034	2	2	1	2018-01-01		0	1	
8272	20051	2	\N	1	2018-01-01		0	1	
8280	20081	3	\N	1	2018-01-01		0	1	
8288	20103	3	\N	1	2018-01-01		0	1	
8296	20127	2	\N	1	2018-01-01		0	1	
8304	20136	2	2	1	2018-01-01		0	1	
8312	20150	3	2	1	2018-01-01		0	1	
8320	20170	2	\N	1	2018-01-01		0	1	
8328	20185	2	\N	1	2018-01-01		0	1	
8336	20206	3	6	1	2018-01-01		0	1	
8344	20228	2	\N	1	2018-01-01		0	1	
8352	20245	2	\N	1	2018-01-01		0	1	
8360	20265	3	2	1	2018-01-01		0	1	
8368	20281	3	2	1	2018-01-01		0	1	
8376	20302	3	2	1	2018-01-01		0	1	
8384	20324	\N	7	1	2018-01-01		0	1	
8392	20346	3	\N	1	2018-01-01		0	1	
8400	20369	2	2	1	2018-01-01		0	1	
8408	20392	3	\N	1	2018-01-01		0	1	
8416	20404	1	\N	1	2018-01-01		0	1	
8424	20421	2	\N	1	2018-01-01		0	1	
8432	20437	3	\N	1	2018-01-01		0	1	
8440	20456	3	\N	1	2018-01-01		0	1	
8448	20474	2	\N	1	2018-01-01		0	1	
8456	20493	3	6	1	2018-01-01		0	1	
8464	20507	2	\N	1	2018-01-01		0	1	
8472	20527	3	2	1	2018-01-01		0	1	
8480	20544	2	\N	1	2018-01-01		0	1	
8488	20562	3	\N	1	2018-01-01		0	1	
8496	20588	2	\N	1	2018-01-01		0	1	
8504	20603	3	\N	1	2018-01-01		0	1	
8512	20620	2	\N	1	2018-01-01		0	1	
8520	20636	3	2	1	2018-01-01		0	1	
8528	20661	3	2	1	2018-01-01		0	1	
8536	20686	2	\N	1	2018-01-01		0	1	
8544	20706	2	2	1	2018-01-01		0	1	
8552	20721	3	6	1	2018-01-01		0	1	
8560	20735	1	\N	1	2018-01-01		0	1	
8568	20751	2	\N	1	2018-01-01		0	1	
8576	20774	2	2	1	2018-01-01		0	1	
8584	20793	2	\N	1	2018-01-01		0	1	
8592	20824	2	\N	1	2018-01-01		0	1	
8600	20835	3	\N	1	2018-01-01		0	1	
8608	20861	2	\N	1	2018-01-01		0	1	
8616	20883	2	\N	1	2018-01-01		0	1	
8624	20899	3	2	1	2018-01-01		0	1	
8632	20917	3	\N	1	2018-01-01		0	1	
8640	20931	3	2	1	2018-01-01		0	1	
8648	20950	2	\N	1	2018-01-01		0	1	
8656	20962	3	6	1	2018-01-01		0	1	
8664	20990	3	2	1	2018-01-01		0	1	
8672	21005	2	\N	1	2018-01-01		0	1	
8680	21026	2	\N	1	2018-01-01		0	1	
8688	21040	2	\N	1	2018-01-01		0	1	
8696	21055	3	2	1	2018-01-01		0	1	
8704	21073	3	\N	1	2018-01-01		0	1	
8712	21095	3	2	1	2018-01-01		0	1	
8720	21122	3	2	1	2018-01-01		0	1	
8728	21145	3	\N	1	2018-01-01		0	1	
8736	21179	3	2	1	2018-01-01		0	1	
8744	21193	2	\N	1	2018-01-01		0	1	
8752	21209	2	\N	1	2018-01-01		0	1	
8760	21225	3	\N	1	2018-01-01		0	1	
8768	21240	3	4	1	2018-01-01		0	1	
8776	21262	2	\N	1	2018-01-01		0	1	
8784	21275	2	\N	1	2018-01-01		0	1	
8792	21301	2	1	1	2018-01-01		0	1	
8800	21319	3	2	1	2018-01-01		0	1	
8808	21354	1	2	1	2018-01-01		0	1	
8816	21379	3	6	1	2018-01-01		0	1	
8824	21404	3	\N	1	2018-01-01		0	1	
8832	21429	2	\N	1	2018-01-01		0	1	
8840	21457	3	2	1	2018-01-01		0	1	
8848	21477	2	\N	1	2018-01-01		0	1	
8856	21500	2	\N	1	2018-01-01		0	1	
8864	21515	3	2	1	2018-01-01		0	1	
8872	21530	2	\N	1	2018-01-01		0	1	
8880	21549	3	\N	1	2018-01-01		0	1	
8888	21561	\N	2	1	2018-01-01		0	1	
8896	21590	2	\N	1	2018-01-01		0	1	
8904	21612	1	\N	1	2018-01-01		0	1	
8558	20733	2	\N	1	2018-01-01		0	1	
8566	20749	3	\N	1	2018-01-01		0	1	
8574	20772	3	\N	1	2018-01-01		0	1	
8582	20790	2	2	1	2018-01-01		0	1	
8590	20822	2	1	1	2018-01-01		0	1	
8598	20833	3	2	1	2018-01-01		0	1	
8606	20856	2	2	1	2018-01-01		0	1	
8614	20878	2	\N	1	2018-01-01		0	1	
8622	20895	3	7	1	2018-01-01		0	1	
8630	20914	3	2	1	2018-01-01		0	1	
8638	20928	2	\N	1	2018-01-01		0	1	
8646	20945	2	\N	1	2018-01-01		0	1	
8654	20960	2	\N	1	2018-01-01		0	1	
8662	20984	3	4	1	2018-01-01		0	1	
8670	20999	3	2	1	2018-01-01		0	1	
8678	21020	3	2	1	2018-01-01		0	1	
8686	21036	1	\N	1	2018-01-01		0	1	
8694	21051	2	\N	1	2018-01-01		0	1	
8702	21071	2	\N	1	2018-01-01		0	1	
8710	21090	1	\N	1	2018-01-01		0	1	
8718	21117	2	\N	1	2018-01-01		0	1	
8726	21135	2	\N	1	2018-01-01		0	1	
8734	21163	3	\N	1	2018-01-01		0	1	
8742	21189	3	\N	1	2018-01-01		0	1	
8750	21206	2	\N	1	2018-01-01		0	1	
8758	21223	3	\N	1	2018-01-01		0	1	
8766	21238	1	\N	1	2018-01-01		0	1	
8774	21259	2	2	1	2018-01-01		0	1	
8782	21273	2	\N	1	2018-01-01		0	1	
8790	21296	2	\N	1	2018-01-01		0	1	
8798	21312	3	2	1	2018-01-01		0	1	
8806	21349	2	2	1	2018-01-01		0	1	
8814	21364	3	\N	1	2018-01-01		0	1	
8822	21402	2	\N	1	2018-01-01		0	1	
8830	21423	1	2	1	2018-01-01		0	1	
8838	21453	2	\N	1	2018-01-01		0	1	
8846	21475	2	\N	1	2018-01-01		0	1	
8854	21496	2	\N	1	2018-01-01		0	1	
8862	21512	3	2	1	2018-01-01		0	1	
8870	21523	2	\N	1	2018-01-01		0	1	
8878	21544	2	\N	1	2018-01-01		0	1	
8886	21558	3	\N	1	2018-01-01		0	1	
8894	21587	1	\N	1	2018-01-01		0	1	
8902	21608	1	2	1	2018-01-01		0	1	
8910	21625	3	\N	1	2018-01-01		0	1	
8918	21662	2	\N	1	2018-01-01		0	1	
8926	21680	3	\N	1	2018-01-01		0	1	
8934	21704	2	\N	1	2018-01-01		0	1	
8942	21718	3	2	1	2018-01-01		0	1	
8950	21739	3	2	1	2018-01-01		0	1	
8958	21753	3	2	1	2018-01-01		0	1	
8966	21771	2	\N	1	2018-01-01		0	1	
8974	21791	3	\N	1	2018-01-01		0	1	
8982	21814	2	\N	1	2018-01-01		0	1	
8990	21834	2	\N	1	2018-01-01		0	1	
8998	21854	2	\N	1	2018-01-01		0	1	
9006	21876	2	\N	1	2018-01-01		0	1	
9014	21891	2	\N	1	2018-01-01		0	1	
9022	21911	3	\N	1	2018-01-01		0	1	
9030	21929	3	\N	1	2018-01-01		0	1	
9038	21957	3	\N	1	2018-01-01		0	1	
9046	21974	3	1	1	2018-01-01		0	1	
9054	21989	2	\N	1	2018-01-01		0	1	
9062	22008	3	\N	1	2018-01-01		0	1	
9070	22032	3	2	1	2018-01-01		0	1	
9078	22048	3	2	1	2018-01-01		0	1	
9086	22077	3	\N	1	2018-01-01		0	1	
9094	22091	2	\N	1	2018-01-01		0	1	
9102	22107	1	\N	1	2018-01-01		0	1	
9110	22127	2	\N	1	2018-01-01		0	1	
9118	22158	3	2	1	2018-01-01		0	1	
9126	22177	2	2	1	2018-01-01		0	1	
9134	22192	2	\N	1	2018-01-01		0	1	
9142	22203	2	\N	1	2018-01-01		0	1	
9150	22223	3	\N	1	2018-01-01		0	1	
9158	22243	2	\N	1	2018-01-01		0	1	
9166	22269	3	\N	1	2018-01-01		0	1	
9174	22305	3	6	1	2018-01-01		0	1	
9182	22323	3	2	1	2018-01-01		0	1	
9190	22336	2	\N	1	2018-01-01		0	1	
9198	22359	2	\N	1	2018-01-01		0	1	
9206	22378	2	1	1	2018-01-01		0	1	
9214	22403	2	5	1	2018-01-01		0	1	
9222	22413	3	2	1	2018-01-01		0	1	
9230	22430	2	\N	1	2018-01-01		0	1	
9238	22448	2	\N	1	2018-01-01		0	1	
9246	22466	3	2	1	2018-01-01		0	1	
9254	22475	3	\N	1	2018-01-01		0	1	
9262	22499	3	\N	1	2018-01-01		0	1	
9270	22516	2	\N	1	2018-01-01		0	1	
9278	22530	2	\N	1	2018-01-01		0	1	
9286	22556	2	\N	1	2018-01-01		0	1	
9294	22577	2	\N	1	2018-01-01		0	1	
9302	22592	2	\N	1	2018-01-01		0	1	
9310	22610	3	2	1	2018-01-01		0	1	
9318	22637	2	\N	1	2018-01-01		0	1	
9326	22653	3	\N	1	2018-01-01		0	1	
9334	22673	3	2	1	2018-01-01		0	1	
9342	22689	2	2	1	2018-01-01		0	1	
9350	22703	2	\N	1	2018-01-01		0	1	
9358	22733	2	\N	1	2018-01-01		0	1	
9366	22754	3	\N	1	2018-01-01		0	1	
9374	22766	3	1	1	2018-01-01		0	1	
9382	22783	2	\N	1	2018-01-01		0	1	
9390	22801	3	2	1	2018-01-01		0	1	
9398	22821	3	\N	1	2018-01-01		0	1	
9406	22835	2	2	1	2018-01-01		0	1	
9414	22857	2	\N	1	2018-01-01		0	1	
9422	22872	3	5	1	2018-01-01		0	1	
9430	22900	2	\N	1	2018-01-01		0	1	
9438	22921	2	\N	1	2018-01-01		0	1	
8853	21492	3	2	1	2018-01-01		0	1	
8861	21511	3	2	1	2018-01-01		0	1	
8869	21522	1	\N	1	2018-01-01		0	1	
8877	21542	3	5	1	2018-01-01		0	1	
8885	21556	2	1	1	2018-01-01		0	1	
8893	21586	2	\N	1	2018-01-01		0	1	
8901	21603	2	\N	1	2018-01-01		0	1	
8909	21624	3	2	1	2018-01-01		0	1	
8917	21659	2	2	1	2018-01-01		0	1	
8925	21678	1	\N	1	2018-01-01		0	1	
8933	21701	3	\N	1	2018-01-01		0	1	
8941	21717	2	\N	1	2018-01-01		0	1	
8949	21736	2	\N	1	2018-01-01		0	1	
8957	21752	2	\N	1	2018-01-01		0	1	
8965	21763	3	2	1	2018-01-01		0	1	
8973	21783	2	\N	1	2018-01-01		0	1	
8981	21813	3	\N	1	2018-01-01		0	1	
8989	21833	1	\N	1	2018-01-01		0	1	
8997	21851	2	\N	1	2018-01-01		0	1	
9005	21873	3	\N	1	2018-01-01		0	1	
9013	21890	1	\N	1	2018-01-01		0	1	
9021	21909	3	6	1	2018-01-01		0	1	
9029	21927	3	\N	1	2018-01-01		0	1	
9037	21951	3	6	1	2018-01-01		0	1	
9045	21967	3	4	1	2018-01-01		0	1	
9053	21988	2	\N	1	2018-01-01		0	1	
9061	22007	3	7	1	2018-01-01		0	1	
9069	22030	2	\N	1	2018-01-01		0	1	
9077	22045	2	\N	1	2018-01-01		0	1	
9085	22073	3	\N	1	2018-01-01		0	1	
9093	22090	2	\N	1	2018-01-01		0	1	
9101	22105	2	\N	1	2018-01-01		0	1	
9109	22126	2	\N	1	2018-01-01		0	1	
9117	22154	3	2	1	2018-01-01		0	1	
9125	22174	2	\N	1	2018-01-01		0	1	
9133	22188	3	\N	1	2018-01-01		0	1	
9141	22201	3	2	1	2018-01-01		0	1	
9149	22222	2	\N	1	2018-01-01		0	1	
9157	22242	2	\N	1	2018-01-01		0	1	
9165	22260	2	\N	1	2018-01-01		0	1	
9173	22301	2	1	1	2018-01-01		0	1	
9181	22322	3	7	1	2018-01-01		0	1	
9189	22335	2	2	1	2018-01-01		0	1	
9197	22358	3	2	1	2018-01-01		0	1	
9205	22376	2	\N	1	2018-01-01		0	1	
9213	22397	2	\N	1	2018-01-01		0	1	
9221	22412	3	\N	1	2018-01-01		0	1	
9229	22429	3	\N	1	2018-01-01		0	1	
9237	22447	3	2	1	2018-01-01		0	1	
9245	22459	3	2	1	2018-01-01		0	1	
9253	22474	2	\N	1	2018-01-01		0	1	
9261	22498	2	\N	1	2018-01-01		0	1	
9269	22515	2	2	1	2018-01-01		0	1	
9277	22529	3	2	1	2018-01-01		0	1	
9285	22554	2	2	1	2018-01-01		0	1	
9293	22575	2	\N	1	2018-01-01		0	1	
9301	22591	\N	2	1	2018-01-01		0	1	
9309	22609	2	1	1	2018-01-01		0	1	
9317	22635	2	\N	1	2018-01-01		0	1	
9325	22651	\N	5	1	2018-01-01		0	1	
9333	22667	3	\N	1	2018-01-01		0	1	
9341	22685	3	6	1	2018-01-01		0	1	
9349	22702	2	\N	1	2018-01-01		0	1	
9357	22729	2	\N	1	2018-01-01		0	1	
9365	22752	3	2	1	2018-01-01		0	1	
9373	22762	3	\N	1	2018-01-01		0	1	
9381	22780	3	2	1	2018-01-01		0	1	
9389	22795	2	\N	1	2018-01-01		0	1	
9397	22814	\N	2	1	2018-01-01		0	1	
9405	22834	2	\N	1	2018-01-01		0	1	
9413	22856	3	2	1	2018-01-01		0	1	
9421	22871	2	\N	1	2018-01-01		0	1	
9429	22897	3	\N	1	2018-01-01		0	1	
9437	22918	3	\N	1	2018-01-01		0	1	
9445	22940	1	\N	1	2018-01-01		0	1	
9453	22958	1	\N	1	2018-01-01		0	1	
9461	22967	2	2	1	2018-01-01		0	1	
9469	22984	3	2	1	2018-01-01		0	1	
9477	23008	2	\N	1	2018-01-01		0	1	
9485	23026	3	\N	1	2018-01-01		0	1	
9493	23047	2	\N	1	2018-01-01		0	1	
9501	23064	2	\N	1	2018-01-01		0	1	
9509	23083	2	\N	1	2018-01-01		0	1	
9517	23103	3	2	1	2018-01-01		0	1	
9525	23120	3	2	1	2018-01-01		0	1	
9533	23144	2	\N	1	2018-01-01		0	1	
9541	23170	2	\N	1	2018-01-01		0	1	
9549	23187	2	\N	1	2018-01-01		0	1	
9557	23198	2	\N	1	2018-01-01		0	1	
9565	23214	2	\N	1	2018-01-01		0	1	
9573	23235	3	2	1	2018-01-01		0	1	
9581	23251	2	\N	1	2018-01-01		0	1	
9589	23265	3	2	1	2018-01-01		0	1	
9597	23287	2	\N	1	2018-01-01		0	1	
9605	23306	3	2	1	2018-01-01		0	1	
9613	23331	2	\N	1	2018-01-01		0	1	
9621	23345	2	\N	1	2018-01-01		0	1	
9629	23356	1	\N	1	2018-01-01		0	1	
9637	23374	2	4	1	2018-01-01		0	1	
9645	23390	3	\N	1	2018-01-01		0	1	
9653	23417	2	2	1	2018-01-01		0	1	
9661	23437	3	6	1	2018-01-01		0	1	
9669	23457	2	\N	1	2018-01-01		0	1	
9677	23474	3	2	1	2018-01-01		0	1	
9685	23486	2	\N	1	2018-01-01		0	1	
9693	23501	2	\N	1	2018-01-01		0	1	
9701	23525	2	2	1	2018-01-01		0	1	
9709	23537	\N	2	1	2018-01-01		0	1	
9717	23558	2	\N	1	2018-01-01		0	1	
9725	23570	2	\N	1	2018-01-01		0	1	
9733	23591	2	\N	1	2018-01-01		0	1	
8953	21745	2	\N	1	2018-01-01		0	1	
8961	21757	2	\N	1	2018-01-01		0	1	
8969	21774	2	\N	1	2018-01-01		0	1	
8977	21803	2	2	1	2018-01-01		0	1	
8985	21820	2	2	1	2018-01-01		0	1	
8993	21838	2	\N	1	2018-01-01		0	1	
9001	21858	2	\N	1	2018-01-01		0	1	
9009	21885	3	2	1	2018-01-01		0	1	
9017	21900	2	2	1	2018-01-01		0	1	
9025	21921	3	7	1	2018-01-01		0	1	
9033	21935	2	\N	1	2018-01-01		0	1	
9041	21961	2	2	1	2018-01-01		0	1	
9049	21982	1	\N	1	2018-01-01		0	1	
9057	21993	2	\N	1	2018-01-01		0	1	
9065	22016	2	\N	1	2018-01-01		0	1	
9073	22036	3	7	1	2018-01-01		0	1	
9081	22060	2	\N	1	2018-01-01		0	1	
9089	22081	2	2	1	2018-01-01		0	1	
9097	22098	3	2	1	2018-01-01		0	1	
9105	22112	3	6	1	2018-01-01		0	1	
9113	22146	2	\N	1	2018-01-01		0	1	
9121	22165	3	2	1	2018-01-01		0	1	
9129	22181	3	\N	1	2018-01-01		0	1	
9137	22196	2	\N	1	2018-01-01		0	1	
9145	22212	2	2	1	2018-01-01		0	1	
9153	22233	2	\N	1	2018-01-01		0	1	
9161	22248	2	\N	1	2018-01-01		0	1	
9169	22282	3	\N	1	2018-01-01		0	1	
9177	22314	3	\N	1	2018-01-01		0	1	
9185	22327	2	\N	1	2018-01-01		0	1	
9193	22345	3	2	1	2018-01-01		0	1	
9201	22366	2	\N	1	2018-01-01		0	1	
9209	22385	3	\N	1	2018-01-01		0	1	
9217	22407	3	\N	1	2018-01-01		0	1	
9225	22423	3	2	1	2018-01-01		0	1	
9233	22436	2	\N	1	2018-01-01		0	1	
9241	22453	2	1	1	2018-01-01		0	1	
9249	22469	3	2	1	2018-01-01		0	1	
9257	22488	3	\N	1	2018-01-01		0	1	
9265	22504	2	\N	1	2018-01-01		0	1	
9273	22522	3	2	1	2018-01-01		0	1	
9281	22540	3	7	1	2018-01-01		0	1	
9289	22565	3	4	1	2018-01-01		0	1	
9297	22582	2	\N	1	2018-01-01		0	1	
9305	22602	3	2	1	2018-01-01		0	1	
9313	22617	3	2	1	2018-01-01		0	1	
9321	22641	2	\N	1	2018-01-01		0	1	
9329	22659	2	\N	1	2018-01-01		0	1	
9337	22679	2	\N	1	2018-01-01		0	1	
9345	22693	3	\N	1	2018-01-01		0	1	
9353	22708	2	\N	1	2018-01-01		0	1	
9361	22744	2	\N	1	2018-01-01		0	1	
9369	22757	3	2	1	2018-01-01		0	1	
9377	22772	1	\N	1	2018-01-01		0	1	
9385	22787	2	\N	1	2018-01-01		0	1	
9393	22805	2	\N	1	2018-01-01		0	1	
9401	22825	2	\N	1	2018-01-01		0	1	
9409	22840	2	\N	1	2018-01-01		0	1	
9417	22862	2	\N	1	2018-01-01		0	1	
9425	22883	1	\N	1	2018-01-01		0	1	
9433	22912	3	\N	1	2018-01-01		0	1	
9441	22925	3	\N	1	2018-01-01		0	1	
9449	22949	2	\N	1	2018-01-01		0	1	
9457	22962	2	\N	1	2018-01-01		0	1	
9465	22973	3	4	1	2018-01-01		0	1	
9473	22999	2	\N	1	2018-01-01		0	1	
9481	23017	3	\N	1	2018-01-01		0	1	
9489	23036	3	2	1	2018-01-01		0	1	
9497	23057	2	\N	1	2018-01-01		0	1	
9505	23073	1	\N	1	2018-01-01		0	1	
9513	23094	3	2	1	2018-01-01		0	1	
9521	23111	2	\N	1	2018-01-01		0	1	
9529	23128	2	2	1	2018-01-01		0	1	
9537	23158	2	\N	1	2018-01-01		0	1	
9545	23176	3	\N	1	2018-01-01		0	1	
9553	23193	2	\N	1	2018-01-01		0	1	
9561	23205	2	\N	1	2018-01-01		0	1	
9569	23225	2	1	1	2018-01-01		0	1	
9577	23243	3	\N	1	2018-01-01		0	1	
9585	23256	2	\N	1	2018-01-01		0	1	
9593	23274	3	2	1	2018-01-01		0	1	
9601	23300	2	2	1	2018-01-01		0	1	
9609	23316	2	\N	1	2018-01-01		0	1	
9617	23336	3	\N	1	2018-01-01		0	1	
9625	23349	3	2	1	2018-01-01		0	1	
9633	23368	2	1	1	2018-01-01		0	1	
9641	23382	2	\N	1	2018-01-01		0	1	
9649	23411	2	\N	1	2018-01-01		0	1	
9657	23430	3	\N	1	2018-01-01		0	1	
9665	23445	3	\N	1	2018-01-01		0	1	
9673	23463	2	\N	1	2018-01-01		0	1	
9681	23481	3	\N	1	2018-01-01		0	1	
9689	23494	3	2	1	2018-01-01		0	1	
9697	23515	2	\N	1	2018-01-01		0	1	
9705	23530	3	\N	1	2018-01-01		0	1	
9713	23551	3	2	1	2018-01-01		0	1	
9721	23563	1	\N	1	2018-01-01		0	1	
9729	23583	2	\N	1	2018-01-01		0	1	
9737	23604	3	2	1	2018-01-01		0	1	
9745	23614	2	\N	1	2018-01-01		0	1	
9753	23629	2	1	1	2018-01-01		0	1	
9761	23654	3	6	1	2018-01-01		0	1	
9769	23689	2	\N	1	2018-01-01		0	1	
9777	23699	2	2	1	2018-01-01		0	1	
9785	23714	1	\N	1	2018-01-01		0	1	
9793	23739	2	\N	1	2018-01-01		0	1	
9801	23757	2	\N	1	2018-01-01		0	1	
9809	23777	2	\N	1	2018-01-01		0	1	
9817	23808	3	6	1	2018-01-01		0	1	
9825	23831	2	\N	1	2018-01-01		0	1	
9833	23846	2	\N	1	2018-01-01		0	1	
9002	21863	2	\N	1	2018-01-01		0	1	
9010	21886	3	\N	1	2018-01-01		0	1	
9018	21902	3	2	1	2018-01-01		0	1	
9026	21923	3	\N	1	2018-01-01		0	1	
9034	21936	3	\N	1	2018-01-01		0	1	
9042	21962	2	\N	1	2018-01-01		0	1	
9050	21983	2	\N	1	2018-01-01		0	1	
9058	21997	2	\N	1	2018-01-01		0	1	
9066	22018	3	2	1	2018-01-01		0	1	
9074	22038	2	\N	1	2018-01-01		0	1	
9082	22062	2	\N	1	2018-01-01		0	1	
9090	22083	2	\N	1	2018-01-01		0	1	
9098	22101	2	2	1	2018-01-01		0	1	
9106	22114	2	\N	1	2018-01-01		0	1	
9114	22148	2	\N	1	2018-01-01		0	1	
9122	22168	3	2	1	2018-01-01		0	1	
9130	22184	3	\N	1	2018-01-01		0	1	
9138	22198	2	\N	1	2018-01-01		0	1	
9146	22213	3	2	1	2018-01-01		0	1	
9154	22235	2	2	1	2018-01-01		0	1	
9162	22249	3	\N	1	2018-01-01		0	1	
9170	22290	3	4	1	2018-01-01		0	1	
9178	22317	3	2	1	2018-01-01		0	1	
9186	22328	3	2	1	2018-01-01		0	1	
9194	22351	2	\N	1	2018-01-01		0	1	
9202	22367	2	2	1	2018-01-01		0	1	
9210	22388	2	2	1	2018-01-01		0	1	
9218	22408	3	\N	1	2018-01-01		0	1	
9226	22425	1	2	1	2018-01-01		0	1	
9234	22437	3	1	1	2018-01-01		0	1	
9242	22454	3	6	1	2018-01-01		0	1	
9250	22470	1	\N	1	2018-01-01		0	1	
9258	22492	2	\N	1	2018-01-01		0	1	
9266	22508	3	\N	1	2018-01-01		0	1	
9274	22526	3	2	1	2018-01-01		0	1	
9282	22546	2	\N	1	2018-01-01		0	1	
9290	22570	2	\N	1	2018-01-01		0	1	
9298	22584	2	\N	1	2018-01-01		0	1	
9306	22603	1	\N	1	2018-01-01		0	1	
9314	22624	3	\N	1	2018-01-01		0	1	
9322	22643	3	1	1	2018-01-01		0	1	
9330	22660	2	\N	1	2018-01-01		0	1	
9338	22682	3	2	1	2018-01-01		0	1	
9346	22696	2	\N	1	2018-01-01		0	1	
9354	22710	2	2	1	2018-01-01		0	1	
9362	22748	2	\N	1	2018-01-01		0	1	
9370	22759	3	6	1	2018-01-01		0	1	
9378	22773	3	2	1	2018-01-01		0	1	
9386	22788	2	2	1	2018-01-01		0	1	
9394	22808	3	2	1	2018-01-01		0	1	
9402	22827	2	\N	1	2018-01-01		0	1	
9410	22845	3	\N	1	2018-01-01		0	1	
9418	22865	3	2	1	2018-01-01		0	1	
9426	22884	3	\N	1	2018-01-01		0	1	
9434	22913	3	7	1	2018-01-01		0	1	
9442	22927	1	2	1	2018-01-01		0	1	
9450	22950	1	\N	1	2018-01-01		0	1	
9458	22963	2	\N	1	2018-01-01		0	1	
9466	22974	2	\N	1	2018-01-01		0	1	
9474	23000	3	\N	1	2018-01-01		0	1	
9482	23018	3	2	1	2018-01-01		0	1	
9490	23039	3	6	1	2018-01-01		0	1	
9498	23059	3	\N	1	2018-01-01		0	1	
9506	23074	2	\N	1	2018-01-01		0	1	
9514	23096	3	2	1	2018-01-01		0	1	
9522	23113	2	\N	1	2018-01-01		0	1	
9530	23132	2	\N	1	2018-01-01		0	1	
9538	23160	3	2	1	2018-01-01		0	1	
9546	23181	3	\N	1	2018-01-01		0	1	
9554	23195	2	\N	1	2018-01-01		0	1	
9562	23206	2	\N	1	2018-01-01		0	1	
9570	23228	2	\N	1	2018-01-01		0	1	
9578	23246	2	\N	1	2018-01-01		0	1	
9586	23261	3	\N	1	2018-01-01		0	1	
9594	23279	3	\N	1	2018-01-01		0	1	
9602	23301	3	\N	1	2018-01-01		0	1	
9610	23319	2	\N	1	2018-01-01		0	1	
9618	23338	3	2	1	2018-01-01		0	1	
9626	23351	3	2	1	2018-01-01		0	1	
9634	23369	2	\N	1	2018-01-01		0	1	
9642	23384	2	\N	1	2018-01-01		0	1	
9650	23413	2	2	1	2018-01-01		0	1	
9658	23431	2	\N	1	2018-01-01		0	1	
9666	23448	2	\N	1	2018-01-01		0	1	
9674	23465	2	\N	1	2018-01-01		0	1	
9682	23482	2	\N	1	2018-01-01		0	1	
9690	23495	2	\N	1	2018-01-01		0	1	
9698	23516	3	2	1	2018-01-01		0	1	
9706	23531	1	2	1	2018-01-01		0	1	
9714	23552	3	\N	1	2018-01-01		0	1	
9722	23564	2	\N	1	2018-01-01		0	1	
9730	23584	3	2	1	2018-01-01		0	1	
9738	23605	2	2	1	2018-01-01		0	1	
9746	23616	2	\N	1	2018-01-01		0	1	
9754	23638	3	2	1	2018-01-01		0	1	
9762	23658	2	\N	1	2018-01-01		0	1	
9770	23690	2	\N	1	2018-01-01		0	1	
9778	23700	2	\N	1	2018-01-01		0	1	
9786	23715	3	\N	1	2018-01-01		0	1	
9794	23747	3	2	1	2018-01-01		0	1	
9802	23758	1	\N	1	2018-01-01		0	1	
9810	23779	2	\N	1	2018-01-01		0	1	
9818	23810	2	\N	1	2018-01-01		0	1	
9826	23832	2	1	1	2018-01-01		0	1	
9834	23850	2	\N	1	2018-01-01		0	1	
9842	23866	1	2	1	2018-01-01		0	1	
8924	21677	3	\N	1	2018-01-01		0	1	
8932	21692	3	7	1	2018-01-01		0	1	
8940	21716	2	\N	1	2018-01-01		0	1	
8948	21733	2	\N	1	2018-01-01		0	1	
8956	21750	3	\N	1	2018-01-01		0	1	
8964	21761	2	\N	1	2018-01-01		0	1	
8972	21780	1	\N	1	2018-01-01		0	1	
8980	21806	2	2	1	2018-01-01		0	1	
8988	21831	3	2	1	2018-01-01		0	1	
8996	21848	3	6	1	2018-01-01		0	1	
9004	21866	3	6	1	2018-01-01		0	1	
9012	21889	3	2	1	2018-01-01		0	1	
9020	21908	2	\N	1	2018-01-01		0	1	
9028	21926	3	\N	1	2018-01-01		0	1	
9036	21940	1	\N	1	2018-01-01		0	1	
9044	21966	2	\N	1	2018-01-01		0	1	
9052	21985	2	\N	1	2018-01-01		0	1	
9060	22003	2	\N	1	2018-01-01		0	1	
9068	22026	3	2	1	2018-01-01		0	1	
9076	22043	2	\N	1	2018-01-01		0	1	
9084	22067	3	\N	1	2018-01-01		0	1	
9092	22087	2	\N	1	2018-01-01		0	1	
9100	22103	2	\N	1	2018-01-01		0	1	
9108	22122	2	\N	1	2018-01-01		0	1	
9116	22153	3	\N	1	2018-01-01		0	1	
9124	22173	2	\N	1	2018-01-01		0	1	
9132	22187	2	\N	1	2018-01-01		0	1	
9140	22200	3	\N	1	2018-01-01		0	1	
9148	22218	3	2	1	2018-01-01		0	1	
9156	22241	2	\N	1	2018-01-01		0	1	
9164	22255	3	2	1	2018-01-01		0	1	
9172	22299	3	\N	1	2018-01-01		0	1	
9180	22321	2	\N	1	2018-01-01		0	1	
9188	22330	2	\N	1	2018-01-01		0	1	
9196	22357	2	\N	1	2018-01-01		0	1	
9204	22372	3	\N	1	2018-01-01		0	1	
9212	22394	2	\N	1	2018-01-01		0	1	
9220	22411	2	2	1	2018-01-01		0	1	
9228	22428	2	\N	1	2018-01-01		0	1	
9236	22441	2	\N	1	2018-01-01		0	1	
9244	22457	2	\N	1	2018-01-01		0	1	
9252	22473	2	\N	1	2018-01-01		0	1	
9260	22494	3	\N	1	2018-01-01		0	1	
9268	22513	2	\N	1	2018-01-01		0	1	
9276	22528	2	\N	1	2018-01-01		0	1	
9284	22552	2	\N	1	2018-01-01		0	1	
9292	22574	3	2	1	2018-01-01		0	1	
9300	22590	3	4	1	2018-01-01		0	1	
9308	22607	3	2	1	2018-01-01		0	1	
9316	22631	3	\N	1	2018-01-01		0	1	
9324	22647	3	2	1	2018-01-01		0	1	
9332	22664	1	\N	1	2018-01-01		0	1	
9340	22684	3	\N	1	2018-01-01		0	1	
9348	22700	3	\N	1	2018-01-01		0	1	
9356	22722	2	\N	1	2018-01-01		0	1	
9364	22751	2	\N	1	2018-01-01		0	1	
9372	22761	2	\N	1	2018-01-01		0	1	
9380	22779	3	\N	1	2018-01-01		0	1	
9388	22792	3	\N	1	2018-01-01		0	1	
9396	22810	2	\N	1	2018-01-01		0	1	
9404	22833	2	\N	1	2018-01-01		0	1	
9412	22851	2	\N	1	2018-01-01		0	1	
9420	22869	3	2	1	2018-01-01		0	1	
9428	22891	2	4	1	2018-01-01		0	1	
9436	22917	3	4	1	2018-01-01		0	1	
9444	22937	2	\N	1	2018-01-01		0	1	
9452	22957	2	\N	1	2018-01-01		0	1	
9460	22966	2	\N	1	2018-01-01		0	1	
9468	22978	1	2	1	2018-01-01		0	1	
9476	23005	2	2	1	2018-01-01		0	1	
9484	23023	3	\N	1	2018-01-01		0	1	
9492	23046	2	\N	1	2018-01-01		0	1	
9500	23062	3	2	1	2018-01-01		0	1	
9508	23081	3	3	1	2018-01-01		0	1	
9516	23101	2	1	1	2018-01-01		0	1	
9524	23118	3	\N	1	2018-01-01		0	1	
9532	23143	1	2	1	2018-01-01		0	1	
9540	23168	2	\N	1	2018-01-01		0	1	
9548	23186	3	\N	1	2018-01-01		0	1	
9556	23197	3	7	1	2018-01-01		0	1	
9564	23211	2	\N	1	2018-01-01		0	1	
9572	23231	3	2	1	2018-01-01		0	1	
9580	23250	2	\N	1	2018-01-01		0	1	
9588	23264	2	\N	1	2018-01-01		0	1	
9596	23283	3	\N	1	2018-01-01		0	1	
9604	23304	2	\N	1	2018-01-01		0	1	
9612	23328	2	2	1	2018-01-01		0	1	
9620	23344	2	2	1	2018-01-01		0	1	
9628	23355	3	2	1	2018-01-01		0	1	
9636	23372	1	\N	1	2018-01-01		0	1	
9644	23389	2	2	1	2018-01-01		0	1	
9652	23415	2	2	1	2018-01-01		0	1	
9660	23436	2	\N	1	2018-01-01		0	1	
9668	23450	3	2	1	2018-01-01		0	1	
9676	23471	3	6	1	2018-01-01		0	1	
9684	23485	1	\N	1	2018-01-01		0	1	
9692	23500	3	5	1	2018-01-01		0	1	
9700	23521	3	\N	1	2018-01-01		0	1	
9708	23536	3	2	1	2018-01-01		0	1	
9716	23555	3	2	1	2018-01-01		0	1	
9724	23567	1	2	1	2018-01-01		0	1	
9732	23589	3	4	1	2018-01-01		0	1	
9740	23608	2	\N	1	2018-01-01		0	1	
9748	23619	2	\N	1	2018-01-01		0	1	
9756	23642	2	\N	1	2018-01-01		0	1	
9764	23668	3	\N	1	2018-01-01		0	1	
9772	23692	2	\N	1	2018-01-01		0	1	
9780	23705	2	\N	1	2018-01-01		0	1	
9788	23718	1	2	1	2018-01-01		0	1	
9796	23750	2	2	1	2018-01-01		0	1	
9804	23762	2	2	1	2018-01-01		0	1	
9446	22942	2	\N	1	2018-01-01		0	1	
9454	22959	3	\N	1	2018-01-01		0	1	
9462	22968	3	4	1	2018-01-01		0	1	
9470	22985	2	\N	1	2018-01-01		0	1	
9478	23009	2	\N	1	2018-01-01		0	1	
9486	23027	2	\N	1	2018-01-01		0	1	
9494	23051	2	\N	1	2018-01-01		0	1	
9502	23065	3	\N	1	2018-01-01		0	1	
9510	23088	3	\N	1	2018-01-01		0	1	
9518	23104	2	2	1	2018-01-01		0	1	
9526	23122	2	\N	1	2018-01-01		0	1	
9534	23146	1	\N	1	2018-01-01		0	1	
9542	23171	\N	\N	1	2018-01-01		0	1	
9550	23189	2	\N	1	2018-01-01		0	1	
9558	23201	1	2	1	2018-01-01		0	1	
9566	23218	2	\N	1	2018-01-01		0	1	
9574	23239	1	\N	1	2018-01-01		0	1	
9582	23253	2	\N	1	2018-01-01		0	1	
9590	23268	3	2	1	2018-01-01		0	1	
9598	23288	2	2	1	2018-01-01		0	1	
9606	23310	3	\N	1	2018-01-01		0	1	
9614	23332	2	1	1	2018-01-01		0	1	
9622	23346	2	\N	1	2018-01-01		0	1	
9630	23361	2	\N	1	2018-01-01		0	1	
9638	23378	\N	2	1	2018-01-01		0	1	
9646	23391	2	\N	1	2018-01-01		0	1	
9654	23419	3	2	1	2018-01-01		0	1	
9662	23440	3	\N	1	2018-01-01		0	1	
9670	23459	3	2	1	2018-01-01		0	1	
9678	23476	2	2	1	2018-01-01		0	1	
9686	23487	3	2	1	2018-01-01		0	1	
9694	23508	3	\N	1	2018-01-01		0	1	
9702	23526	2	\N	1	2018-01-01		0	1	
9710	23540	3	7	1	2018-01-01		0	1	
9718	23560	3	6	1	2018-01-01		0	1	
9726	23572	2	\N	1	2018-01-01		0	1	
9734	23592	3	\N	1	2018-01-01		0	1	
9742	23610	3	\N	1	2018-01-01		0	1	
9750	23622	3	2	1	2018-01-01		0	1	
9758	23645	2	\N	1	2018-01-01		0	1	
9766	23672	3	2	1	2018-01-01		0	1	
9774	23694	1	\N	1	2018-01-01		0	1	
9782	23708	2	\N	1	2018-01-01		0	1	
9790	23721	2	2	1	2018-01-01		0	1	
9798	23752	3	2	1	2018-01-01		0	1	
9806	23770	3	\N	1	2018-01-01		0	1	
9814	23791	3	\N	1	2018-01-01		0	1	
9822	23822	3	2	1	2018-01-01		0	1	
9830	23839	1	\N	1	2018-01-01		0	1	
9838	23858	2	2	1	2018-01-01		0	1	
8879	21548	3	1	1	2018-01-01		0	1	
8887	21560	3	\N	1	2018-01-01		0	1	
8895	21588	3	2	1	2018-01-01		0	1	
8903	21611	1	\N	1	2018-01-01		0	1	
8911	21629	2	\N	1	2018-01-01		0	1	
8919	21663	2	\N	1	2018-01-01		0	1	
8927	21683	3	4	1	2018-01-01		0	1	
8935	21706	2	\N	1	2018-01-01		0	1	
8943	21719	2	\N	1	2018-01-01		0	1	
8951	21741	3	\N	1	2018-01-01		0	1	
8959	21754	2	\N	1	2018-01-01		0	1	
8967	21772	3	2	1	2018-01-01		0	1	
8975	21795	2	2	1	2018-01-01		0	1	
8983	21816	3	2	1	2018-01-01		0	1	
8991	21835	3	\N	1	2018-01-01		0	1	
8999	21855	2	\N	1	2018-01-01		0	1	
9007	21880	2	\N	1	2018-01-01		0	1	
9015	21892	3	\N	1	2018-01-01		0	1	
9023	21914	2	2	1	2018-01-01		0	1	
9031	21930	2	\N	1	2018-01-01		0	1	
9039	21958	2	\N	1	2018-01-01		0	1	
9047	21975	3	2	1	2018-01-01		0	1	
9055	21990	2	\N	1	2018-01-01		0	1	
9063	22009	3	2	1	2018-01-01		0	1	
9071	22033	2	\N	1	2018-01-01		0	1	
9079	22052	3	2	1	2018-01-01		0	1	
9087	22078	3	2	1	2018-01-01		0	1	
9095	22092	3	6	1	2018-01-01		0	1	
9103	22110	1	2	1	2018-01-01		0	1	
9111	22138	2	\N	1	2018-01-01		0	1	
9119	22159	2	\N	1	2018-01-01		0	1	
9127	22178	3	2	1	2018-01-01		0	1	
9135	22194	2	\N	1	2018-01-01		0	1	
9143	22204	2	\N	1	2018-01-01		0	1	
9151	22224	3	7	1	2018-01-01		0	1	
9159	22244	3	2	1	2018-01-01		0	1	
9167	22275	2	2	1	2018-01-01		0	1	
9175	22310	2	\N	1	2018-01-01		0	1	
9183	22324	3	\N	1	2018-01-01		0	1	
9191	22340	3	6	1	2018-01-01		0	1	
9199	22361	2	\N	1	2018-01-01		0	1	
9207	22380	2	\N	1	2018-01-01		0	1	
9215	22404	3	2	1	2018-01-01		0	1	
9223	22417	3	\N	1	2018-01-01		0	1	
9231	22432	3	\N	1	2018-01-01		0	1	
9239	22449	1	\N	1	2018-01-01		0	1	
9247	22467	3	2	1	2018-01-01		0	1	
9255	22477	2	\N	1	2018-01-01		0	1	
9263	22501	3	2	1	2018-01-01		0	1	
9271	22517	1	2	1	2018-01-01		0	1	
9279	22535	2	\N	1	2018-01-01		0	1	
9287	22560	3	2	1	2018-01-01		0	1	
9295	22580	2	\N	1	2018-01-01		0	1	
9303	22595	2	\N	1	2018-01-01		0	1	
9311	22613	3	\N	1	2018-01-01		0	1	
9319	22638	2	2	1	2018-01-01		0	1	
9327	22656	3	\N	1	2018-01-01		0	1	
9335	22676	1	\N	1	2018-01-01		0	1	
9343	22691	3	2	1	2018-01-01		0	1	
9351	22704	3	2	1	2018-01-01		0	1	
9359	22737	2	\N	1	2018-01-01		0	1	
9367	22755	2	\N	1	2018-01-01		0	1	
9375	22767	3	2	1	2018-01-01		0	1	
9383	22784	3	\N	1	2018-01-01		0	1	
9391	22802	3	2	1	2018-01-01		0	1	
9399	22822	3	\N	1	2018-01-01		0	1	
9407	22837	3	6	1	2018-01-01		0	1	
9415	22860	2	\N	1	2018-01-01		0	1	
9423	22873	3	2	1	2018-01-01		0	1	
9431	22907	2	\N	1	2018-01-01		0	1	
9439	22923	1	2	1	2018-01-01		0	1	
9447	22944	2	\N	1	2018-01-01		0	1	
9455	22960	2	2	1	2018-01-01		0	1	
9463	22970	3	\N	1	2018-01-01		0	1	
9471	22987	3	5	1	2018-01-01		0	1	
9479	23010	2	1	1	2018-01-01		0	1	
9487	23029	2	\N	1	2018-01-01		0	1	
9495	23052	3	\N	1	2018-01-01		0	1	
9503	23066	3	6	1	2018-01-01		0	1	
9511	23089	3	\N	1	2018-01-01		0	1	
9519	23108	2	\N	1	2018-01-01		0	1	
9527	23123	3	\N	1	2018-01-01		0	1	
9535	23154	2	\N	1	2018-01-01		0	1	
9543	23172	3	\N	1	2018-01-01		0	1	
9551	23191	2	\N	1	2018-01-01		0	1	
9559	23203	2	\N	1	2018-01-01		0	1	
9567	23222	2	\N	1	2018-01-01		0	1	
9575	23240	2	\N	1	2018-01-01		0	1	
9583	23254	2	\N	1	2018-01-01		0	1	
9591	23269	3	2	1	2018-01-01		0	1	
9599	23289	1	\N	1	2018-01-01		0	1	
9607	23311	2	\N	1	2018-01-01		0	1	
9615	23334	2	2	1	2018-01-01		0	1	
9623	23347	2	\N	1	2018-01-01		0	1	
9631	23362	2	\N	1	2018-01-01		0	1	
9639	23379	2	\N	1	2018-01-01		0	1	
9647	23393	2	\N	1	2018-01-01		0	1	
9655	23424	3	2	1	2018-01-01		0	1	
9663	23441	2	\N	1	2018-01-01		0	1	
9671	23461	2	\N	1	2018-01-01		0	1	
9679	23477	3	\N	1	2018-01-01		0	1	
9687	23488	2	2	1	2018-01-01		0	1	
9695	23510	2	\N	1	2018-01-01		0	1	
9703	23528	3	\N	1	2018-01-01		0	1	
9711	23546	2	2	1	2018-01-01		0	1	
9719	23561	3	2	1	2018-01-01		0	1	
9727	23580	2	\N	1	2018-01-01		0	1	
9735	23597	2	\N	1	2018-01-01		0	1	
9743	23612	2	\N	1	2018-01-01		0	1	
9751	23624	2	\N	1	2018-01-01		0	1	
9759	23650	3	2	1	2018-01-01		0	1	
9767	23674	3	2	1	2018-01-01		0	1	
8912	21630	2	\N	1	2018-01-01		0	1	
8920	21665	2	\N	1	2018-01-01		0	1	
8928	21684	2	\N	1	2018-01-01		0	1	
8936	21711	2	\N	1	2018-01-01		0	1	
8944	21721	2	\N	1	2018-01-01		0	1	
8952	21742	2	2	1	2018-01-01		0	1	
8960	21756	2	\N	1	2018-01-01		0	1	
8968	21773	2	\N	1	2018-01-01		0	1	
8976	21796	3	\N	1	2018-01-01		0	1	
8984	21819	1	\N	1	2018-01-01		0	1	
8992	21837	2	2	1	2018-01-01		0	1	
9000	21857	2	\N	1	2018-01-01		0	1	
9008	21884	3	2	1	2018-01-01		0	1	
9016	21899	3	2	1	2018-01-01		0	1	
9024	21919	1	\N	1	2018-01-01		0	1	
9032	21932	2	\N	1	2018-01-01		0	1	
9040	21960	2	\N	1	2018-01-01		0	1	
9048	21980	2	\N	1	2018-01-01		0	1	
9056	21992	2	\N	1	2018-01-01		0	1	
9064	22015	3	2	1	2018-01-01		0	1	
9072	22035	2	2	1	2018-01-01		0	1	
9080	22056	3	\N	1	2018-01-01		0	1	
9088	22079	1	\N	1	2018-01-01		0	1	
9096	22093	3	\N	1	2018-01-01		0	1	
9104	22111	1	\N	1	2018-01-01		0	1	
9112	22141	2	\N	1	2018-01-01		0	1	
9120	22164	2	2	1	2018-01-01		0	1	
9128	22179	3	\N	1	2018-01-01		0	1	
9136	22195	2	\N	1	2018-01-01		0	1	
9144	22207	2	\N	1	2018-01-01		0	1	
9152	22226	3	\N	1	2018-01-01		0	1	
9160	22247	2	\N	1	2018-01-01		0	1	
9168	22277	2	\N	1	2018-01-01		0	1	
9176	22311	2	\N	1	2018-01-01		0	1	
9184	22326	3	\N	1	2018-01-01		0	1	
9192	22344	3	6	1	2018-01-01		0	1	
9200	22362	2	\N	1	2018-01-01		0	1	
9208	22383	3	\N	1	2018-01-01		0	1	
9216	22406	3	\N	1	2018-01-01		0	1	
9224	22419	2	\N	1	2018-01-01		0	1	
9232	22435	3	\N	1	2018-01-01		0	1	
9240	22451	3	2	1	2018-01-01		0	1	
9248	22468	2	\N	1	2018-01-01		0	1	
9256	22478	3	2	1	2018-01-01		0	1	
9264	22503	3	\N	1	2018-01-01		0	1	
9272	22518	3	6	1	2018-01-01		0	1	
9280	22536	2	2	1	2018-01-01		0	1	
9288	22562	2	\N	1	2018-01-01		0	1	
9296	22581	2	\N	1	2018-01-01		0	1	
9304	22601	2	\N	1	2018-01-01		0	1	
9312	22616	2	\N	1	2018-01-01		0	1	
9320	22640	3	2	1	2018-01-01		0	1	
9328	22658	2	\N	1	2018-01-01		0	1	
9336	22678	2	\N	1	2018-01-01		0	1	
9344	22692	2	2	1	2018-01-01		0	1	
9352	22707	3	1	1	2018-01-01		0	1	
9360	22741	2	\N	1	2018-01-01		0	1	
9368	22756	2	\N	1	2018-01-01		0	1	
9376	22770	2	\N	1	2018-01-01		0	1	
9384	22786	2	1	1	2018-01-01		0	1	
9392	22804	3	4	1	2018-01-01		0	1	
9400	22824	3	1	1	2018-01-01		0	1	
9408	22838	2	\N	1	2018-01-01		0	1	
9416	22861	2	\N	1	2018-01-01		0	1	
9424	22882	3	2	1	2018-01-01		0	1	
9432	22909	3	\N	1	2018-01-01		0	1	
9440	22924	3	\N	1	2018-01-01		0	1	
9448	22945	2	\N	1	2018-01-01		0	1	
9456	22961	2	\N	1	2018-01-01		0	1	
9464	22971	3	7	1	2018-01-01		0	1	
9472	22990	3	2	1	2018-01-01		0	1	
9480	23016	3	2	1	2018-01-01		0	1	
9488	23032	3	2	1	2018-01-01		0	1	
9496	23055	3	2	1	2018-01-01		0	1	
9504	23067	2	1	1	2018-01-01		0	1	
9512	23091	1	\N	1	2018-01-01		0	1	
9520	23110	2	\N	1	2018-01-01		0	1	
9528	23127	2	\N	1	2018-01-01		0	1	
9536	23155	3	6	1	2018-01-01		0	1	
9544	23173	3	2	1	2018-01-01		0	1	
9552	23192	2	\N	1	2018-01-01		0	1	
9560	23204	3	\N	1	2018-01-01		0	1	
9568	23223	3	\N	1	2018-01-01		0	1	
9576	23242	2	\N	1	2018-01-01		0	1	
9584	23255	2	\N	1	2018-01-01		0	1	
9592	23273	3	2	1	2018-01-01		0	1	
9600	23299	3	2	1	2018-01-01		0	1	
9608	23314	3	2	1	2018-01-01		0	1	
9616	23335	2	\N	1	2018-01-01		0	1	
9624	23348	1	\N	1	2018-01-01		0	1	
9632	23363	3	7	1	2018-01-01		0	1	
9640	23380	2	2	1	2018-01-01		0	1	
9648	23410	3	\N	1	2018-01-01		0	1	
9656	23428	3	\N	1	2018-01-01		0	1	
9664	23443	3	2	1	2018-01-01		0	1	
9672	23462	3	2	1	2018-01-01		0	1	
9680	23480	3	\N	1	2018-01-01		0	1	
9688	23489	2	2	1	2018-01-01		0	1	
9696	23513	3	2	1	2018-01-01		0	1	
9704	23529	3	\N	1	2018-01-01		0	1	
9712	23548	3	\N	1	2018-01-01		0	1	
9720	23562	3	2	1	2018-01-01		0	1	
9728	23582	2	\N	1	2018-01-01		0	1	
9736	23601	3	\N	1	2018-01-01		0	1	
9744	23613	3	4	1	2018-01-01		0	1	
9752	23625	3	\N	1	2018-01-01		0	1	
9760	23652	3	\N	1	2018-01-01		0	1	
9768	23686	2	\N	1	2018-01-01		0	1	
9776	23696	3	5	1	2018-01-01		0	1	
9784	23710	3	6	1	2018-01-01		0	1	
9792	23731	2	1	1	2018-01-01		0	1	
9387	22790	3	2	1	2018-01-01		0	1	
9395	22809	2	\N	1	2018-01-01		0	1	
9403	22831	1	\N	1	2018-01-01		0	1	
9411	22850	2	\N	1	2018-01-01		0	1	
9419	22868	2	2	1	2018-01-01		0	1	
9427	22887	2	\N	1	2018-01-01		0	1	
9435	22914	3	2	1	2018-01-01		0	1	
9443	22933	3	2	1	2018-01-01		0	1	
9451	22956	2	\N	1	2018-01-01		0	1	
9459	22965	2	2	1	2018-01-01		0	1	
9467	22975	2	\N	1	2018-01-01		0	1	
9475	23002	2	\N	1	2018-01-01		0	1	
9483	23021	3	2	1	2018-01-01		0	1	
9491	23045	3	\N	1	2018-01-01		0	1	
9499	23060	3	2	1	2018-01-01		0	1	
9507	23076	3	2	1	2018-01-01		0	1	
9515	23098	2	\N	1	2018-01-01		0	1	
9523	23116	3	2	1	2018-01-01		0	1	
9531	23136	2	\N	1	2018-01-01		0	1	
9539	23165	3	\N	1	2018-01-01		0	1	
9547	23182	2	2	1	2018-01-01		0	1	
9555	23196	3	\N	1	2018-01-01		0	1	
9563	23210	2	\N	1	2018-01-01		0	1	
9571	23230	2	1	1	2018-01-01		0	1	
9579	23249	2	5	1	2018-01-01		0	1	
9587	23262	2	2	1	2018-01-01		0	1	
9595	23281	2	\N	1	2018-01-01		0	1	
9603	23303	2	\N	1	2018-01-01		0	1	
9611	23327	2	\N	1	2018-01-01		0	1	
9619	23342	2	\N	1	2018-01-01		0	1	
9627	23352	3	2	1	2018-01-01		0	1	
9635	23371	2	\N	1	2018-01-01		0	1	
9643	23386	2	\N	1	2018-01-01		0	1	
9651	23414	2	\N	1	2018-01-01		0	1	
9659	23432	2	\N	1	2018-01-01		0	1	
9667	23449	3	7	1	2018-01-01		0	1	
9675	23470	2	\N	1	2018-01-01		0	1	
9683	23483	3	2	1	2018-01-01		0	1	
9691	23498	3	\N	1	2018-01-01		0	1	
9699	23519	2	\N	1	2018-01-01		0	1	
9707	23535	2	\N	1	2018-01-01		0	1	
9715	23554	2	1	1	2018-01-01		0	1	
9723	23565	2	\N	1	2018-01-01		0	1	
9731	23587	3	2	1	2018-01-01		0	1	
9739	23607	2	\N	1	2018-01-01		0	1	
9747	23618	2	\N	1	2018-01-01		0	1	
9755	23641	3	2	1	2018-01-01		0	1	
9763	23666	2	\N	1	2018-01-01		0	1	
9771	23691	3	2	1	2018-01-01		0	1	
9779	23701	3	\N	1	2018-01-01		0	1	
9787	23717	2	\N	1	2018-01-01		0	1	
9795	23748	3	7	1	2018-01-01		0	1	
9803	23759	3	2	1	2018-01-01		0	1	
9811	23784	2	\N	1	2018-01-01		0	1	
9819	23816	2	\N	1	2018-01-01		0	1	
9827	23833	2	\N	1	2018-01-01		0	1	
9835	23852	3	2	1	2018-01-01		0	1	
9843	23867	2	2	1	2018-01-01		0	1	
9741	23609	3	2	1	2018-01-01		0	1	
9749	23621	2	2	1	2018-01-01		0	1	
9757	23644	2	\N	1	2018-01-01		0	1	
9765	23669	2	2	1	2018-01-01		0	1	
9773	23693	2	\N	1	2018-01-01		0	1	
9781	23707	2	\N	1	2018-01-01		0	1	
9789	23719	1	\N	1	2018-01-01		0	1	
9797	23751	2	\N	1	2018-01-01		0	1	
9805	23767	3	2	1	2018-01-01		0	1	
9813	23790	2	\N	1	2018-01-01		0	1	
9821	23821	2	\N	1	2018-01-01		0	1	
9829	23838	3	2	1	2018-01-01		0	1	
9837	23854	2	2	1	2018-01-01		0	1	
9812	23788	2	2	1	2018-01-01		0	1	
9820	23817	2	\N	1	2018-01-01		0	1	
9828	23834	2	2	1	2018-01-01		0	1	
9836	23853	3	2	1	2018-01-01		0	1	
9844	23868	2	\N	1	2018-01-01		0	1	
9841	23865	3	\N	1	2018-01-01		0	1	
9775	23695	3	\N	1	2018-01-01		0	1	
9783	23709	\N	2	1	2018-01-01		0	1	
9791	23730	3	5	1	2018-01-01		0	1	
9799	23754	3	\N	1	2018-01-01		0	1	
9807	23771	2	\N	1	2018-01-01		0	1	
9815	23795	1	\N	1	2018-01-01		0	1	
9823	23829	3	2	1	2018-01-01		0	1	
9831	23842	3	2	1	2018-01-01		0	1	
9839	23861	2	\N	1	2018-01-01		0	1	
9800	23755	\N	2	1	2018-01-01		0	1	
9808	23775	2	\N	1	2018-01-01		0	1	
9816	23800	3	2	1	2018-01-01		0	1	
9824	23830	2	\N	1	2018-01-01		0	1	
9832	23843	3	\N	1	2018-01-01		0	1	
9840	23862	3	2	1	2018-01-01		0	1	
\.


--
-- Data for Name: files; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.files (id, filenam, deleted, upload_user, upload_comment) FROM stdin;
\.


--
-- Data for Name: inst_import_lookup; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.inst_import_lookup (orig, lookup) FROM stdin;
Org       	Organizacional                
PD\n       	PD                            
Gen       	Generic Installation          
A2\n       	A2                            
Evi       	Generic Installation          
\.


--
-- Data for Name: installations; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.installations (id, nam, asset, processing_center, platform_count, latitude, longitude) FROM stdin;
5	A2	1	ABK-A-Permanente 2	1	0	0
13	FPS	5	FPSO	1	0	0
21	LIA	6	Litoral-A	6	0	0
6	AKB	2	Akal-B	7	0	0
2	ABA	1	Abkatun-A	5	0	0
7	AKC	2	Akal-C & C7/C8	12	0	0
4	POA	1	POL-A	4	0	0
14	KUA	5	Ku-A	4	0	0
12	CAT	5	C.O. Cayo Arcas Terminal	3	0	0
20	ABD	6	Abkatun-D	3	0	0
28	Generic	\N	\N	0	0	0
8	AKL	2	Akal-L	4	0	0
3	ABN	1	Abkatun-N1	3	0	0
1	N/A	\N	N/A	0	0	0
9	NOH	2	Nohoch-A	7	0	0
17	KUS	5	Ku-S	4	0	0
25	CC2	4	CRAE CC	0	0	0
22	PD	6	Bateria (Planta Dulce)	1	0	0
10	AKG	2	Akal-G	3	0	0
15	KUH	5	Ku-H	3	0	0
16	KUM	5	Ku-M	3	0	0
11	AKJ	5	Akal-J	8	0	0
19	ZAC	5	Zaap-C	4	0	0
27	Organizational	\N	\N	0	0	0
23	CC1	3	CASES CC	0	0	0
24	DB1	3	CASES DB	0	0	0
18	REB	5	Rebombeo	1	0	0
26	DB2	4	CRAE DB	0	0	0
\.


--
-- Data for Name: items; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.items (id, installation, recommendation, verification, criteria) FROM stdin;
1	2	33	7	1
9	9	67	4	62
17	28	27	4	5
25	6	74	5	3
33	12	48	9	228
41	16	17	6	4
49	14	1	6	4
57	20	51	4	7
65	26	66	9	228
73	8	36	3	182
81	24	63	9	228
89	13	53	4	6
97	9	45	7	2
105	5	56	9	228
113	18	26	4	6
121	13	5	5	3
129	19	45	6	4
137	5	2	5	3
145	7	45	12	229
153	17	56	4	7
161	4	24	6	4
169	12	30	9	228
177	25	37	7	2
185	17	56	12	174
193	14	61	4	52
201	27	41	6	4
209	28	1	8	124
217	28	46	4	6
225	15	12	3	15
233	22	41	5	3
241	19	35	4	77
249	13	30	5	3
257	25	37	4	30
265	27	55	4	5
273	4	27	4	7
281	3	70	9	228
289	18	45	4	7
297	3	2	7	2
305	25	49	10	224
313	8	28	3	138
321	11	56	5	3
329	11	20	4	5
337	18	60	5	3
345	18	10	3	178
353	27	33	7	2
361	2	31	7	2
369	12	27	12	163
377	28	65	7	2
385	11	11	7	1
393	21	6	4	49
401	16	14	4	5
409	10	41	13	109
417	21	69	6	4
425	14	6	4	6
433	6	37	6	4
441	25	17	4	160
449	21	71	4	6
457	18	35	4	134
465	6	55	5	3
473	3	70	5	3
481	18	33	4	35
489	19	34	9	228
497	22	26	4	7
505	22	4	4	7
513	14	67	4	6
521	10	27	9	228
529	9	36	4	6
537	20	51	7	2
545	25	39	3	22
553	2	44	4	192
561	18	5	7	2
569	27	35	7	1
577	19	23	5	3
585	5	51	7	2
593	10	13	6	4
601	19	18	4	6
609	26	69	4	7
617	24	42	5	3
625	20	71	7	1
633	20	58	4	6
641	27	63	4	48
649	5	28	4	5
657	16	44	4	6
665	2	36	3	182
673	14	26	4	7
681	11	5	6	4
689	9	2	7	2
697	5	18	7	1
705	4	5	4	199
713	8	20	6	4
721	14	39	3	74
729	18	22	3	137
737	26	27	5	3
745	19	66	7	2
753	20	12	4	7
761	7	30	6	4
769	16	67	4	62
777	23	15	9	228
785	11	30	4	7
793	7	45	3	201
4	6	12	7	2
3	13	56	3	147
2	16	5	12	171
5	15	17	4	6
13	9	65	7	1
21	24	37	7	2
29	14	44	4	7
37	25	55	4	116
45	15	54	3	221
53	11	45	6	4
61	11	39	7	1
69	2	57	5	3
77	5	50	10	202
85	24	55	4	10
93	6	49	4	117
101	20	55	5	3
109	10	52	3	95
117	4	24	9	228
125	18	5	4	199
133	7	6	4	49
141	10	19	7	2
149	11	66	7	2
157	7	65	12	188
165	21	47	4	38
173	18	2	6	4
181	12	9	9	228
189	3	45	3	229
197	26	63	4	48
205	6	42	4	5
213	23	73	5	3
221	23	12	3	15
229	2	22	4	6
237	21	68	4	61
245	9	49	9	228
253	15	11	7	2
261	16	57	5	3
269	21	40	4	78
277	25	56	6	4
285	19	58	7	1
293	3	49	6	4
301	26	23	4	5
309	25	39	7	1
317	16	60	6	4
325	13	56	2	223
333	22	45	4	5
341	28	61	4	52
349	28	26	4	7
357	2	71	4	5
365	11	9	12	111
373	11	59	4	136
381	27	4	7	2
389	28	70	4	43
397	20	14	4	6
405	8	14	4	5
413	16	33	3	105
421	5	63	5	3
429	5	39	7	1
437	19	16	9	228
445	10	65	3	188
453	16	20	6	4
461	8	13	7	2
469	26	63	4	5
477	20	49	10	170
485	2	56	12	214
493	24	10	3	178
501	20	23	3	164
509	13	1	9	228
517	5	5	6	4
525	24	33	4	35
533	13	17	4	103
541	21	46	3	231
549	11	39	4	6
557	3	33	7	1
565	18	65	7	1
573	21	64	4	6
581	27	46	3	231
589	2	60	6	4
597	15	38	4	6
605	10	45	3	229
613	8	54	7	1
621	13	44	7	2
629	4	13	6	4
637	17	33	4	6
645	3	52	4	7
653	4	10	3	204
661	22	25	3	165
669	7	12	6	4
677	18	56	7	2
685	11	34	9	228
693	12	69	7	2
701	28	4	4	7
709	8	60	9	228
717	20	74	6	4
725	16	31	6	207
733	26	59	4	136
741	7	56	2	223
749	9	35	4	134
757	21	54	4	7
765	4	65	3	125
773	7	50	7	1
781	7	21	7	1
789	12	41	7	2
797	16	54	4	6
805	16	71	4	5
813	17	52	9	228
821	15	36	4	7
829	26	32	4	6
837	24	5	4	199
845	28	1	6	4
853	5	39	3	22
861	8	33	7	1
869	7	30	5	3
877	18	23	5	3
885	20	74	5	3
893	25	39	4	6
901	6	17	4	160
909	15	65	4	173
917	24	24	6	4
925	23	40	4	7
933	28	54	9	228
941	5	50	3	202
949	10	49	4	45
957	23	8	4	93
965	24	45	3	229
973	28	57	4	6
981	20	49	4	117
989	22	51	5	3
997	15	70	7	1
1005	26	45	3	201
1013	4	49	4	45
1021	3	28	3	184
1029	7	53	4	6
1037	14	25	4	6
1045	27	45	5	3
1053	5	66	3	86
1061	16	6	4	5
1069	23	33	5	3
1077	17	43	12	101
1085	23	54	5	3
1093	15	50	3	197
1101	23	8	7	2
1109	24	16	9	228
1117	10	40	7	1
1125	12	72	4	6
1133	19	10	4	5
1141	15	19	4	5
1149	20	32	7	1
1157	18	49	4	45
1165	17	44	7	1
1173	10	65	3	125
1181	21	18	4	32
1189	13	28	3	99
1197	18	31	5	3
1205	18	43	12	101
1213	20	59	6	4
1221	9	55	4	7
1229	26	46	3	225
1237	21	16	4	25
1245	27	54	4	7
1253	23	65	7	2
1261	14	54	9	228
1269	6	50	3	185
1277	9	52	9	228
1285	14	45	4	211
1293	24	27	4	7
1301	26	27	12	163
1309	19	51	7	2
1317	10	55	9	228
1325	7	37	5	3
1333	24	5	12	177
1341	16	38	4	19
1349	27	42	4	51
1357	22	51	6	4
1365	27	49	10	170
1373	6	3	7	1
1381	2	35	4	5
1389	7	62	6	4
1397	28	46	3	231
1405	27	24	4	5
1413	25	68	4	6
1421	15	65	3	89
1429	16	57	4	79
1437	28	41	9	228
1445	20	50	7	1
1453	3	73	4	6
1461	8	56	3	223
1469	23	28	4	6
1477	14	17	7	1
1485	12	14	4	6
1493	7	59	9	228
1501	16	31	4	7
1509	16	72	4	5
1517	17	74	3	100
1525	17	20	5	3
1533	10	46	3	216
1541	13	55	3	144
1549	26	19	3	12
1557	20	45	12	229
1565	22	53	4	198
1573	28	30	3	161
1581	23	4	6	4
1589	22	30	5	3
1597	20	39	3	22
1605	26	54	7	2
1613	2	31	6	207
1621	15	57	7	1
1629	22	70	4	60
1637	19	27	9	228
1645	25	31	4	5
1653	6	5	5	3
1661	17	28	3	184
1669	12	24	4	5
1677	22	28	3	99
1685	5	74	6	4
8	5	58	7	1
16	10	56	3	215
24	15	56	3	196
32	9	33	4	6
40	18	41	13	109
48	23	39	4	7
56	28	11	4	58
64	18	2	9	228
72	6	59	4	136
80	6	34	5	3
88	3	52	6	4
96	14	46	4	6
104	16	45	4	227
112	21	1	9	228
120	13	21	7	1
128	10	35	4	134
136	11	35	4	77
144	15	39	4	7
152	20	24	4	5
160	5	49	4	5
168	22	69	6	4
176	8	45	4	230
184	20	66	9	228
192	15	4	6	4
200	27	59	5	3
208	8	46	4	5
216	10	22	3	137
224	8	18	4	160
232	21	2	12	175
240	4	22	3	137
248	15	49	7	1
256	24	23	5	3
264	9	26	7	1
272	11	16	6	4
280	25	9	7	2
288	22	41	6	4
296	10	31	5	3
304	19	49	10	224
312	12	51	4	7
320	3	67	4	62
328	19	20	4	5
336	5	18	4	6
344	25	13	5	3
352	5	5	9	228
360	7	37	6	4
368	15	67	7	1
376	27	68	4	61
384	20	48	6	4
392	23	53	4	198
400	27	39	3	74
408	3	23	12	137
416	28	44	6	4
424	7	9	9	228
432	8	41	4	6
440	3	27	3	123
448	17	38	4	128
456	2	18	4	160
464	9	28	3	184
472	3	38	4	5
480	28	62	5	3
488	13	16	4	25
496	10	67	4	5
504	16	21	4	5
512	18	18	4	103
520	25	19	4	7
528	27	12	6	4
536	26	64	7	1
544	17	35	4	134
552	25	45	4	222
560	5	27	9	228
568	8	67	5	3
576	12	71	4	6
584	2	44	7	1
592	18	23	9	228
600	8	10	9	228
608	22	44	4	156
616	2	6	4	5
624	21	44	7	2
632	14	22	9	228
640	18	65	4	6
648	26	48	9	228
656	28	39	3	74
664	5	27	6	4
672	11	45	4	222
680	11	63	5	3
688	13	12	9	228
696	17	70	6	4
704	19	37	7	2
712	16	42	4	7
720	24	9	4	27
728	24	24	5	3
736	25	22	4	7
744	10	5	7	2
752	24	16	4	7
760	13	73	4	7
768	9	63	3	126
776	9	22	3	137
784	17	16	7	2
792	23	50	2	213
800	7	55	3	144
808	13	66	5	3
816	22	4	7	2
824	25	48	7	2
832	17	65	7	1
840	7	50	4	6
848	18	65	3	188
856	27	64	4	6
864	4	18	4	103
872	9	17	4	5
880	22	62	5	3
888	24	60	5	3
896	27	41	9	228
904	2	20	9	228
912	9	27	12	191
920	24	59	7	2
928	7	16	4	5
936	26	23	3	164
944	16	52	4	7
952	8	2	4	7
960	16	70	9	228
968	20	17	4	160
976	5	33	4	35
984	17	63	11	90
992	24	35	4	77
1000	12	31	4	5
1008	21	65	12	188
1016	5	66	7	2
1024	23	36	4	7
1032	18	8	4	6
1040	28	62	9	228
1048	3	38	4	128
1056	24	20	5	3
1064	22	65	4	173
1072	9	8	7	1
1080	22	38	7	1
1088	28	28	4	6
1096	11	27	12	163
1104	21	12	9	228
1112	3	18	4	180
1120	13	18	4	32
1128	12	49	4	117
1136	24	9	4	7
1144	17	38	4	5
1152	2	48	4	81
1160	14	12	6	4
1168	15	73	6	4
1176	25	19	9	228
1184	5	48	7	2
1192	28	45	4	211
1200	25	23	5	3
1208	27	17	4	103
1216	2	69	4	6
1224	12	63	4	48
1232	10	19	4	7
1240	10	5	12	177
1248	10	42	9	228
1256	24	57	4	5
6	3	36	4	6
14	18	56	3	215
22	12	71	7	1
30	20	48	9	228
38	16	41	4	6
46	6	72	7	1
54	7	64	7	1
62	3	46	4	211
70	18	19	7	2
78	21	45	12	229
86	14	56	12	215
94	13	4	7	2
102	25	69	7	2
110	24	45	4	7
118	10	5	4	199
126	11	56	9	228
134	25	74	3	135
142	8	17	5	3
150	15	7	7	2
158	19	45	3	232
166	2	41	7	1
174	18	55	7	2
182	7	1	9	228
190	13	56	12	215
198	20	73	3	34
206	8	73	7	1
214	20	63	4	5
222	20	45	3	201
230	22	70	4	43
238	27	40	4	78
246	24	2	5	3
254	13	12	6	4
262	4	65	4	6
270	19	40	4	6
278	24	4	4	121
286	23	57	4	6
294	21	63	4	48
302	28	25	4	6
310	23	12	5	3
318	6	62	4	7
326	22	22	5	3
334	13	46	12	216
342	14	70	4	60
350	3	42	7	2
358	19	42	5	3
366	7	51	9	228
374	11	42	5	3
382	5	34	9	228
390	17	23	12	137
398	11	72	7	1
406	25	16	9	228
414	8	33	3	105
422	14	41	9	228
430	8	14	4	25
438	18	24	9	228
446	5	4	4	121
454	13	12	4	7
462	9	5	7	2
470	13	15	4	7
478	22	50	2	213
486	22	36	4	110
494	2	43	4	5
502	28	45	4	5
510	9	4	7	1
518	21	56	12	215
526	2	20	6	4
534	27	6	7	1
542	9	56	4	7
550	11	45	9	228
558	9	13	7	2
566	9	53	4	5
574	9	65	4	6
582	7	56	12	215
590	11	74	6	4
598	3	65	3	188
606	21	66	5	3
614	8	5	12	171
622	17	52	6	4
630	13	52	4	5
638	15	31	3	162
646	14	63	3	90
654	17	10	9	228
662	14	36	7	2
670	24	40	7	1
678	28	22	9	228
686	8	45	3	226
694	11	48	7	2
702	16	10	7	2
710	18	27	3	149
718	25	71	4	26
726	2	73	7	1
734	25	46	3	216
742	14	50	2	213
750	27	9	5	3
758	21	73	4	7
766	23	54	6	4
774	17	22	3	137
782	9	42	7	2
790	23	1	8	124
798	24	12	4	141
806	2	12	4	6
814	11	68	7	1
822	17	10	5	3
830	22	11	4	58
838	4	66	4	7
846	3	33	4	6
854	16	20	4	113
862	24	70	4	5
870	11	31	4	5
878	27	45	12	229
886	26	12	4	7
894	27	4	3	20
902	24	65	3	188
910	4	48	4	7
918	20	19	6	4
926	15	30	4	5
934	10	10	3	178
942	3	20	6	4
950	23	73	6	4
958	6	19	9	228
966	23	65	4	173
974	9	34	4	7
982	26	32	7	1
990	12	27	5	3
998	18	74	3	69
1006	12	59	6	4
1014	5	19	4	7
1022	16	46	4	5
1030	13	74	4	5
1038	3	3	4	157
1046	2	60	9	228
1054	12	8	4	55
1062	4	33	4	35
1070	7	9	5	3
1078	11	16	5	3
1086	17	28	3	138
1094	19	74	3	69
1102	14	1	8	124
1110	27	1	9	228
1118	21	9	6	4
1126	12	25	3	139
1134	6	51	4	7
1142	20	46	3	222
1150	24	33	3	71
1158	6	73	3	34
1166	4	5	12	177
1174	12	2	4	5
1182	13	30	3	161
1190	24	47	4	6
1198	24	31	5	3
1206	20	3	4	6
1214	2	67	4	62
1222	19	24	5	3
1230	18	12	4	141
1238	8	43	3	21
1246	24	50	3	202
1254	20	45	6	4
12	7	34	4	5
20	22	41	9	228
28	11	16	9	228
36	6	23	3	164
44	12	37	6	4
52	4	52	3	95
60	23	33	9	228
68	9	49	2	217
76	27	46	7	1
84	26	46	3	222
92	22	22	6	4
100	21	9	9	228
108	18	52	3	95
116	24	55	7	2
124	7	45	4	211
132	7	48	5	3
140	4	27	7	2
148	11	9	7	2
156	18	47	4	6
164	11	59	7	2
172	7	16	4	25
180	16	45	4	230
188	14	28	3	162
196	11	69	7	2
204	26	24	4	5
212	12	74	3	135
220	23	56	3	196
228	14	22	5	3
236	17	27	12	191
244	2	5	12	171
252	2	54	4	209
260	11	50	3	185
268	17	55	4	7
276	28	66	4	5
284	7	10	3	190
292	12	17	4	160
300	24	9	12	111
308	27	56	12	215
316	20	72	7	1
324	24	63	5	3
332	2	27	3	123
340	26	41	7	2
348	19	56	6	4
356	24	13	6	4
364	4	45	4	7
372	11	49	10	224
380	6	1	4	7
388	4	8	7	1
396	13	9	5	3
404	14	36	4	110
412	6	23	4	5
420	9	52	6	4
428	10	27	4	7
436	27	2	12	175
444	22	44	4	7
452	10	59	7	2
460	18	50	3	202
468	10	68	4	6
476	28	38	7	1
484	7	52	4	5
492	9	49	5	3
500	19	5	6	4
508	6	37	3	195
516	24	28	4	5
524	4	31	5	3
532	13	45	12	229
540	6	3	4	6
548	10	60	5	3
556	10	74	7	2
564	21	44	4	7
572	20	22	7	2
580	18	51	4	44
588	3	44	7	1
596	17	49	5	3
604	19	8	4	55
612	12	50	3	185
620	16	54	7	1
628	9	38	4	128
636	10	24	9	228
644	21	5	5	3
652	6	45	3	201
660	8	60	6	4
668	9	18	4	103
676	13	51	6	4
684	21	4	7	2
692	21	69	9	228
700	11	37	7	2
708	21	45	5	3
716	10	26	4	6
724	4	67	4	5
732	28	36	4	110
740	3	7	7	1
748	22	15	7	2
756	14	15	7	2
764	7	13	4	5
772	10	2	6	4
780	21	51	9	228
788	22	36	4	7
796	5	20	4	5
804	3	63	3	126
812	4	41	13	109
820	2	25	4	5
828	24	18	7	1
836	2	1	4	6
844	22	25	4	6
852	20	25	3	139
860	10	47	7	1
868	21	55	4	5
876	11	50	10	202
884	24	24	9	228
892	18	24	6	4
900	13	63	4	48
908	20	8	4	55
916	18	65	3	125
924	16	36	3	182
932	15	37	4	5
940	25	68	7	1
948	4	42	9	228
956	7	63	4	48
964	10	18	4	103
972	24	27	9	228
980	15	28	4	6
988	26	14	4	6
996	10	63	5	3
1004	9	63	4	7
1012	26	48	6	4
1020	22	6	4	49
1028	20	59	4	136
1036	27	16	4	25
1044	28	37	5	3
1052	13	9	6	4
1060	21	14	4	6
1068	6	27	12	163
1076	15	36	4	30
1084	18	40	7	1
1092	19	27	12	163
1100	20	42	4	5
1108	6	8	4	55
1116	24	41	13	109
1124	10	70	4	5
1132	12	66	9	228
1140	23	49	7	1
1148	9	7	7	1
1156	8	52	4	7
1164	3	63	4	7
1172	8	70	9	228
1180	9	18	4	160
1188	4	63	9	228
1196	2	52	4	7
1204	12	72	7	1
1212	24	30	4	7
1220	15	41	5	3
1228	22	16	4	25
1236	28	17	7	1
1244	21	53	4	6
1252	14	4	7	2
1260	12	50	7	1
7	4	45	3	229
15	7	4	7	2
23	11	19	4	7
31	7	68	4	61
39	13	70	4	60
47	19	56	9	228
55	3	49	5	3
63	5	50	3	185
71	6	74	3	135
79	24	74	3	69
87	17	36	4	6
95	10	20	5	3
103	7	5	5	3
111	14	44	9	228
119	16	57	6	4
127	17	42	7	2
135	5	35	4	77
143	28	7	4	7
151	27	69	4	50
159	3	45	7	2
167	3	53	4	5
175	2	45	4	230
183	13	33	7	2
191	17	4	7	1
199	26	49	4	117
207	20	74	3	135
215	25	40	4	6
223	25	56	9	228
231	10	24	5	3
239	5	62	3	97
247	21	25	7	1
255	4	33	3	71
263	17	7	7	1
271	26	71	7	1
279	6	21	4	6
287	11	58	7	1
295	16	63	3	126
303	7	25	7	1
311	27	9	9	228
319	21	9	5	3
327	21	46	12	216
335	24	56	9	228
343	26	22	7	2
351	9	44	7	1
359	4	23	9	228
367	13	13	4	5
375	16	24	7	2
383	4	28	3	184
391	5	30	4	7
399	27	56	2	223
407	12	16	5	3
415	13	30	9	228
423	16	14	4	25
431	24	23	9	228
439	11	66	3	86
447	5	55	4	10
455	6	20	4	5
463	17	22	3	8
471	25	56	5	3
479	25	32	7	1
487	22	7	4	7
495	17	45	7	2
503	27	13	4	5
511	16	4	4	6
519	19	39	7	1
527	6	32	7	1
535	17	8	7	1
543	13	46	3	231
551	6	31	4	5
559	2	21	4	5
567	3	57	5	3
575	8	73	4	6
583	28	41	5	3
591	18	42	9	228
599	3	31	6	4
607	7	28	3	99
615	28	65	4	173
623	13	69	6	4
631	7	69	4	7
639	12	37	3	195
647	3	28	3	161
655	7	44	7	2
663	22	47	4	7
671	7	6	7	1
679	17	31	9	228
687	5	59	7	2
695	3	60	6	4
703	8	21	4	5
711	7	12	9	228
719	10	50	3	202
727	17	49	2	217
735	17	70	5	3
743	22	33	9	228
751	25	11	7	1
759	17	63	3	126
767	8	67	4	62
775	18	74	7	2
783	13	45	3	201
791	9	41	13	109
799	15	40	4	7
807	13	65	12	188
815	2	20	4	113
823	9	10	5	3
831	24	67	4	5
839	21	52	4	5
847	20	20	4	5
855	24	8	4	6
863	12	23	4	5
871	9	38	4	5
879	12	14	7	1
887	21	51	6	4
895	18	26	7	1
903	27	61	7	1
911	24	7	4	6
919	17	47	7	1
927	7	17	4	103
935	13	54	4	7
943	2	57	4	79
951	17	10	6	4
959	7	61	4	6
967	26	50	7	1
975	6	12	4	7
983	21	45	4	211
991	18	35	4	77
999	27	45	4	211
1007	11	52	4	145
1015	26	9	9	228
1023	2	52	7	2
1031	2	57	9	228
1039	12	45	3	201
1047	25	18	4	6
1055	5	10	4	5
1063	2	46	4	5
1071	3	8	7	1
1079	21	46	7	1
1087	12	74	5	3
1095	3	34	4	7
1103	11	37	4	7
1111	26	50	4	6
1119	21	4	3	20
1127	21	13	4	5
1135	12	42	4	5
1143	13	25	7	1
1151	28	16	4	25
1159	17	65	3	188
1167	18	55	4	10
1175	22	55	4	5
1183	10	38	4	5
1191	21	63	4	5
1199	13	30	6	4
1207	28	51	5	3
1215	18	13	6	4
1223	20	5	5	3
1231	10	33	3	71
1239	15	44	9	228
1247	12	5	5	3
1255	25	5	9	228
10	23	17	4	6
18	18	27	4	7
26	20	37	3	195
34	11	4	4	121
42	24	2	9	228
50	22	62	9	228
58	23	68	7	2
66	6	2	4	5
74	17	67	4	62
82	24	22	3	137
90	25	74	9	228
98	13	9	9	228
106	16	52	7	2
114	5	9	12	111
122	4	19	7	2
130	13	10	3	190
138	7	63	4	5
146	7	55	4	5
154	5	24	5	3
162	3	36	3	182
170	2	43	3	21
178	17	13	7	2
186	17	31	6	4
194	5	40	4	6
202	26	62	4	7
210	2	63	4	7
218	16	73	7	1
226	22	1	6	4
234	5	9	4	27
242	27	14	4	6
250	7	15	4	7
258	6	14	7	1
266	16	45	3	226
274	9	15	7	1
282	2	62	4	6
290	5	37	7	2
298	25	34	6	4
306	28	17	4	6
314	24	27	3	149
322	23	36	4	30
330	24	51	4	44
338	14	10	3	219
346	4	54	4	218
354	22	12	6	4
362	19	9	12	111
370	25	58	7	1
378	21	48	5	3
386	26	59	6	4
394	8	56	12	214
402	24	49	10	224
410	6	61	4	6
418	6	50	7	1
426	26	51	4	7
434	17	54	4	6
442	24	5	4	7
450	3	57	3	18
458	21	50	4	6
466	12	32	4	6
474	9	70	5	3
482	27	47	4	38
490	17	74	4	7
498	20	10	3	190
506	8	45	4	227
514	16	49	9	228
522	9	10	9	228
530	2	64	4	5
538	26	72	7	1
546	26	71	4	6
554	26	17	4	160
562	27	11	4	58
570	8	4	4	6
578	19	50	3	202
586	20	46	3	225
594	26	13	4	5
602	17	2	7	2
610	28	44	4	7
618	21	30	9	228
626	22	6	4	6
634	22	22	9	228
642	17	73	4	6
650	13	66	6	4
658	26	48	5	3
666	11	51	7	2
674	16	46	3	201
682	9	74	4	7
690	8	52	7	2
698	14	37	5	3
706	9	49	6	4
714	17	23	7	2
722	15	51	5	3
730	5	11	4	6
738	21	56	4	5
746	25	8	4	55
754	19	59	7	2
762	10	47	4	6
770	2	46	3	201
778	14	33	9	228
786	26	43	7	1
794	11	62	7	2
802	24	49	4	5
810	8	49	6	4
818	12	63	4	5
826	5	74	3	69
834	27	9	6	4
842	18	9	12	111
850	27	52	4	5
858	8	43	4	5
866	22	17	7	1
874	17	27	7	2
882	17	3	4	157
890	17	15	7	1
898	24	26	4	6
906	18	24	5	3
914	13	14	4	6
922	20	23	4	5
930	28	22	5	3
938	23	37	4	5
946	24	7	7	1
954	27	28	3	99
962	18	57	4	5
970	6	74	6	4
978	20	72	4	6
986	7	46	12	216
994	3	10	3	178
1002	28	12	6	4
1010	16	33	7	1
1018	27	49	4	117
1026	21	12	6	4
1034	21	74	4	5
1042	20	60	4	5
1050	23	51	5	3
1058	16	3	4	5
1066	23	19	4	5
1074	25	62	4	7
1082	28	50	2	213
1090	17	27	3	123
1098	27	44	7	2
1106	6	34	6	4
1114	8	63	3	126
1122	26	61	4	6
1130	16	46	4	211
1138	16	25	4	5
1146	9	57	4	5
1154	15	62	5	3
1162	25	55	6	4
1170	17	45	3	229
1178	10	8	7	1
1186	19	11	4	6
1194	9	5	12	171
1202	4	10	3	178
1210	9	47	7	1
1218	28	47	4	7
1226	6	16	5	3
1234	2	4	4	83
1242	5	42	5	3
1250	14	22	6	4
1258	13	28	3	162
11	25	27	12	163
19	19	19	4	7
27	10	65	4	6
35	9	73	4	6
43	8	58	4	114
51	4	26	7	1
59	15	73	9	228
67	10	30	4	7
75	11	22	4	7
83	27	25	7	1
91	18	20	5	3
99	23	38	4	6
107	18	45	3	229
115	4	65	3	188
123	12	21	4	6
131	13	50	4	6
139	16	13	7	2
147	6	45	6	4
155	18	16	9	228
163	25	66	4	47
171	10	63	9	228
179	13	51	9	228
187	19	5	9	228
195	4	60	5	3
203	22	17	4	103
211	6	69	7	2
219	5	45	4	222
227	27	5	5	3
235	14	57	7	1
243	14	66	4	5
251	5	31	4	5
259	13	6	7	1
267	22	35	7	1
275	3	10	9	228
283	25	45	6	4
291	4	5	4	7
299	18	59	7	2
307	4	50	3	202
315	4	40	7	1
323	23	11	7	2
331	16	64	4	5
339	25	29	4	6
347	25	50	3	185
355	10	9	4	27
363	20	69	4	7
371	19	2	5	3
379	5	9	4	7
387	8	45	3	200
395	8	27	3	123
403	17	26	7	1
411	22	63	3	90
419	25	34	9	228
427	25	59	4	7
435	26	8	4	55
443	19	4	4	121
451	9	57	3	18
459	5	45	6	4
467	2	4	4	6
475	5	16	5	3
483	19	45	4	222
491	3	27	12	191
499	20	61	4	6
507	16	1	4	6
515	18	7	4	6
523	6	71	7	1
531	7	51	6	4
539	20	62	4	7
547	12	12	4	7
555	4	2	6	4
563	13	61	7	1
571	19	29	4	6
579	17	33	3	105
587	3	47	7	1
595	17	39	4	140
603	7	49	4	117
611	22	44	9	228
619	2	44	4	6
627	4	47	7	1
635	17	57	3	18
643	23	31	3	162
651	23	54	9	228
659	2	54	7	1
667	21	17	4	103
675	2	17	5	3
683	7	14	4	6
691	25	66	7	2
699	16	60	9	228
707	2	63	3	126
715	15	54	9	228
723	3	15	7	1
731	6	25	3	139
739	11	37	4	30
747	27	69	9	228
755	7	64	4	6
763	12	51	7	2
771	5	49	10	224
779	6	9	9	228
787	28	36	4	7
795	3	18	4	160
803	19	55	6	4
811	7	33	7	2
819	14	4	6	4
827	3	74	4	7
835	14	11	4	58
843	16	18	4	160
851	5	16	9	228
859	28	6	4	6
867	11	9	4	27
875	17	31	5	3
883	4	16	7	2
891	18	67	4	5
899	3	13	7	2
907	2	2	4	7
915	8	70	3	152
923	15	54	5	3
931	10	23	5	3
939	27	66	5	3
947	2	70	3	152
955	26	74	5	3
963	14	74	4	5
971	22	25	7	1
979	7	73	4	7
987	23	30	4	5
995	21	56	2	223
1003	22	28	7	1
1011	10	28	3	184
1019	28	15	7	2
1027	12	59	4	136
1035	7	12	4	7
1043	17	52	4	7
1051	14	4	4	7
1059	9	35	4	5
1067	8	25	4	5
1075	15	73	5	3
1083	19	32	7	1
1091	10	23	9	228
1099	3	5	7	2
1107	14	41	6	4
1115	2	17	6	4
1123	23	59	4	5
1131	24	65	3	125
1139	2	33	3	105
1147	21	6	7	1
1155	26	5	5	3
1163	25	74	6	4
1171	12	69	4	7
1179	25	71	7	1
1187	28	6	4	49
1195	18	7	7	1
1203	26	25	3	139
1211	14	48	4	5
1219	22	57	4	6
1227	3	36	7	1
1235	19	74	6	4
1243	5	23	5	3
1251	15	36	9	228
1259	12	10	3	190
801	17	36	3	182
809	4	47	4	6
817	26	10	3	190
825	3	55	4	7
833	10	9	12	111
841	6	18	4	6
849	3	52	9	228
857	26	72	4	6
865	4	24	5	3
873	23	72	3	37
881	5	45	9	228
889	13	40	4	78
897	18	5	4	7
905	14	41	5	3
913	17	35	4	5
921	4	35	4	134
929	14	38	7	1
937	24	26	7	1
945	9	65	3	188
953	9	45	3	229
961	14	6	7	1
969	6	10	3	190
977	3	60	9	228
985	11	24	5	3
993	2	30	3	68
1001	15	15	6	4
1009	2	56	12	208
1017	28	55	4	5
1025	3	49	9	228
1033	25	35	4	77
1041	28	41	6	4
1049	3	49	2	217
1057	22	59	5	3
1065	8	63	4	7
1073	19	56	5	3
1081	7	56	4	5
1089	24	19	7	2
1097	11	74	3	69
1105	15	57	4	6
1113	10	5	4	7
1121	26	37	3	195
1129	28	22	6	4
1137	14	46	7	1
1145	13	55	4	5
1153	3	63	11	90
1161	3	23	7	2
1169	27	62	9	228
1177	16	28	3	138
1185	15	59	4	5
1193	3	5	12	171
1201	27	44	4	7
1209	3	18	4	103
1217	10	11	7	1
1225	4	38	4	5
1233	2	45	3	200
1241	14	44	4	156
1249	27	74	4	5
1257	10	36	4	6
1265	6	13	5	3
1273	2	57	6	4
1281	14	55	4	5
1289	20	71	4	6
1297	2	3	4	5
1305	3	56	12	174
1313	13	39	3	74
1321	24	36	4	6
1329	9	64	4	5
1337	26	69	4	50
1345	14	5	3	84
1353	12	5	6	4
1361	23	8	4	7
1369	5	52	4	145
1377	28	69	9	228
1385	4	16	6	4
1393	16	43	3	21
1401	18	48	7	2
1409	22	73	9	228
1417	7	25	3	165
1425	3	10	6	4
1433	23	22	5	3
1441	28	33	9	228
1449	10	26	7	1
1457	20	13	5	3
1465	17	24	6	4
1473	22	61	4	52
1481	4	51	4	44
1489	15	65	6	4
1497	15	48	4	5
1505	3	48	4	81
1513	3	2	4	7
1521	22	50	3	197
1529	21	46	3	225
1537	13	37	9	228
1545	25	73	3	34
1553	24	13	9	228
1561	15	36	4	110
1569	7	11	4	58
1577	9	74	3	100
1585	13	46	3	225
1593	7	49	10	170
1601	8	28	5	3
1609	21	55	3	144
1617	8	64	4	5
1625	18	28	4	5
1633	7	2	4	5
1641	3	64	4	5
1649	9	54	4	6
1657	7	41	6	4
1665	22	59	4	5
1673	28	15	4	7
1681	8	42	7	2
1689	8	12	4	6
1697	5	49	4	45
1705	3	56	12	214
1713	21	27	4	5
1721	16	5	3	143
1729	6	10	4	5
1737	24	48	4	7
1745	18	63	6	4
1753	22	53	4	6
1761	8	28	6	4
1769	13	11	4	58
1777	10	31	3	161
1785	10	57	3	18
1793	8	5	3	143
1801	15	26	7	2
1809	12	37	9	228
1817	16	33	4	6
1825	4	65	7	1
1833	2	61	4	5
1841	6	45	4	222
1849	16	44	7	1
1857	25	56	12	146
1865	23	70	7	1
1873	13	49	4	117
1881	2	2	7	2
1889	17	64	4	5
1897	10	34	4	7
1905	7	37	9	228
1913	22	16	4	5
1921	6	45	9	228
1929	11	17	4	180
1937	18	68	7	1
1945	26	65	12	188
1953	26	59	9	228
1961	14	33	6	4
1969	26	16	5	3
1977	8	31	6	4
1985	28	73	9	228
1993	11	49	4	85
2001	2	5	3	177
2009	5	68	4	6
2017	2	45	4	227
2025	5	27	12	163
2033	28	67	4	6
2041	4	49	5	3
2049	21	61	4	6
1263	9	20	6	4
1271	24	74	7	2
1279	20	9	9	228
1287	9	16	7	2
1295	12	48	6	4
1303	9	23	6	4
1311	3	28	3	138
1319	24	55	4	7
1327	23	14	3	57
1335	23	67	4	6
1343	26	45	4	222
1351	13	21	4	6
1359	6	41	7	2
1367	27	45	4	5
1375	10	52	5	3
1383	5	46	3	216
1391	15	18	4	193
1399	18	28	3	184
1407	22	15	4	7
1415	20	50	3	185
1423	7	61	7	1
1431	23	41	5	3
1439	19	50	3	185
1447	19	55	4	10
1455	25	62	4	127
1463	23	67	7	1
1471	19	59	4	136
1479	15	33	5	3
1487	28	34	4	5
1495	12	21	7	1
1503	26	61	7	1
1511	17	23	4	7
1519	21	41	6	4
1527	22	33	6	4
1535	28	68	4	61
1543	9	24	6	4
1551	26	56	12	146
1559	22	34	4	5
1567	4	55	7	2
1575	17	18	4	160
1583	28	73	6	4
1591	21	46	4	6
1599	28	28	3	99
1607	19	17	4	180
1615	2	3	4	157
1623	23	62	5	3
1631	22	46	7	1
1639	14	53	4	6
1647	11	29	4	6
1655	10	7	7	1
1663	3	16	7	2
1671	17	10	3	178
1679	6	62	7	2
1687	25	51	4	44
1695	12	29	4	6
1703	12	62	7	2
1711	6	45	5	3
1719	9	56	7	2
1727	19	22	7	2
1735	27	5	4	5
1743	14	65	7	2
1751	15	70	4	43
1759	18	56	9	228
1767	14	10	3	153
1775	20	1	4	7
1783	20	62	7	2
1791	2	28	5	3
1799	6	29	6	206
1807	9	60	6	4
1815	12	50	10	202
1823	3	4	7	1
1831	7	42	4	5
1839	19	62	4	127
1847	22	48	4	5
1855	12	61	7	1
1863	10	9	7	2
1871	19	72	7	1
1879	27	23	4	5
1887	14	46	12	216
1895	24	31	3	161
1903	24	9	7	2
1911	21	53	7	1
1919	12	13	4	5
1927	28	54	6	4
1935	26	21	7	1
1943	24	27	7	2
1951	12	15	3	57
1959	14	69	9	228
1967	7	23	3	164
1975	19	46	3	216
1983	5	73	3	34
1991	12	43	4	6
1999	6	41	4	7
2007	16	2	4	7
2015	6	69	4	50
2023	6	46	3	222
2031	4	49	2	217
2039	17	8	4	6
2047	28	25	7	1
2055	9	28	3	161
2063	19	9	4	7
2071	17	60	9	228
2079	24	11	7	1
2087	9	54	4	218
2095	22	69	5	3
2103	15	67	4	6
2111	9	63	9	228
2119	14	73	4	7
2127	27	33	4	7
2135	11	9	4	7
2143	22	7	7	2
2151	15	17	4	32
2159	8	42	12	108
2167	24	55	9	228
2175	6	29	4	6
2183	10	56	4	7
2191	17	65	4	6
2199	3	6	4	5
2207	11	73	3	34
2215	17	5	3	40
2223	20	30	9	228
2231	17	63	7	2
2239	7	12	7	2
2247	28	56	2	223
2255	5	59	4	136
2263	13	68	4	61
2271	20	2	4	5
2279	17	49	9	228
2287	9	27	7	2
2295	7	54	7	2
2303	23	48	4	5
2311	18	45	3	232
2319	2	38	4	19
2327	26	41	4	7
2335	10	37	4	7
2343	6	71	4	6
2351	20	43	7	1
2359	13	46	4	6
2367	13	59	5	3
2375	24	62	4	127
2383	11	13	5	3
2391	4	49	4	85
2399	11	11	4	6
2407	22	17	4	6
2415	13	24	4	5
2423	13	48	5	3
2431	18	16	6	4
2439	23	5	3	84
2447	27	64	7	1
2455	10	51	10	54
2463	6	72	4	6
2471	25	18	4	66
2479	19	5	4	199
2487	18	63	9	228
2495	5	55	4	116
2503	18	27	7	2
2511	5	45	3	232
1264	21	28	3	162
1272	15	26	4	7
1280	4	49	10	224
1288	5	29	4	6
1296	4	57	4	5
1304	12	3	4	6
1312	6	14	4	6
1320	24	74	4	7
1328	28	9	5	3
1336	16	42	7	2
1344	24	49	4	85
1352	8	31	9	228
1360	10	66	7	2
1368	6	11	12	96
1376	24	56	6	4
1384	3	56	3	146
1392	9	44	4	6
1400	8	13	4	7
1408	22	54	9	228
1416	9	2	9	228
1424	13	42	4	51
1432	8	57	4	79
1440	19	66	4	47
1448	11	39	3	22
1456	7	71	4	6
1464	8	20	4	113
1472	19	33	4	35
1480	19	16	5	3
1488	21	49	4	117
1496	9	20	9	228
1504	8	31	4	7
1512	8	10	4	7
1520	26	45	6	4
1528	2	23	7	2
1536	20	18	4	32
1544	21	59	5	3
1552	10	16	4	7
1560	28	74	4	5
1568	15	66	4	5
1576	25	42	5	3
1584	2	28	9	228
1592	25	10	3	204
1600	6	43	7	1
1608	25	17	4	180
1616	6	22	4	7
1624	22	62	6	4
1632	26	55	5	3
1640	2	10	9	228
1648	20	41	7	2
1656	26	2	4	5
1664	22	38	4	6
1672	17	18	4	103
1680	14	28	3	99
1688	16	50	4	5
1696	7	1	6	4
1704	5	29	6	206
1712	22	56	2	223
1720	6	30	6	4
1728	3	24	6	4
1736	27	6	4	49
1744	16	49	6	4
1752	12	45	6	4
1760	24	56	4	7
1768	17	23	9	228
1776	5	60	4	5
1784	24	49	4	45
1792	4	30	7	2
1800	25	60	4	5
1808	10	36	7	1
1816	8	33	4	6
1824	24	66	4	7
1832	3	73	7	1
1840	2	70	9	228
1848	21	22	6	4
1856	8	3	4	5
1864	14	51	5	3
1872	24	17	4	5
1880	25	9	4	7
1888	8	69	4	6
1896	20	4	3	20
1904	25	1	7	2
1912	28	69	5	3
1920	21	35	7	1
1928	14	59	4	5
1936	4	9	4	27
1944	14	34	4	5
1952	11	66	4	7
1960	23	1	5	3
1968	7	44	4	7
1976	24	16	6	4
1984	15	5	3	84
1992	25	5	6	4
2000	23	38	7	1
2008	7	18	4	32
2016	20	29	7	1
2024	14	5	4	5
2032	12	71	4	26
2040	3	63	7	2
2048	13	37	6	4
2056	26	10	4	5
2064	13	64	4	6
2072	18	30	4	7
2080	9	33	3	105
2088	18	55	9	228
2096	16	53	4	5
2104	21	43	4	6
2112	18	31	3	161
2120	11	52	3	95
2128	24	38	4	128
2136	12	1	4	7
2144	2	15	4	6
2152	18	5	12	177
2160	5	74	3	135
2168	23	47	7	2
2176	14	73	9	228
2184	2	72	4	5
2192	23	63	3	90
2200	10	48	4	7
2208	19	39	4	6
2216	26	9	6	4
2224	18	52	6	4
2232	25	38	4	94
2240	26	15	3	57
2248	6	51	7	2
2256	25	9	12	111
2264	5	8	4	55
2272	4	74	3	69
2280	7	54	4	7
2288	6	46	3	225
2296	18	34	4	7
2304	10	49	10	224
2312	27	61	4	52
2320	13	2	4	5
2328	14	9	5	3
2336	25	19	7	2
2344	24	57	3	18
2352	14	8	7	2
2360	15	4	5	3
2368	11	26	2	187
2376	19	13	5	3
2384	5	51	4	44
2392	6	15	3	57
2400	8	44	4	192
2408	17	5	12	171
2416	15	28	7	1
2424	27	35	4	6
2432	20	27	5	3
2440	14	55	3	144
2448	11	40	7	1
2456	12	22	7	2
2464	8	54	4	6
2472	19	31	3	161
2480	14	65	4	7
2488	14	69	6	4
2496	18	42	6	4
2504	6	32	4	6
2512	19	74	9	228
1268	23	26	4	7
1276	22	37	5	3
1284	22	35	4	6
1292	25	24	5	3
1300	15	50	2	213
1308	28	8	7	2
1316	28	53	4	6
1324	8	28	9	228
1332	26	1	4	7
1340	22	46	3	231
1348	28	5	3	84
1356	6	56	12	146
1364	13	54	7	2
1372	8	15	4	6
1380	5	17	4	180
1388	3	60	5	3
1396	23	39	7	2
1404	22	51	9	228
1412	11	48	9	228
1420	20	66	6	4
1428	16	10	4	7
1436	10	24	6	4
1444	27	19	3	12
1452	24	2	6	4
1460	27	30	6	4
1468	14	50	3	197
1476	25	20	4	5
1484	6	24	4	5
1492	8	10	6	4
1500	11	49	4	45
1508	28	51	6	4
1516	19	49	4	45
1524	16	28	5	3
1532	14	56	4	5
1540	14	67	7	1
1548	21	61	4	52
1556	15	22	5	3
1564	10	55	4	7
1572	16	27	12	191
1580	6	22	7	2
1588	7	24	4	5
1596	25	52	4	145
1604	4	59	4	7
1612	25	30	7	2
1620	19	40	7	1
1628	11	56	6	4
1636	11	27	9	228
1644	15	72	3	37
1652	12	73	3	34
1660	27	30	3	161
1668	12	46	3	225
1676	3	56	7	2
1684	23	4	9	228
1692	7	62	9	228
1700	4	56	9	228
1708	9	60	9	228
1716	19	73	3	34
1724	22	17	4	66
1732	9	39	4	140
1740	17	44	4	6
1748	28	70	4	60
1756	9	57	5	3
1764	12	66	6	4
1772	20	19	9	228
1780	19	30	4	7
1788	25	3	7	1
1796	2	22	3	8
1804	10	16	9	228
1812	20	37	9	228
1820	13	47	4	38
1828	10	52	6	4
1836	20	59	9	228
1844	10	74	3	69
1852	27	53	4	6
1860	20	13	4	5
1868	10	35	4	77
1876	28	53	4	198
1884	12	10	4	5
1892	18	44	12	179
1900	26	19	9	228
1908	2	42	12	108
1916	17	67	4	5
1924	18	56	6	4
1932	10	16	6	4
1940	13	23	4	5
1948	27	2	4	5
1956	17	36	7	1
1964	24	63	6	4
1972	19	74	3	135
1980	9	8	4	6
1988	3	12	4	141
1996	15	38	7	1
2004	14	62	6	4
2012	10	55	7	2
2020	7	42	4	51
2028	27	6	4	6
2036	13	56	4	5
2044	18	16	4	7
2052	17	28	3	161
2060	7	66	5	3
2068	17	45	4	7
2076	24	42	9	228
2084	10	51	4	44
2092	8	53	4	5
2100	14	46	3	231
2108	18	29	3	162
2116	22	5	3	84
2124	10	49	5	3
2132	5	29	7	1
2140	21	39	3	74
2148	27	37	9	228
2156	15	49	4	6
2164	28	10	3	219
2172	24	5	7	2
2180	17	74	7	2
2188	13	53	7	1
2196	7	59	5	3
2204	10	12	4	141
2212	23	7	7	2
2220	2	46	4	211
2228	19	45	9	228
2236	13	22	9	228
2244	6	59	9	228
2252	28	35	4	6
2260	27	21	7	1
2268	27	65	12	188
2276	16	27	3	123
2284	3	56	4	7
2292	17	46	4	211
2300	24	51	10	54
2308	3	24	4	7
2316	26	50	3	185
2324	7	41	4	7
2332	9	36	7	1
2340	10	52	9	228
2348	18	9	7	2
2356	24	30	7	2
2364	13	49	10	170
2372	14	68	4	61
2380	26	50	10	202
2388	23	17	7	1
2396	19	10	3	204
2404	4	55	4	10
2412	21	14	7	1
2420	21	1	6	4
2428	27	45	3	201
2436	8	22	3	8
2444	20	43	4	6
2452	7	59	6	4
2460	5	56	6	4
2468	2	31	6	4
2476	11	58	4	6
2484	28	42	4	51
2492	15	15	9	228
2500	13	41	9	228
2508	11	68	4	6
2516	22	39	3	74
1267	17	20	6	4
1275	21	21	7	1
1283	20	37	6	4
1291	25	59	4	136
1299	14	56	2	223
1307	28	59	4	5
1315	7	35	7	1
1323	15	18	7	2
1331	7	3	4	6
1339	27	10	3	153
1347	17	63	9	228
1355	9	74	7	2
1363	9	7	4	6
1371	7	25	4	6
1379	26	47	4	38
1387	23	68	4	7
1395	8	71	4	5
1403	27	73	4	7
1411	28	50	3	197
1419	4	44	12	179
1427	13	44	4	7
1435	3	54	4	6
1443	22	1	8	124
1451	10	45	4	7
1459	13	41	6	4
1467	4	36	4	6
1475	13	35	7	1
1483	25	62	7	2
1491	2	13	4	7
1499	5	66	4	47
1507	22	46	12	216
1515	9	65	3	125
1523	2	70	6	4
1531	21	24	4	5
1539	27	15	7	2
1547	19	52	4	145
1555	17	6	4	5
1563	22	30	3	161
1571	3	42	4	7
1579	4	56	4	7
1587	28	26	7	2
1595	25	41	7	2
1603	16	60	3	169
1611	5	37	4	7
1619	2	24	4	7
1627	26	45	12	229
1635	12	23	3	164
1643	24	34	9	228
1651	6	48	6	4
1659	2	56	3	223
1667	24	19	4	7
1675	18	52	5	3
1683	14	69	5	3
1691	17	56	12	214
1699	14	66	5	3
1707	17	55	7	2
1715	7	22	6	4
1723	28	17	4	66
1731	25	56	3	215
1739	3	23	4	7
1747	7	53	7	1
1755	4	31	3	161
1763	5	13	6	4
1771	13	61	4	6
1779	10	23	6	4
1787	24	18	4	103
1795	3	8	4	6
1803	12	62	4	7
1811	7	40	4	78
1819	8	9	6	129
1827	7	4	3	20
1835	14	53	7	1
1843	18	8	7	1
1851	14	6	4	49
1859	27	22	6	4
1867	9	67	4	5
1875	6	5	9	228
1883	26	31	4	5
1891	28	44	4	156
1899	25	27	9	228
1907	28	7	7	2
1915	9	60	5	3
1923	20	5	9	228
1931	14	12	5	3
1939	4	23	6	4
1947	21	59	6	4
1955	3	34	7	2
1963	17	46	4	5
1971	22	67	7	1
1979	16	15	4	6
1987	27	1	6	4
1995	23	57	7	1
2003	17	44	12	179
2011	17	73	7	1
2019	21	61	7	1
2027	14	1	5	3
2035	8	35	4	5
2043	18	36	4	6
2051	21	74	5	3
2059	23	7	4	7
2067	6	61	7	1
2075	14	16	4	25
2083	4	9	7	2
2091	24	28	3	184
2099	20	29	4	6
2107	12	56	12	146
2115	17	17	5	3
2123	24	43	12	101
2131	15	7	4	7
2139	9	45	4	7
2147	14	38	4	6
2155	12	11	12	96
2163	24	37	4	7
2171	9	42	9	228
2179	17	27	4	7
2187	8	48	4	81
2195	11	1	7	2
2203	14	17	4	66
2211	3	28	5	3
2219	5	16	6	4
2227	19	34	6	4
2235	18	62	3	97
2243	3	45	3	226
2251	26	37	6	4
2259	4	34	4	7
2267	19	39	3	22
2275	8	6	4	5
2283	16	56	12	214
2291	9	28	3	138
2299	3	45	4	230
2307	7	19	3	12
2315	21	2	4	5
2323	2	10	4	7
2331	27	62	6	4
2339	25	49	4	5
2347	3	39	4	140
2355	10	40	4	6
2363	11	66	4	47
2371	12	2	12	175
2379	15	58	7	2
2387	18	17	4	5
2395	28	30	5	3
2403	19	29	6	206
2411	27	37	5	3
2419	13	45	4	211
2427	24	52	5	3
2435	15	20	7	1
2443	3	31	9	228
2451	10	65	7	1
2459	3	38	5	3
2467	28	56	3	147
2475	28	1	5	3
2483	11	5	4	199
2491	4	26	4	6
2499	23	26	7	2
2507	4	55	4	7
2515	9	15	4	6
1266	21	62	9	228
1274	8	57	6	4
1282	21	19	3	12
1290	11	23	5	3
1298	16	73	4	6
1306	25	16	5	3
1314	25	72	7	1
1322	2	32	4	5
1330	9	34	7	2
1338	16	12	4	6
1346	25	66	4	7
1354	25	50	3	202
1362	2	73	4	6
1370	8	70	6	4
1378	20	47	4	38
1386	11	55	6	4
1394	14	47	7	2
1402	21	33	4	7
1410	24	34	4	7
1418	19	13	6	4
1426	11	5	9	228
1434	11	40	4	6
1442	4	5	7	2
1450	3	63	9	228
1458	27	51	9	228
1466	20	27	12	163
1474	10	57	4	5
1482	25	51	7	2
1490	27	28	3	162
1498	20	10	4	5
1506	9	23	4	7
1514	9	42	4	7
1522	11	10	3	204
1530	3	65	4	6
1538	25	11	4	6
1546	20	16	5	3
1554	4	66	7	2
1562	23	65	3	89
1570	23	65	4	7
1578	4	51	10	54
1586	6	66	9	228
1594	21	69	4	50
1602	10	30	7	2
1610	17	7	4	23
1618	3	16	4	7
1626	10	28	4	5
1634	7	74	5	3
1642	5	68	7	1
1650	16	67	5	3
1658	24	8	7	1
1666	18	19	4	7
1674	7	73	7	2
1682	16	23	7	2
1690	9	4	4	6
1698	13	19	3	12
1706	8	56	12	208
1714	23	70	4	6
1722	17	54	4	218
1730	7	19	5	3
1738	23	17	4	32
1746	13	33	4	7
1754	16	10	9	228
1762	4	42	6	4
1770	18	66	4	47
1778	2	24	7	2
1786	24	52	9	228
1794	5	37	4	30
1802	13	35	4	6
1810	12	1	7	2
1818	15	54	6	4
1826	20	34	5	3
1834	26	69	7	2
1842	3	65	3	125
1850	17	34	4	7
1858	14	62	5	3
1866	19	62	7	2
1874	4	55	4	116
1882	2	31	9	228
1890	16	69	4	6
1898	17	65	3	125
1906	8	44	7	1
1914	12	45	5	3
1922	12	30	6	4
1930	3	27	4	7
1938	12	9	6	4
1946	25	2	5	3
1954	26	19	6	4
1962	15	17	7	1
1970	10	55	4	116
1978	26	30	6	4
1986	12	32	7	1
1994	25	48	9	228
2002	4	7	4	6
2010	28	28	3	162
2018	24	45	7	2
2026	22	42	4	51
2034	4	18	4	66
2042	10	56	9	228
2050	22	10	3	153
2058	24	66	7	2
2066	28	56	4	5
2074	16	63	4	7
2082	3	27	7	2
2090	4	48	7	2
2098	16	28	9	228
2106	18	66	7	2
2114	3	44	4	192
2122	19	51	4	44
2130	18	51	10	54
2138	2	49	6	4
2146	9	10	3	178
2154	6	30	9	228
2162	16	42	12	108
2170	5	58	4	6
2178	11	51	4	44
2186	9	45	4	230
2194	27	46	12	216
2202	22	56	3	147
2210	19	58	4	6
2218	21	37	3	195
2226	9	63	7	2
2234	9	24	9	228
2242	8	61	4	5
2250	13	69	9	228
2258	28	44	9	228
2266	3	33	3	105
2274	24	38	4	5
2282	19	31	4	5
2290	14	28	7	1
2298	19	29	7	1
2306	5	55	6	4
2314	6	66	6	4
2322	17	42	4	7
2330	20	61	7	1
2338	11	29	6	206
2346	21	62	6	4
2354	22	54	6	4
2362	23	49	4	6
2370	9	6	4	5
2378	4	52	9	228
2386	26	51	7	2
2394	26	29	4	6
2402	20	65	12	188
2410	13	63	4	5
2418	13	62	6	4
2426	19	11	7	1
2434	4	12	4	141
2442	24	52	3	95
2450	18	49	5	3
2458	21	37	5	3
2466	16	39	4	140
2474	21	35	4	6
2482	9	5	3	40
2490	3	44	4	6
2498	12	59	9	228
2506	8	49	9	228
2514	4	17	4	5
1262	19	68	7	1
1270	6	69	4	7
1278	9	31	6	4
1286	14	62	9	228
1294	15	33	9	228
1302	18	33	3	71
1310	14	70	4	43
1318	24	46	3	216
1326	23	18	7	2
1334	10	29	3	162
1342	27	42	4	5
1350	22	73	4	7
1358	18	56	4	7
1366	28	28	7	1
1374	4	52	5	3
1382	7	46	4	6
1390	23	18	4	193
1398	21	10	3	153
1406	16	13	4	7
1414	17	33	7	1
1422	5	66	4	7
1430	9	27	3	123
1438	22	46	4	6
1446	11	8	4	55
1454	3	22	3	137
1462	7	69	9	228
1470	25	59	7	2
1478	28	38	4	6
1486	7	39	3	74
1494	11	29	7	1
1502	10	45	3	232
1510	10	44	12	179
1518	5	18	4	66
1526	4	16	4	7
1534	23	40	7	2
1542	4	19	4	7
1550	28	67	7	1
1558	9	25	4	5
1566	24	44	12	179
1574	24	55	6	4
1582	2	63	7	2
1590	21	37	9	228
1598	13	6	4	49
1606	13	16	4	5
1614	9	7	4	23
1622	26	52	4	5
1630	20	50	10	202
1638	21	11	4	58
1646	9	56	12	174
1654	15	1	8	124
1662	14	7	7	2
1670	4	35	4	77
1678	4	63	6	4
1686	25	26	2	187
1694	21	21	4	6
1702	6	9	6	4
1710	13	37	5	3
1718	17	23	6	4
1726	6	10	3	210
1734	16	2	7	2
1742	13	62	9	228
1750	9	36	3	182
1758	2	25	5	3
1766	23	36	7	2
1774	21	33	7	2
1782	8	63	7	2
1790	17	16	4	7
1798	27	55	3	144
1806	11	31	3	161
1814	20	1	7	2
1822	11	34	6	4
1830	21	22	9	228
1838	22	33	4	7
1846	18	38	4	5
1854	22	56	4	5
1862	22	8	7	2
1870	7	46	7	1
1878	14	73	6	4
1886	20	21	7	1
1894	3	23	9	228
1902	13	22	6	4
1910	27	53	7	1
1918	24	68	7	1
1926	24	39	4	6
1934	13	61	4	52
1942	24	65	7	1
1950	17	63	4	7
1958	2	54	4	6
1966	22	26	7	2
1974	26	11	12	96
1982	20	10	3	210
1990	3	38	4	19
1998	18	9	4	27
2006	10	10	5	3
2014	28	4	9	228
2022	17	5	3	143
2030	19	29	3	162
2038	19	37	4	30
2046	19	48	7	2
2054	27	70	4	60
2062	2	42	7	2
2070	4	7	7	1
2078	2	14	4	5
2086	24	40	4	6
2094	8	23	7	2
2102	6	65	12	188
2110	15	4	9	228
2118	5	62	4	127
2126	2	53	4	5
2134	27	46	3	225
2142	10	48	7	2
2150	28	69	6	4
2158	4	36	7	1
2166	16	28	6	4
2174	12	19	9	228
2182	11	2	5	3
2190	15	8	4	7
2198	7	15	7	2
2206	13	6	4	6
2214	2	28	6	4
2222	25	10	4	5
2230	7	61	4	52
2238	10	42	6	4
2246	5	33	3	71
2254	3	35	4	134
2262	2	38	6	4
2270	22	6	7	1
2278	28	4	6	4
2286	11	50	3	202
2294	3	54	4	218
2302	16	10	6	4
2310	18	49	10	224
2318	27	37	6	4
2326	5	11	7	1
2334	21	15	7	2
2342	16	56	3	223
2350	8	60	3	169
2358	25	22	7	2
2366	21	49	10	170
2374	27	48	5	3
2382	5	39	4	6
2390	19	66	4	7
2398	22	74	4	5
2406	24	48	7	2
2414	7	47	4	38
2422	19	18	4	66
2430	12	43	7	1
2438	19	9	7	2
2446	14	45	4	5
2454	19	68	4	6
2462	13	27	4	5
2470	10	59	4	7
2478	4	20	5	3
2486	19	52	5	3
2494	13	25	3	165
2502	2	16	3	57
2510	21	10	3	190
2057	17	53	4	5
2065	15	68	7	2
2073	14	47	4	7
2081	6	59	6	4
2089	12	45	9	228
2097	17	20	9	228
2105	17	34	7	2
2113	8	38	4	19
2121	7	43	4	6
2129	14	35	4	6
2137	16	63	7	2
2145	18	59	4	7
2153	2	60	3	169
2161	22	65	7	2
2169	7	19	6	4
2177	22	66	5	3
2185	25	30	4	7
2193	10	27	7	2
2201	4	68	7	1
2209	7	45	5	3
2217	26	2	12	175
2225	15	69	5	3
2233	4	56	7	2
2241	16	20	9	228
2249	21	30	6	4
2257	20	45	4	222
2265	21	28	3	99
2273	26	74	3	135
2281	9	23	12	137
2289	7	66	9	228
2297	7	27	4	5
2305	5	48	4	7
2313	12	4	3	20
2321	10	49	4	85
2329	12	65	12	188
2337	15	1	5	3
2345	25	48	6	4
2353	22	19	4	5
2361	20	31	4	5
2369	3	4	4	6
2377	23	15	6	4
2385	15	40	13	78
2393	11	62	4	127
2401	4	29	3	162
2409	26	62	7	2
2417	2	28	3	138
2425	10	43	12	101
2433	20	30	6	4
2441	3	70	6	4
2449	25	45	9	228
2457	15	53	4	198
2465	3	74	3	100
2473	18	36	7	1
2481	16	9	6	129
2489	22	65	4	7
2497	22	53	7	1
2505	9	63	6	4
2513	3	54	7	1
2521	8	31	6	207
2529	11	56	3	215
2537	3	24	9	228
2545	19	59	4	7
2553	25	49	4	85
2561	15	65	9	228
2569	2	12	7	1
2577	22	36	7	2
2585	20	45	9	228
2593	26	54	6	4
2601	16	44	3	179
2609	4	28	5	3
2617	24	65	12	188
2625	17	69	7	1
2633	11	45	3	226
2641	3	34	6	4
2649	27	41	5	3
2657	28	56	12	215
2665	7	4	4	7
2673	20	52	4	5
2681	22	8	4	7
2689	16	22	3	8
2697	23	50	3	197
2705	17	25	4	5
2713	5	49	4	85
2721	28	53	7	1
2729	4	37	7	2
2737	9	44	12	179
2745	17	17	4	5
2753	27	11	4	6
2761	23	39	6	4
2769	18	62	7	2
2777	26	60	4	5
2785	5	60	9	228
2793	7	56	3	147
2801	5	22	4	7
2809	20	29	3	162
2817	19	5	12	171
2825	22	43	7	1
2833	3	34	9	228
2841	20	52	9	228
2849	20	30	3	161
2857	14	44	7	2
2865	19	19	7	2
2873	28	46	7	1
2881	24	35	4	134
2889	28	65	4	7
2897	6	19	6	4
2905	27	12	4	7
2913	23	65	9	228
2921	25	37	4	7
2929	10	2	9	228
2937	26	3	7	1
2945	27	30	5	3
2953	11	54	7	2
2961	25	62	6	4
2969	15	24	4	112
2977	25	60	6	4
2985	9	18	4	66
2993	26	13	9	228
3001	25	49	4	117
3009	19	17	4	160
3017	4	72	4	6
3025	20	52	5	3
3033	14	8	6	4
3041	9	39	4	6
3049	8	56	12	174
3057	14	18	4	7
3065	2	49	4	85
3073	2	35	6	4
3081	2	68	4	5
3089	23	7	4	102
3097	23	27	4	5
3105	12	55	3	144
3113	28	39	4	7
3121	18	30	9	228
3129	6	37	7	2
3137	20	11	4	6
3145	19	5	3	40
3153	3	67	5	3
3161	28	4	3	20
3169	15	2	7	1
3177	26	65	4	7
3185	3	55	4	116
3193	12	27	6	4
3201	24	28	3	138
3209	25	13	6	4
3217	16	65	3	188
3225	9	20	4	7
3233	15	10	4	6
3241	20	64	4	6
3249	20	2	12	175
3257	5	36	4	6
3265	10	66	4	7
3273	28	62	6	4
3281	2	14	4	25
3289	18	74	4	7
3297	27	19	5	3
3305	26	34	5	3
1693	20	56	12	146
1701	19	48	4	7
1709	6	21	7	1
1717	2	67	5	3
1725	6	27	5	3
1733	6	39	3	22
1741	10	68	7	1
1749	23	70	4	43
1757	4	16	9	228
1765	21	37	6	4
1773	9	47	4	6
1781	15	47	4	7
1789	25	29	6	206
1797	7	6	4	6
1805	4	43	12	101
1813	24	10	3	204
1821	12	34	5	3
1829	20	50	4	6
1837	17	57	5	3
1845	14	25	7	1
1853	9	63	11	90
1861	17	60	5	3
1869	18	40	4	6
1877	9	27	3	149
1885	26	5	6	4
1893	18	49	4	85
1901	7	69	4	50
1909	22	45	4	211
1917	16	31	6	4
1925	22	69	9	228
1933	24	52	6	4
1941	7	46	3	225
1949	20	15	3	57
1957	13	15	7	2
1965	11	49	4	5
1973	20	11	12	96
1981	25	32	4	6
1989	19	49	4	85
1997	27	51	6	4
2005	22	10	3	219
2013	24	42	6	4
2021	21	6	4	6
2029	16	17	5	3
2037	5	56	3	215
2045	11	18	4	6
2053	15	65	7	2
2061	14	36	4	7
2069	17	5	7	2
2077	28	48	4	5
2085	3	67	4	5
2093	9	56	12	214
2101	15	14	3	57
2109	17	4	4	6
2117	8	50	4	5
2125	14	12	9	228
2133	17	45	4	230
2141	11	46	3	222
2149	23	44	9	228
2157	17	24	4	7
2165	5	9	7	2
2173	24	66	4	47
2181	22	28	3	162
2189	5	13	5	3
2197	19	56	3	215
2205	26	10	3	210
2213	12	50	4	6
2221	13	37	3	195
2229	11	52	5	3
2237	21	41	9	228
2245	15	8	7	2
2253	14	30	3	161
2261	12	45	4	222
2269	28	6	7	1
2277	16	45	3	200
2285	14	57	4	6
2293	13	46	7	1
2301	22	73	6	4
2309	24	49	5	3
2317	27	61	4	6
2325	2	27	12	191
2333	26	3	4	6
2341	14	26	7	2
2349	16	4	7	1
2357	12	10	3	210
2365	15	11	4	7
2373	27	63	4	5
2381	18	55	4	116
2389	4	74	7	2
2397	27	46	4	6
2405	21	45	3	201
2413	18	52	9	228
2421	11	60	4	5
2429	8	24	7	2
2437	27	12	9	228
2445	4	38	4	128
2453	23	44	4	156
2461	16	56	12	208
2469	27	56	4	5
2477	21	25	3	165
2485	9	10	6	4
2493	17	60	6	4
2501	23	69	5	3
2509	8	39	4	140
2517	10	7	4	6
2525	28	19	4	5
2533	17	48	4	81
2541	10	63	6	4
2549	11	59	4	7
2557	15	36	7	2
2565	26	22	4	7
2573	6	52	4	5
2581	21	54	7	2
2589	7	29	7	1
2597	15	28	3	162
2605	27	40	7	2
2613	3	58	4	6
2621	25	41	6	4
2629	27	65	3	89
2637	5	41	9	228
2645	7	26	7	2
2653	5	19	7	2
2661	16	61	4	5
2669	13	25	4	6
2677	7	37	3	195
2685	16	15	7	1
2693	10	33	4	35
2701	5	40	7	1
2709	8	27	12	191
2717	25	4	4	121
2725	15	44	6	4
2733	3	20	9	228
2741	27	15	4	7
2749	8	15	7	1
2757	21	65	3	89
2765	13	27	5	3
2773	5	45	4	7
2781	2	60	4	7
2789	7	51	4	44
2797	20	65	7	2
2805	17	74	6	4
2813	2	19	4	6
2821	5	46	4	6
2829	26	56	3	147
2837	22	31	4	6
2845	19	33	7	2
2853	21	47	7	2
2861	20	21	4	6
2869	3	25	4	5
2877	19	30	7	2
2885	27	4	4	7
2893	11	17	4	160
2901	17	5	4	7
2909	3	7	4	23
2917	9	45	3	226
2925	6	56	5	3
2933	18	68	4	6
2941	14	8	4	7
2519	4	27	3	149
2527	10	18	4	66
2535	11	22	7	2
2543	10	37	7	2
2551	20	41	4	7
2559	24	34	7	2
2567	24	62	3	97
2575	9	22	3	8
2583	5	22	7	2
2591	27	68	4	6
2599	8	55	4	116
2607	20	68	7	1
2615	24	5	3	143
2623	10	44	4	192
2631	26	51	10	54
2639	3	17	4	5
2647	11	46	3	225
2655	26	21	4	6
2663	9	73	7	1
2671	11	10	4	5
2679	12	29	6	206
2687	26	40	4	78
2695	17	44	4	192
2703	20	9	6	4
2711	8	16	3	57
2719	6	48	9	228
2727	14	42	4	51
2735	25	16	6	4
2743	28	47	7	2
2751	13	65	3	89
2759	4	15	3	57
2767	21	51	4	44
2775	11	28	4	5
2783	19	39	3	74
2791	22	18	4	193
2799	4	26	2	187
2807	23	5	4	5
2815	28	19	5	3
2823	3	51	7	1
2831	24	1	4	7
2839	6	29	3	162
2847	12	66	5	3
2855	11	1	9	228
2863	25	40	7	1
2871	27	34	4	5
2879	18	48	4	7
2887	13	10	3	153
2895	26	18	4	32
2903	2	58	4	114
2911	3	17	5	3
2919	17	49	6	4
2927	3	65	7	1
2935	20	17	4	180
2943	11	51	4	7
2951	16	19	4	6
2959	20	8	7	2
2967	21	70	4	60
2975	3	55	6	4
2983	25	5	3	40
2991	26	52	6	4
2999	2	42	6	4
3007	18	45	4	230
3015	2	7	4	6
3023	14	43	4	6
3031	27	5	6	4
3039	14	9	4	5
3047	27	37	7	2
3055	26	74	4	5
3063	18	63	5	3
3071	13	17	7	1
3079	23	18	9	228
3087	15	44	4	7
3095	6	27	3	149
3103	10	17	4	180
3111	2	66	4	47
3119	23	40	9	228
3127	11	43	12	101
3135	6	16	4	5
3143	20	46	7	1
3151	16	56	3	215
3159	22	56	3	196
3167	11	12	4	141
3175	17	16	6	4
3183	17	49	4	45
3191	19	13	4	7
3199	26	6	4	6
3207	4	60	6	4
3215	11	17	4	103
3223	2	33	4	35
3231	4	52	7	2
3239	27	31	3	162
3247	5	48	5	3
3255	23	58	7	2
3263	3	62	3	97
3271	5	51	10	54
3279	10	17	4	5
3287	18	55	4	7
3295	9	2	4	7
3303	12	60	4	5
3311	16	43	4	5
3319	2	23	4	7
3327	6	49	10	170
3335	12	6	4	49
3343	28	59	5	3
3351	20	38	4	6
3359	8	19	4	6
3367	6	8	7	2
3375	22	55	4	80
3383	18	49	4	5
3391	10	26	2	187
3399	18	66	6	4
3407	6	73	4	7
3415	14	35	7	1
3423	17	12	7	1
3431	26	20	4	5
3439	5	45	4	230
3447	18	31	4	5
3455	2	55	4	10
3463	2	55	7	2
3471	6	22	5	3
3479	21	38	4	6
3487	18	55	5	3
3495	25	71	4	6
3503	3	66	4	7
3511	6	34	4	5
3519	11	56	12	215
3527	22	26	9	228
3535	2	69	7	1
3543	17	56	6	4
3551	24	22	7	2
3559	7	45	9	228
3567	9	60	3	169
3575	16	43	3	101
3583	2	57	4	5
3591	6	36	4	6
3599	19	56	2	223
3607	8	20	4	7
3615	22	10	4	6
3623	25	28	3	161
3631	4	43	3	21
3639	7	22	3	8
3647	5	1	6	4
3655	13	49	4	6
3663	16	59	4	7
3671	22	43	4	7
3679	23	67	7	2
3687	8	12	7	2
3695	25	28	3	162
3703	8	59	9	228
3711	2	16	5	3
3719	19	36	7	2
3727	27	12	4	5
3735	9	17	4	180
3743	23	39	4	6
3751	2	19	6	4
3759	28	74	3	16
3767	25	36	7	2
2523	7	35	4	6
2531	12	55	5	3
2539	24	29	3	162
2547	16	18	4	180
2555	5	31	3	161
2563	21	66	6	4
2571	22	12	9	228
2579	23	73	9	228
2587	14	54	6	4
2595	27	48	4	5
2603	24	39	3	22
2611	18	18	4	32
2619	25	15	7	2
2627	16	56	4	7
2635	18	43	3	21
2643	6	45	3	232
2651	20	52	6	4
2659	25	18	7	1
2667	10	49	2	217
2675	28	33	6	4
2683	2	39	4	140
2691	25	52	5	3
2699	10	10	3	204
2707	12	45	12	229
2715	21	42	4	5
2723	26	29	6	206
2731	18	47	7	1
2739	3	55	7	2
2747	14	19	4	5
2755	3	69	7	1
2763	12	50	3	197
2771	26	7	7	2
2779	5	20	5	3
2787	11	1	6	4
2795	21	68	4	6
2803	11	2	4	5
2811	14	47	9	228
2819	28	54	3	221
2827	19	34	5	3
2835	16	5	3	177
2843	13	15	9	228
2851	17	45	3	200
2859	11	38	4	94
2867	7	23	4	5
2875	18	57	3	18
2883	26	49	10	170
2891	25	9	4	27
2899	4	28	4	5
2907	15	47	7	2
2915	17	2	9	228
2923	9	55	7	2
2931	11	30	7	2
2939	25	46	3	222
2947	6	44	12	179
2955	11	36	7	1
2963	28	19	3	12
2971	26	54	4	7
2979	22	30	4	5
2987	26	33	6	4
2995	12	46	12	216
3003	27	10	3	219
3011	6	39	3	74
3019	23	35	4	6
3027	25	44	4	6
3035	25	1	6	4
3043	2	23	6	4
3051	10	66	6	4
3059	16	66	4	47
3067	5	5	3	40
3075	16	65	3	125
3083	21	50	3	197
3091	24	4	7	1
3099	20	8	4	7
3107	5	28	5	3
3115	22	33	5	3
3123	14	15	6	4
3131	15	31	4	6
3139	3	48	4	7
3147	8	8	4	6
3155	7	68	4	6
3163	24	32	4	6
3171	13	33	6	4
3179	25	1	4	7
3187	5	42	4	5
3195	25	30	9	228
3203	10	25	3	139
3211	6	68	4	6
3219	19	66	5	3
3227	27	73	9	228
3235	19	1	7	2
3243	21	1	8	124
3251	8	31	5	3
3259	23	40	13	78
3267	26	17	4	180
3275	25	29	7	1
3283	19	16	6	4
3291	7	66	6	4
3299	4	45	7	2
3307	4	13	9	228
3315	17	56	7	2
3323	20	71	4	26
3331	19	50	10	202
3339	24	47	4	38
3347	10	62	7	2
3355	18	30	6	4
3363	3	46	3	216
3371	11	34	5	3
3379	2	10	3	178
3387	25	73	7	2
3395	26	46	3	231
3403	12	64	7	1
3411	13	1	5	3
3419	2	65	3	125
3427	24	66	3	86
3435	21	69	4	7
3443	3	56	6	4
3451	6	51	10	54
3459	5	56	5	3
3467	5	60	6	4
3475	27	13	5	3
3483	2	63	11	90
3491	3	74	3	69
3499	10	74	5	3
3507	12	64	4	6
3515	15	32	7	2
3523	26	27	9	228
3531	11	65	12	188
3539	2	34	4	7
3547	28	55	3	159
3555	5	71	4	6
3563	15	46	4	230
3571	7	27	9	228
3579	5	2	4	5
3587	8	52	10	154
3595	9	23	5	3
3603	18	74	3	135
3611	25	50	4	6
3619	7	69	7	2
3627	13	41	5	3
3635	19	55	5	3
3643	27	29	4	7
3651	17	10	3	190
3659	22	32	7	2
3667	27	7	4	23
3675	13	11	4	7
3683	8	7	4	65
3691	5	65	4	173
3699	19	63	4	7
3707	4	71	4	5
3715	6	72	3	37
3723	16	52	5	3
3731	19	14	4	25
3739	14	42	4	6
3747	7	29	6	207
3755	25	23	4	7
3763	20	54	4	6
3771	22	67	4	41
2520	13	4	4	7
2528	9	27	4	7
2536	9	48	4	81
2544	27	37	3	195
2552	10	45	7	2
2560	18	45	7	2
2568	19	52	3	95
2576	3	22	3	8
2584	2	18	4	180
2592	27	5	9	228
2600	27	43	7	1
2608	11	60	5	3
2616	2	74	7	2
2624	11	44	4	6
2632	13	27	9	228
2640	16	56	12	174
2648	18	39	3	22
2656	2	49	9	228
2664	4	46	3	216
2672	13	14	7	1
2680	19	60	4	5
2688	11	46	3	216
2696	22	68	4	61
2704	4	56	3	215
2712	3	74	7	2
2720	19	55	4	116
2728	12	52	4	5
2736	14	16	4	5
2744	27	56	3	147
2752	11	46	4	6
2760	28	35	7	1
2768	19	54	7	2
2776	26	68	7	1
2784	20	5	12	177
2792	23	46	4	227
2800	6	30	3	161
2808	10	30	9	228
2816	5	24	4	5
2824	20	54	6	4
2832	15	22	4	5
2840	8	16	9	228
2848	16	63	6	4
2856	8	26	4	6
2864	25	74	3	69
2872	3	15	4	6
2880	12	22	4	7
2888	12	37	4	30
2896	26	71	4	26
2904	12	61	4	6
2912	7	9	6	4
2920	25	49	4	45
2928	20	32	4	6
2936	16	24	4	7
2944	18	18	4	66
2952	23	28	3	162
2960	28	72	7	2
2968	2	20	4	7
2976	2	63	6	4
2984	5	54	7	2
2992	9	55	6	4
3000	26	34	4	5
3008	2	44	3	179
3016	26	30	5	3
3024	4	44	7	1
3032	26	50	3	197
3040	23	61	4	52
3048	19	22	4	7
3056	8	49	4	85
3064	20	64	7	1
3072	16	70	5	3
3080	28	12	7	2
3088	15	7	4	102
3096	21	57	4	6
3104	10	32	4	6
3112	10	60	9	228
3120	23	54	10	221
3128	21	43	7	1
3136	10	34	5	3
3144	12	52	6	4
3152	10	63	4	5
3160	22	37	9	228
3168	22	40	4	7
3176	23	72	7	2
3184	21	66	4	5
3192	10	23	4	5
3200	8	47	7	1
3208	4	46	3	225
3216	21	72	3	37
3224	21	19	4	7
3232	9	42	6	4
3240	8	41	13	109
3248	27	35	4	77
3256	10	52	4	7
3264	3	2	9	228
3272	7	22	9	228
3280	21	34	4	5
3288	2	42	4	7
3296	22	9	5	3
3304	19	18	7	1
3312	28	1	9	228
3320	9	43	12	101
3328	20	14	7	1
3336	10	2	5	3
3344	11	41	6	4
3352	16	5	3	171
3360	26	43	12	101
3368	26	66	5	3
3376	3	66	4	47
3384	3	62	4	127
3392	12	30	3	161
3400	9	45	3	200
3408	4	30	6	4
3416	20	37	4	7
3424	4	46	3	222
3432	27	3	7	1
3440	10	22	7	2
3448	26	15	4	7
3456	3	57	4	5
3464	17	34	6	4
3472	28	27	5	3
3480	26	4	4	121
3488	18	58	4	6
3496	21	27	12	163
3504	16	41	13	109
3512	8	65	7	1
3520	14	70	4	6
3528	4	39	3	22
3536	23	59	5	3
3544	19	28	3	138
3552	26	33	4	7
3560	27	54	6	4
3568	14	69	4	7
3576	16	65	7	1
3584	25	16	4	25
3592	28	65	3	89
3600	25	60	5	3
3608	28	39	7	2
3616	20	11	7	1
3624	10	9	9	228
3632	10	50	7	1
3640	2	50	10	202
3648	3	48	5	3
3656	21	68	6	4
3664	8	34	5	3
3672	24	56	12	215
3680	7	7	7	1
3688	22	53	10	203
3696	23	32	9	228
3704	3	29	6	206
3712	3	46	3	232
3720	9	44	7	2
3728	16	51	7	2
3736	26	38	4	19
3744	2	9	4	27
3752	19	1	8	124
3760	10	30	4	6
3768	19	39	3	107
2524	5	10	3	204
2532	4	45	3	232
2540	15	33	6	4
2548	3	35	4	5
2556	10	34	7	2
2564	20	5	6	4
2572	26	37	9	228
2580	3	20	5	3
2588	15	70	4	6
2596	16	55	4	116
2604	25	55	3	144
2612	12	54	9	228
2620	9	66	4	47
2628	28	30	4	5
2636	19	62	4	7
2644	17	8	4	55
2652	2	56	4	7
2660	2	10	7	2
2668	11	18	7	1
2676	23	28	7	1
2684	12	19	6	4
2692	4	62	3	97
2700	13	34	4	5
2708	19	37	4	7
2716	23	66	4	5
2724	9	5	3	143
2732	24	47	7	1
2740	14	65	4	173
2748	22	12	5	3
2756	19	46	4	6
2764	15	63	4	6
2772	10	30	6	4
2780	26	17	4	66
2788	7	52	3	95
2796	8	63	6	4
2804	15	7	3	155
2812	4	65	12	188
2820	9	10	3	204
2828	7	5	9	228
2836	2	21	5	3
2844	12	65	7	2
2852	17	67	9	228
2860	5	52	5	3
2868	10	70	5	3
2876	5	52	3	95
2884	5	34	6	4
2892	22	56	12	215
2900	20	37	4	30
2908	18	70	5	3
2916	12	69	4	50
2924	14	51	6	4
2932	21	4	4	7
2940	12	49	10	170
2948	9	67	5	3
2956	21	52	3	95
2964	4	4	7	1
2972	25	29	3	162
2980	26	5	12	177
2988	25	46	3	225
2996	23	71	7	2
3004	22	9	4	5
3012	14	45	5	3
3020	3	73	3	34
3028	8	63	9	228
3036	23	53	7	1
3044	11	45	4	230
3052	18	50	4	6
3060	10	22	4	7
3068	25	25	3	165
3076	28	41	4	5
3084	2	2	9	228
3092	22	18	4	133
3100	4	28	6	4
3108	17	31	3	161
3116	20	66	5	3
3124	19	42	4	5
3132	13	43	7	1
3140	19	62	6	4
3148	4	56	5	3
3156	10	71	4	26
3164	20	55	3	144
3172	10	49	4	5
3180	27	26	7	2
3188	17	58	7	1
3196	19	9	9	228
3204	15	47	5	3
3212	15	26	9	228
3220	21	37	4	7
3228	9	50	3	185
3236	13	27	12	163
3244	26	22	6	4
3252	2	28	7	2
3260	5	25	7	1
3268	2	31	4	7
3276	22	27	4	5
3284	17	28	5	3
3292	7	2	12	175
3300	27	54	7	2
3308	28	12	9	228
3316	10	8	4	6
3324	11	32	7	1
3332	20	48	5	3
3340	26	52	4	145
3348	25	5	12	171
3356	10	5	3	143
3364	8	60	4	7
3372	27	8	4	7
3380	18	22	7	2
3388	23	22	4	5
3396	8	42	6	4
3404	10	39	3	22
3412	4	5	3	143
3420	16	53	9	228
3428	4	13	4	7
3436	26	42	4	51
3444	5	46	3	225
3452	21	37	7	2
3460	22	65	6	4
3468	9	69	4	6
3476	26	67	4	5
3484	13	37	4	7
3492	25	56	12	215
3500	28	14	3	57
3508	28	65	6	4
3516	22	40	7	2
3524	21	22	5	3
3532	27	1	8	124
3540	13	38	4	6
3548	27	63	3	90
3556	5	30	6	4
3564	10	31	4	5
3572	6	52	3	95
3580	2	38	4	5
3588	6	25	7	1
3596	5	10	3	210
3604	22	13	4	5
3612	17	9	12	111
3620	14	65	3	89
3628	12	15	7	2
3636	23	7	3	155
3644	14	35	7	2
3652	23	23	3	164
3660	24	46	9	228
3668	22	63	9	228
3676	14	63	9	228
3684	5	1	8	124
3692	3	25	3	139
3700	14	25	4	67
3708	2	72	7	1
3716	4	22	7	1
3724	17	73	4	7
3732	7	4	5	3
3740	8	51	7	2
3748	6	70	5	3
3756	19	38	6	4
3764	23	56	12	196
3772	13	54	4	218
2949	3	43	3	101
2957	15	25	4	104
2965	16	51	7	1
2973	16	35	5	3
2981	19	24	4	5
2989	20	16	4	5
2997	17	48	4	7
3005	23	1	4	5
3013	7	8	4	7
3021	8	29	4	5
3029	3	9	7	2
3037	17	18	4	66
3045	3	10	5	3
3053	25	2	4	5
3061	24	50	3	185
3069	16	57	3	18
3077	19	56	12	215
3085	2	46	3	216
3093	6	38	7	1
3101	27	9	4	5
3109	2	55	4	7
3117	6	45	7	2
3125	19	22	9	228
3133	25	15	4	7
3141	16	23	6	4
3149	4	71	4	26
3157	13	40	7	2
3165	27	54	9	228
3173	17	63	5	3
3181	25	42	4	51
3189	23	65	6	4
3197	3	39	3	22
3205	5	9	5	3
3213	4	5	3	40
3221	12	16	4	25
3229	10	55	5	3
3237	25	45	3	229
3245	15	4	4	7
3253	18	28	3	138
3261	7	35	4	77
3269	24	10	5	3
3277	26	1	7	2
3285	5	38	4	94
3293	9	44	4	192
3301	24	45	3	232
3309	25	27	6	4
3317	20	29	6	206
3325	2	74	3	100
3333	17	62	4	127
3341	23	14	7	2
3349	23	63	4	6
3357	8	5	3	171
3365	18	70	4	5
3373	12	11	7	1
3381	22	47	6	4
3389	5	45	3	226
3397	28	18	4	7
3405	6	12	4	141
3413	16	52	10	154
3421	2	61	5	3
3429	28	19	6	4
3437	11	50	7	1
3445	23	15	5	3
3453	9	66	4	7
3461	18	50	3	185
3469	2	67	6	4
3477	18	23	3	164
3485	6	35	4	134
3493	28	18	7	2
3501	23	46	4	230
3509	20	74	4	5
3517	6	4	4	121
3525	19	40	4	78
3533	9	43	4	5
3541	6	19	4	7
3549	28	70	4	6
3557	17	2	5	3
3565	15	49	3	151
3573	14	65	6	4
3581	12	7	7	2
3589	25	33	4	7
3597	18	52	4	7
3605	4	4	4	6
3613	27	7	4	7
3621	19	10	3	210
3629	5	32	7	1
3637	5	49	4	117
3645	4	6	5	3
3653	9	32	4	6
3661	17	14	9	228
3669	2	35	4	77
3677	21	21	7	2
3685	25	63	4	7
3693	4	46	12	229
3701	4	68	4	61
3709	6	33	6	4
3717	5	38	5	3
3725	10	19	5	3
3733	28	40	6	4
3741	6	20	4	6
3749	15	55	6	4
3757	9	45	3	201
3765	8	13	5	3
3773	22	25	4	104
3781	22	56	12	147
3789	3	2	4	5
3797	18	4	7	2
3805	3	56	5	3
3813	10	19	3	12
3821	28	40	4	39
3829	14	56	4	172
3837	27	55	4	7
3845	10	56	2	223
3853	15	45	4	6
3861	20	27	3	53
3869	7	49	3	151
3877	2	66	4	7
3885	16	68	4	6
3893	24	31	4	7
3901	12	4	9	228
3909	5	12	5	3
3917	19	44	4	156
3925	8	9	4	7
3933	10	65	7	2
3941	24	46	3	201
3949	9	59	9	228
3957	10	31	7	2
3965	5	19	4	5
3973	9	34	5	3
3981	21	32	7	2
3989	8	56	12	146
3997	23	56	3	122
4005	24	51	9	228
4013	15	5	4	6
4021	14	64	4	7
4029	25	59	4	5
4037	21	38	4	128
4045	8	52	4	145
4053	11	57	4	6
4061	15	45	3	231
4069	6	38	5	3
4077	7	68	6	4
4085	5	68	4	61
4093	24	33	7	2
4101	4	51	6	4
4109	16	69	7	2
4117	3	19	5	3
4125	7	38	4	5
4133	8	45	9	228
4141	2	38	9	228
4149	11	59	5	3
4157	6	31	3	161
4165	10	45	12	229
4173	10	27	6	4
4181	3	56	2	223
4189	25	12	7	2
4197	28	65	4	5
2518	4	59	7	2
2526	14	56	3	147
2534	26	56	5	3
2542	25	55	9	228
2550	13	73	7	2
2558	14	4	9	228
2566	2	4	7	1
2574	24	49	2	217
2582	20	22	4	7
2590	3	12	7	1
2598	25	12	4	141
2606	18	44	7	1
2614	11	20	6	4
2622	17	43	3	101
2630	7	47	7	2
2638	4	50	4	6
2646	18	9	4	7
2654	10	62	3	97
2662	26	66	6	4
2670	11	27	6	4
2678	15	12	5	3
2686	16	74	3	100
2694	28	8	4	7
2702	18	10	3	204
2710	25	58	4	6
2718	13	42	4	5
2726	8	12	7	1
2734	25	63	5	3
2742	22	1	5	3
2750	10	56	6	4
2758	6	10	3	153
2766	3	18	4	66
2774	12	20	4	5
2782	3	66	7	2
2790	13	15	6	4
2798	17	57	4	5
2806	25	36	7	1
2814	27	39	7	2
2822	27	69	4	7
2830	21	45	9	228
2838	24	62	7	2
2846	10	65	12	188
2854	6	41	6	4
2862	3	46	4	5
2870	24	55	4	116
2878	6	43	4	6
2886	14	7	4	7
2894	20	69	4	50
2902	17	13	4	7
2910	9	70	6	4
2918	21	42	4	51
2926	19	66	3	86
2934	6	37	4	30
2942	26	14	7	1
2950	14	61	7	1
2958	6	37	4	7
2966	12	68	7	1
2974	13	11	12	96
2982	10	71	4	6
2990	12	73	4	7
2998	20	46	3	231
3006	15	61	4	52
3014	6	11	7	1
3022	9	61	4	5
3030	7	7	7	2
3038	7	65	3	89
3046	26	30	3	161
3054	22	58	4	7
3062	26	54	9	228
3070	19	1	9	228
3078	17	20	7	2
3086	25	43	12	101
3094	22	3	7	1
3102	18	74	6	4
3110	11	9	6	4
3118	24	1	7	2
3126	13	26	7	2
3134	19	14	4	6
3142	12	6	4	6
3150	28	52	4	5
3158	8	10	5	3
3166	19	64	7	1
3174	16	67	9	228
3182	24	34	5	3
3190	5	67	4	62
3198	7	65	4	173
3206	11	15	4	7
3214	5	27	7	2
3222	4	20	6	4
3230	3	4	4	83
3238	4	45	4	227
3246	4	21	4	5
3254	7	5	6	4
3262	9	21	4	168
3270	9	3	4	157
3278	7	69	6	4
3286	9	13	4	7
3294	17	2	4	7
3302	22	57	7	1
3310	2	33	4	6
3318	18	46	3	216
3326	18	39	7	1
3334	21	27	5	3
3342	18	65	12	188
3350	24	18	4	32
3358	11	71	4	26
3366	22	26	6	4
3374	20	56	2	223
3382	12	52	9	228
3390	10	56	12	146
3398	27	18	4	193
3406	6	54	4	7
3414	5	71	4	26
3422	28	31	3	162
3430	9	46	3	216
3438	25	33	7	2
3446	25	34	5	3
3454	15	51	9	228
3462	28	58	4	7
3470	26	16	4	25
3478	15	23	7	1
3486	11	48	5	3
3494	27	38	4	6
3502	15	11	4	58
3510	19	32	4	6
3518	23	69	9	228
3526	10	72	4	6
3534	20	51	4	44
3542	13	8	7	2
3550	19	48	5	3
3558	25	66	5	3
3566	15	65	5	3
3574	5	52	9	228
3582	11	5	12	171
3590	5	46	3	222
3598	8	28	4	7
3606	6	51	4	44
3614	28	69	4	7
3622	19	16	4	25
3630	15	1	4	5
3638	7	3	7	2
3646	2	32	7	1
3654	7	65	5	3
3662	9	29	6	206
3670	27	2	7	1
3678	16	37	9	228
3686	10	31	4	7
3694	8	30	3	162
3702	15	21	6	4
3710	7	64	3	14
3718	14	36	5	3
3726	28	25	4	104
3734	5	27	4	5
3742	19	23	4	7
3750	8	18	4	6
3758	22	18	9	228
3766	9	45	12	229
2522	25	51	4	7
2530	23	33	6	4
2538	21	15	4	7
2546	28	16	4	5
2554	9	31	9	228
2562	5	30	7	2
2570	10	13	9	228
2578	6	45	12	229
2586	17	56	3	146
2594	15	71	7	2
2602	8	44	3	179
2610	6	52	9	228
2618	15	32	4	7
2626	6	54	9	228
2634	15	41	4	5
2642	25	42	4	5
2650	17	46	3	216
2658	10	55	4	10
2666	27	73	7	2
2674	11	74	3	135
2682	20	56	5	3
2690	18	66	4	7
2698	22	47	7	2
2706	20	12	7	2
2714	27	25	3	165
2722	16	58	4	114
2730	25	5	4	199
2738	27	25	4	6
2746	6	18	4	32
2754	9	62	4	127
2762	19	71	4	26
2770	15	45	4	5
2778	16	60	4	7
2786	2	37	7	1
2794	14	19	9	228
2802	19	49	4	117
2810	11	45	4	7
2818	23	58	9	228
2826	4	67	5	3
2834	23	64	3	14
2842	28	7	3	155
2850	8	31	3	161
2858	10	27	3	149
2866	6	50	10	202
2874	2	9	6	129
2882	9	16	4	7
2890	15	39	7	2
2898	8	2	7	2
2906	14	15	4	7
2914	22	4	9	228
2922	23	54	3	221
2930	11	74	9	228
2938	19	46	3	222
2946	5	33	7	2
2954	22	61	7	1
2962	3	5	3	177
2970	26	5	7	2
2978	17	73	3	34
2986	12	42	4	51
2994	12	10	3	153
3002	23	61	4	6
3010	23	62	4	5
3018	23	37	5	3
3026	3	20	4	113
3034	5	40	4	78
3042	28	73	5	3
3050	2	26	4	6
3058	10	35	4	5
3066	20	45	7	2
3074	21	70	4	43
3082	22	72	3	37
3090	11	5	3	143
3098	20	62	6	4
3106	17	60	4	7
3114	25	1	9	228
3122	24	30	9	228
3130	16	21	4	168
3138	12	13	9	228
3146	15	23	4	6
3154	8	11	4	5
3162	12	28	4	5
3170	17	18	7	1
3178	4	61	4	5
3186	9	55	4	116
3194	12	5	4	7
3202	4	72	7	1
3210	27	12	7	2
3218	15	7	5	3
3226	15	6	3	120
3234	27	37	4	7
3242	19	41	7	2
3250	21	69	7	2
3258	4	45	3	226
3266	8	57	5	3
3274	21	23	4	5
3282	19	63	5	3
3290	14	53	4	198
3298	21	25	4	6
3306	10	38	4	128
3314	5	74	9	228
3322	8	4	7	1
3330	21	30	5	3
3338	19	73	7	2
3346	13	51	4	44
3354	2	35	5	3
3362	4	14	4	6
3370	25	74	5	3
3378	7	15	6	4
3386	15	15	4	25
3394	7	65	4	7
3402	12	29	3	162
3410	9	74	3	135
3418	15	58	9	228
3426	11	6	4	6
3434	2	54	4	218
3442	5	4	4	6
3450	9	9	7	2
3458	24	56	12	146
3466	13	18	4	193
3474	2	20	7	2
3482	11	55	4	5
3490	10	32	7	1
3498	26	5	4	7
3506	2	23	12	137
3514	19	64	4	6
3522	4	8	4	55
3530	27	3	4	6
3538	12	51	4	44
3546	12	1	8	124
3554	20	15	7	2
3562	19	63	4	5
3570	23	26	6	4
3578	16	26	4	6
3586	19	45	4	7
3594	19	15	7	2
3602	3	50	3	202
3610	20	41	9	228
3618	14	55	4	80
3626	4	67	4	62
3634	19	52	9	228
3642	20	70	3	152
3650	19	41	6	4
3658	16	37	4	30
3666	10	64	4	6
3674	27	8	6	4
3682	25	38	9	228
3690	21	49	4	6
3698	11	1	8	124
3706	28	40	5	3
3714	20	73	6	4
3722	3	4	7	2
3730	2	74	5	3
3738	27	11	6	4
3746	19	44	9	228
3754	13	15	4	6
3762	15	50	9	228
3770	11	39	3	107
3779	24	17	4	103
3787	17	12	7	2
3795	26	58	4	7
3803	18	23	4	164
3811	10	54	4	209
3819	14	55	9	228
3827	6	22	3	8
3835	4	39	4	5
3843	17	51	9	228
3851	6	11	4	7
3859	8	73	3	34
3867	3	43	7	1
3875	17	19	6	4
3883	21	25	4	104
3891	15	22	4	7
3899	4	4	3	20
3907	2	69	4	7
3915	24	50	3	197
3923	9	41	4	7
3931	15	64	4	7
3939	28	27	7	1
3947	4	38	6	4
3955	22	68	9	228
3963	3	46	6	4
3971	13	63	9	228
3979	5	28	7	1
3987	3	3	4	6
3995	20	55	7	2
4003	17	7	2	186
4011	12	63	4	7
4019	4	19	5	3
4027	8	32	4	6
4035	6	37	4	5
4043	16	19	9	228
4051	12	18	4	7
4059	27	33	4	5
4067	20	70	6	4
4075	17	45	3	201
4083	8	9	7	2
4091	5	41	6	4
4099	23	38	4	94
4107	16	71	6	4
4115	2	29	6	206
4123	2	14	6	4
4131	26	23	4	7
4139	19	37	5	3
4147	5	69	4	50
4155	24	45	9	228
4163	10	26	4	7
4171	2	28	4	5
4179	12	35	4	6
4187	25	72	7	2
4195	19	1	4	5
4203	9	70	4	7
4211	16	42	4	51
4219	25	37	5	3
4227	22	28	4	6
4235	9	13	6	4
4243	20	56	4	46
4251	13	56	3	122
4259	16	33	7	2
4267	11	58	7	2
4275	9	52	5	3
4283	27	58	5	3
4291	20	51	6	4
4299	21	51	5	3
4307	27	69	5	3
4315	28	1	8	148
4323	28	26	4	31
4331	5	22	3	8
4339	14	29	6	207
4347	7	39	7	1
4355	13	8	4	5
4363	3	66	4	5
4371	9	4	4	121
4379	7	2	4	6
4387	6	36	4	110
4395	23	72	4	5
4403	27	68	7	2
4411	27	56	4	6
4419	11	3	7	1
4427	6	23	5	3
4435	8	52	3	95
4443	5	61	4	52
4451	8	23	3	137
4459	26	55	4	10
4467	16	17	4	103
4475	27	56	7	1
4483	18	3	4	6
4491	17	11	4	6
4499	17	42	4	51
4507	16	25	3	165
4515	17	45	3	232
4523	6	11	4	58
4531	16	56	4	5
4539	21	40	5	3
4547	26	37	5	3
4555	23	9	12	70
4563	15	46	3	231
4571	11	18	7	2
4579	10	61	7	1
4587	17	27	3	149
4595	19	21	7	1
4603	22	9	4	6
4611	24	55	4	80
4619	19	34	7	1
4627	12	53	4	176
4635	7	70	4	7
4643	19	61	4	7
4651	26	36	4	5
4659	25	58	6	4
4667	10	29	4	7
4675	18	63	7	1
4683	15	20	6	4
4691	4	5	12	84
4699	13	30	7	1
4707	8	73	5	3
4715	13	39	3	107
4723	4	21	7	2
4731	6	30	3	162
4739	23	57	6	4
4747	25	35	7	2
4755	9	73	5	3
4763	18	46	3	226
4771	11	16	4	6
4779	26	66	4	6
4787	12	10	3	220
4795	26	55	7	1
4803	26	35	6	4
4811	15	44	4	6
4819	22	46	5	3
4827	23	28	5	3
4835	10	54	4	5
4843	24	2	7	1
4851	26	44	3	130
4859	19	5	3	119
4867	26	52	4	95
4875	13	35	5	3
4883	12	6	6	4
4891	3	17	4	32
4899	26	17	4	193
4907	5	68	9	228
4915	7	35	9	228
4923	7	46	4	222
4931	10	61	4	7
4939	21	46	6	4
4947	20	64	6	4
4955	15	31	6	4
4963	4	18	9	228
4971	26	21	6	4
4979	25	34	4	6
4987	23	45	3	200
4995	10	24	4	6
5003	15	64	4	5
5011	26	7	4	65
5019	19	32	6	4
5027	21	9	7	1
3313	5	59	4	7
3321	11	70	4	5
3329	5	51	4	7
3337	15	14	7	2
3345	20	28	3	184
3353	11	22	6	4
3361	12	38	4	6
3369	13	69	4	7
3377	17	30	7	2
3385	11	33	7	2
3393	5	1	4	7
3401	14	69	4	50
3409	2	43	4	59
3417	25	45	3	232
3425	6	59	4	7
3433	11	4	4	6
3441	22	66	4	5
3449	13	5	9	228
3457	18	56	12	146
3465	5	63	4	48
3473	10	5	12	171
3481	21	8	7	2
3489	6	46	7	1
3497	23	10	4	6
3505	16	56	7	2
3513	15	55	4	80
3521	2	37	4	6
3529	7	59	7	2
3537	12	29	7	1
3545	13	45	9	228
3553	25	64	4	6
3561	20	55	4	5
3569	21	15	9	228
3577	17	18	4	6
3585	11	41	7	2
3593	6	5	12	177
3601	27	27	5	3
3609	3	67	6	4
3617	10	48	6	4
3625	10	58	7	1
3633	15	47	6	4
3641	6	63	3	126
3649	15	23	3	164
3657	11	38	9	228
3665	6	36	6	4
3673	16	34	5	3
3681	20	73	9	228
3689	14	38	4	94
3697	24	1	9	228
3705	16	59	9	228
3713	28	5	3	119
3721	24	44	4	7
3729	12	68	7	2
3737	22	61	4	7
3745	6	12	3	15
3753	12	65	9	228
3761	8	66	3	86
3769	11	26	4	7
3777	17	30	3	162
3785	13	29	7	2
3793	10	73	7	2
3801	2	56	12	146
3809	18	44	4	7
3817	8	45	6	4
3825	9	25	3	139
3833	20	63	4	7
3841	24	56	4	5
3849	15	43	9	228
3857	23	25	4	7
3865	7	45	3	216
3873	10	48	5	3
3881	21	69	4	5
3889	27	54	4	218
3897	27	23	12	137
3905	21	33	5	3
3913	8	7	4	131
3921	28	41	4	11
3929	9	33	7	2
3937	8	11	4	6
3945	15	22	7	2
3953	7	23	6	4
3961	2	70	4	98
3969	16	12	4	7
3977	11	8	4	7
3985	7	60	7	1
3993	2	27	5	3
4001	19	31	4	7
4009	13	7	4	6
4017	28	42	7	1
4025	25	17	4	66
4033	27	24	4	6
4041	19	31	6	207
4049	5	10	3	219
4057	14	43	7	2
4065	21	58	7	2
4073	4	46	6	4
4081	23	32	3	75
4089	2	37	4	30
4097	10	44	7	2
4105	2	11	7	1
4113	24	14	4	5
4121	21	65	6	4
4129	28	25	4	67
4137	10	63	7	2
4145	9	52	4	145
4153	4	27	5	3
4161	11	43	4	6
4169	24	1	5	3
4177	22	44	6	4
4185	5	32	7	2
4193	26	31	3	161
4201	4	54	4	6
4209	10	23	7	2
4217	25	18	4	7
4225	25	40	9	228
4233	20	25	4	104
4241	11	17	4	32
4249	17	37	4	30
4257	25	10	7	1
4265	12	68	4	61
4273	16	28	3	161
4281	27	34	7	1
4289	17	35	4	77
4297	5	3	7	1
4305	27	32	6	4
4313	28	25	6	4
4321	6	63	6	4
4329	22	63	4	5
4337	23	40	4	5
4345	27	55	4	116
4353	7	72	3	72
4361	14	20	7	1
4369	26	8	5	3
4377	10	59	6	4
4385	21	12	3	15
4393	9	41	9	228
4401	11	44	7	2
4409	13	5	4	5
4417	26	70	4	5
4425	24	8	4	93
4433	7	36	4	7
4441	14	54	4	7
4449	2	56	3	147
4457	26	24	4	6
4465	10	58	4	7
4473	2	5	3	143
4481	13	40	5	3
4489	2	52	9	228
4497	8	68	7	1
4505	15	56	12	122
4513	28	18	4	5
4521	6	23	6	4
4529	13	4	6	4
4537	20	44	4	156
4545	22	72	3	72
4553	24	57	7	1
4561	8	7	2	186
3780	14	21	7	2
3788	10	5	3	84
3796	2	10	4	5
3804	8	10	3	190
3812	7	73	5	3
3820	23	34	4	29
3828	26	23	7	2
3836	26	4	9	228
3844	17	1	7	2
3852	9	50	4	6
3860	17	21	7	1
3868	28	13	7	1
3876	26	45	3	216
3884	2	2	5	3
3892	17	59	9	228
3900	10	4	3	20
3908	23	56	4	172
3916	19	68	4	61
3924	2	29	7	1
3932	13	50	7	2
3940	23	64	4	7
3948	19	34	4	5
3956	15	23	5	3
3964	16	9	9	228
3972	6	69	4	5
3980	13	40	4	7
3988	18	48	5	3
3996	28	50	4	7
4004	22	29	9	228
4012	25	9	4	5
4020	2	21	7	1
4028	10	66	5	3
4036	8	48	9	228
4044	19	33	6	4
4052	10	64	7	1
4060	27	10	7	1
4068	3	47	4	5
4076	24	69	9	228
4084	28	72	4	7
4092	23	72	3	72
4100	9	12	4	7
4108	22	41	4	11
4116	25	5	3	84
4124	25	63	3	126
4132	5	31	7	2
4140	16	38	4	7
4148	25	46	4	5
4156	5	7	4	6
4164	15	56	12	82
4172	14	1	8	148
4180	4	38	4	19
4188	11	72	3	37
4196	12	50	4	7
4204	4	43	7	1
4212	3	33	9	228
4220	25	15	7	1
4228	6	64	7	2
4236	10	7	4	23
4244	28	72	5	3
4252	22	20	4	6
4260	24	12	4	7
4268	10	23	4	7
4276	9	10	3	219
4284	4	57	4	6
4292	19	7	4	23
4300	4	50	2	213
4308	6	56	3	82
4316	25	41	4	5
4324	10	43	4	6
4332	25	31	5	3
4340	24	46	4	5
4348	28	71	4	26
4356	12	51	6	4
4364	10	60	4	5
4372	19	65	9	228
4380	15	46	7	1
4388	18	45	3	201
4396	4	37	4	7
4404	15	21	7	2
4412	10	20	4	5
4420	24	37	4	30
4428	9	1	9	228
4436	27	24	4	181
4444	23	1	8	148
4452	4	17	4	6
4460	8	27	7	2
4468	8	20	5	3
4476	28	15	3	57
4484	14	20	4	6
4492	22	12	3	15
4500	9	42	4	51
4508	22	46	3	225
4516	4	58	7	2
4524	12	25	4	104
4532	27	62	4	127
4540	23	45	3	216
4548	9	51	7	2
4556	15	54	4	7
4564	19	54	4	218
4572	5	43	7	1
4580	5	73	5	3
4588	24	45	6	4
4596	25	21	7	1
4604	28	48	7	1
4612	12	50	9	228
4620	11	22	3	73
4628	24	63	7	1
4636	12	35	6	4
4644	25	40	6	4
4652	13	17	4	133
4660	9	65	9	228
4668	25	2	4	6
4676	10	73	4	5
4684	5	39	9	228
4692	10	26	5	3
4700	9	15	5	3
4708	15	21	4	5
4716	23	46	3	201
4724	11	45	3	225
4732	26	25	7	2
4740	12	45	3	231
4748	19	15	4	5
4756	22	1	7	1
4764	10	33	4	5
4772	3	31	3	162
4780	16	5	3	84
4788	21	1	3	13
4796	25	63	7	1
4804	26	7	4	5
4812	6	67	4	7
4820	6	14	5	3
4828	20	38	4	64
4836	2	70	4	6
4844	7	32	12	106
4852	25	46	3	226
4860	19	26	5	3
4868	15	56	3	223
4876	15	10	6	4
4884	28	67	5	3
4892	24	23	4	112
4900	11	29	5	3
4908	27	32	5	3
4916	4	60	4	6
4924	21	55	12	159
4932	22	64	5	3
4940	25	36	4	5
4948	6	43	5	3
4956	25	46	7	2
4964	22	43	3	101
4972	23	43	3	21
4980	23	67	5	3
4988	14	60	3	169
4996	20	48	4	6
5004	23	56	12	214
5012	9	6	3	120
5020	7	37	4	6
5028	6	21	6	4
3775	4	56	2	223
3783	17	61	4	6
3791	6	44	6	4
3799	24	54	4	209
3807	20	63	11	90
3815	18	38	9	228
3823	22	22	3	137
3831	4	30	7	1
3839	7	70	5	3
3847	11	50	2	213
3855	21	63	9	228
3863	22	3	7	2
3871	11	17	4	6
3879	6	8	4	93
3887	8	46	7	2
3895	2	15	4	5
3903	4	6	6	4
3911	11	68	4	61
3919	6	4	5	3
3927	7	72	7	2
3935	8	71	6	4
3943	10	51	9	228
3951	2	46	3	229
3959	5	8	7	2
3967	15	46	3	222
3975	11	65	3	89
3983	9	45	5	3
3991	8	50	4	6
3999	12	26	4	7
4007	20	63	7	2
4015	11	71	4	5
4023	26	46	4	5
4031	22	21	7	2
4039	6	40	4	7
4047	3	43	4	6
4055	2	27	6	4
4063	26	41	4	5
4071	4	65	4	173
4079	3	42	4	5
4087	19	28	3	99
4095	28	64	4	7
4103	26	36	9	228
4111	28	11	5	3
4119	17	56	12	146
4127	21	22	3	8
4135	6	55	9	228
4143	4	52	4	5
4151	19	18	4	7
4159	10	21	7	1
4167	28	26	4	5
4175	10	45	5	3
4183	11	19	6	4
4191	2	25	4	6
4199	7	12	5	3
4207	21	30	4	7
4215	6	45	4	5
4223	23	58	4	5
4231	26	26	5	3
4239	4	18	7	2
4247	26	53	7	1
4255	27	25	7	2
4263	16	62	7	1
4271	5	33	5	3
4279	10	50	2	213
4287	26	42	7	1
4295	19	41	4	5
4303	19	61	7	1
4311	5	72	3	37
4319	4	1	8	124
4327	3	73	9	228
4335	14	47	4	38
4343	12	56	3	122
4351	10	17	4	32
4359	12	53	7	1
4367	5	72	7	2
4375	14	34	4	6
4383	25	47	7	1
4391	28	27	3	53
4399	16	23	3	137
4407	7	18	5	3
4415	13	55	9	228
4423	12	67	4	6
4431	11	45	12	229
4439	3	45	4	222
4447	8	67	4	5
4455	13	51	5	3
4463	5	38	4	128
4471	22	29	7	2
4479	18	20	4	5
4487	18	45	6	4
4495	2	30	4	6
4503	12	58	9	228
4511	4	18	4	193
4519	5	31	6	4
4527	15	11	9	228
4535	11	21	7	1
4543	7	16	4	6
4551	15	32	12	106
4559	2	41	9	228
4567	26	35	4	6
4575	7	64	7	2
4583	23	21	7	2
4591	19	19	3	12
4599	3	73	6	4
4607	4	69	4	7
4615	4	56	12	147
4623	19	58	5	3
4631	15	46	4	5
4639	5	61	9	228
4647	19	28	3	17
4655	24	6	3	120
4663	3	68	7	2
4671	23	36	3	182
4679	22	22	7	1
4687	5	56	3	82
4695	20	72	5	3
4703	17	60	11	169
4711	24	23	7	1
4719	24	58	9	228
4727	4	50	4	7
4735	26	43	4	59
4743	21	1	8	148
4751	8	12	5	3
4759	13	25	6	4
4767	24	25	3	183
4775	16	57	7	1
4783	15	57	5	3
4791	27	25	6	4
4799	24	29	9	228
4807	25	50	6	4
4815	11	67	4	41
4823	5	71	6	4
4831	11	27	4	6
4839	5	28	3	17
4847	26	45	12	216
4855	7	67	9	228
4863	28	14	4	25
4871	20	40	4	39
4879	26	61	5	3
4887	14	67	5	3
4895	19	14	6	4
4903	2	8	4	7
4911	28	51	4	6
4919	10	55	3	159
4927	11	45	12	216
4935	18	62	4	5
4943	9	44	5	3
4951	21	51	7	1
4959	20	65	4	5
4967	13	38	4	7
4975	17	18	4	7
4983	20	14	6	4
4991	21	34	4	29
4999	5	35	4	7
5007	11	56	4	6
5015	2	68	7	2
5023	21	39	3	107
3778	28	55	9	228
3786	12	38	4	19
3794	10	53	4	6
3802	2	20	4	5
3810	25	8	4	93
3818	25	65	7	2
3826	21	70	5	3
3834	7	31	3	161
3842	22	32	4	7
3850	14	31	3	161
3858	4	59	5	3
3866	9	19	3	12
3874	4	49	10	170
3882	27	25	4	104
3890	19	70	3	152
3898	15	30	4	7
3906	14	55	6	4
3914	11	44	4	156
3922	21	50	7	2
3930	5	37	4	5
3938	27	1	4	5
3946	11	54	4	6
3954	7	6	4	5
3962	19	30	3	68
3970	16	50	4	6
3978	16	73	3	34
3986	9	43	4	6
3994	18	51	9	228
4002	25	14	4	5
4010	7	63	6	4
4018	2	10	3	210
4026	23	74	4	6
4034	4	30	3	68
4042	15	74	4	6
4050	15	61	3	9
4058	10	30	3	68
4066	18	12	9	228
4074	10	46	6	4
4082	18	73	4	7
4090	6	17	7	1
4098	25	36	4	7
4106	24	17	4	66
4114	9	21	4	6
4122	18	46	6	4
4130	2	39	5	3
4138	10	18	7	2
4146	4	70	6	4
4154	8	35	4	77
4162	17	13	5	3
4170	25	73	5	3
4178	3	31	6	207
4186	23	60	4	6
4194	25	37	6	4
4202	21	41	4	11
4210	4	65	9	228
4218	18	21	7	1
4226	21	64	4	7
4234	10	31	9	228
4242	14	32	12	106
4250	10	29	6	206
4258	4	66	4	5
4266	13	50	9	228
4274	10	52	4	145
4282	16	73	4	7
4290	26	40	6	4
4298	7	36	4	110
4306	19	59	6	4
4314	19	38	4	128
4322	23	3	4	7
4330	18	46	4	5
4338	25	11	12	96
4346	26	36	7	2
4354	11	41	4	5
4362	11	23	9	228
4370	25	12	4	7
4378	7	22	4	7
4386	17	5	6	4
4394	6	13	4	5
4402	2	66	5	3
4410	16	13	6	4
4418	21	22	4	7
4426	3	1	8	124
4434	13	58	9	228
4442	10	63	4	7
4450	8	56	3	147
4458	28	64	6	4
4466	24	61	4	6
4474	23	11	9	228
4482	7	56	12	196
4490	25	35	4	6
4498	25	55	4	7
4506	2	16	4	25
4514	19	55	4	7
4522	22	11	4	7
4530	26	69	6	4
4538	27	40	5	3
4546	2	9	6	4
4554	19	25	4	104
4562	4	5	9	228
4570	6	32	4	7
4578	17	20	4	5
4586	21	67	7	1
4594	3	17	4	6
4602	28	9	4	6
4610	9	31	6	206
4618	19	22	3	73
4626	5	8	4	5
4634	11	25	4	67
4642	10	29	6	4
4650	28	35	5	3
4658	12	66	7	1
4666	20	53	4	7
4674	14	71	4	5
4682	28	17	6	4
4690	15	46	4	211
4698	8	19	4	5
4706	16	36	4	30
4714	25	45	4	6
4722	13	1	3	13
4730	11	52	4	95
4738	27	46	9	228
4746	12	28	12	194
4754	9	55	3	159
4762	16	62	5	3
4770	8	45	3	216
4778	22	62	4	6
4786	7	38	7	2
4794	7	57	4	7
4802	2	69	5	3
4810	5	25	4	7
4818	17	20	7	1
4826	24	47	5	3
4834	5	6	4	7
4842	11	44	4	5
4850	5	21	9	228
4858	8	65	4	7
4866	21	9	12	70
4874	13	32	3	75
4882	16	40	7	2
4890	19	5	12	84
4898	11	13	4	115
4906	25	56	3	208
4914	23	28	6	4
4922	22	32	4	5
4930	21	48	7	1
4938	3	40	4	7
4946	12	64	6	4
4954	21	59	7	1
4962	6	65	3	150
4970	17	31	3	162
4978	16	8	4	93
4986	13	1	8	148
4994	28	71	4	5
5002	4	3	4	7
5010	20	22	3	73
5018	25	56	4	6
5026	19	35	4	30
3776	27	68	9	228
3784	14	18	6	4
3792	7	10	4	6
3800	2	56	6	4
3808	16	55	4	6
3816	20	44	6	4
3824	4	45	4	211
3832	22	58	9	228
3840	15	64	7	2
3848	21	31	6	4
3856	26	68	4	7
3864	2	6	3	63
3872	4	48	5	3
3880	11	70	6	4
3888	6	15	4	6
3896	17	48	9	228
3904	2	1	7	2
3912	8	27	9	228
3920	8	66	6	4
3928	21	20	4	6
3936	9	25	3	165
3944	2	72	4	6
3952	23	71	4	6
3960	18	56	2	223
3968	10	22	4	6
3976	13	32	4	7
3984	3	5	5	3
3992	2	24	5	3
4000	3	4	3	20
4008	5	70	4	7
4016	16	32	4	6
4024	18	53	4	6
4032	4	62	7	1
4040	26	7	4	23
4048	3	3	7	1
4056	7	11	7	2
4064	28	43	3	232
4072	5	38	6	4
4080	15	62	4	7
4088	15	28	12	194
4096	25	54	4	209
4104	4	5	4	5
4112	20	1	8	124
4120	20	72	3	37
4128	9	37	3	195
4136	26	50	4	7
4144	11	18	4	7
4152	18	26	4	7
4160	26	51	6	4
4168	5	26	6	4
4176	2	73	7	2
4184	15	20	4	6
4192	10	29	4	6
4200	27	44	9	228
4208	20	50	4	7
4216	4	26	7	2
4224	18	29	7	1
4232	18	27	6	4
4240	14	17	4	7
4248	3	74	4	5
4256	7	72	9	228
4264	2	38	7	2
4272	9	73	9	228
4280	3	41	6	4
4288	10	29	7	1
4296	21	8	4	5
4304	14	72	5	3
4312	27	16	7	1
4320	20	12	9	228
4328	10	39	4	140
4336	4	38	5	3
4344	7	62	4	7
4352	22	11	7	2
4360	4	56	3	196
4368	23	20	4	6
4376	5	64	3	14
4384	3	45	4	7
4392	25	7	4	23
4400	12	36	7	2
4408	24	37	3	195
4416	10	19	6	4
4424	26	23	5	3
4432	16	70	4	7
4440	8	19	7	2
4448	18	70	3	152
4456	11	69	4	7
4464	22	40	4	5
4472	25	8	6	4
4480	19	32	4	7
4488	6	65	5	3
4496	25	64	3	14
4504	18	65	9	228
4512	28	12	4	5
4520	25	44	4	7
4528	19	43	7	1
4536	12	37	5	3
4544	5	22	3	137
4552	11	25	4	104
4560	23	46	3	231
4568	23	29	7	2
4576	27	74	7	1
4584	27	39	3	22
4592	23	41	7	1
4600	19	19	6	4
4608	6	35	4	7
4616	11	58	5	3
4624	25	15	4	25
4632	11	56	7	1
4640	16	73	5	3
4648	6	32	9	228
4656	20	50	5	3
4664	23	16	3	57
4672	18	54	4	5
4680	7	7	4	131
4688	15	28	3	161
4696	22	28	6	4
4704	12	19	4	6
4712	13	6	5	3
4720	17	46	3	200
4728	11	35	3	166
4736	3	56	3	196
4744	8	17	4	66
4752	3	49	4	6
4760	19	46	3	232
4768	13	14	5	3
4776	24	33	4	5
4784	6	71	9	228
4792	23	12	7	1
4800	25	12	3	87
4808	27	68	4	5
4816	20	11	5	3
4824	19	55	7	1
4832	5	40	5	3
4840	19	24	4	6
4848	26	10	3	220
4856	5	23	4	6
4864	4	39	9	228
4872	25	11	6	4
4880	19	32	4	36
4888	12	68	4	5
4896	20	16	7	1
4904	4	71	7	2
4912	28	10	4	7
4920	13	29	4	5
4928	25	47	5	3
4936	22	21	4	5
4944	11	11	5	3
4952	9	17	4	32
4960	26	56	3	174
4968	12	21	9	228
4976	4	20	4	6
4984	15	45	3	200
4992	10	41	4	11
5000	7	7	2	186
5008	14	43	4	5
5016	21	43	5	3
5024	24	2	4	6
3774	19	65	7	2
3782	20	38	4	19
3790	28	32	4	7
3798	18	54	4	209
3806	17	10	3	153
3814	22	30	4	7
3822	7	69	4	5
3830	11	70	3	152
3838	22	39	4	6
3846	2	58	7	1
3854	27	73	4	5
3862	28	11	6	4
3870	17	19	3	12
3878	19	63	7	2
3886	23	15	3	57
3894	12	54	7	1
3902	21	23	6	4
3910	28	5	12	84
3918	10	62	4	6
3926	4	53	7	1
3934	28	45	3	222
3942	15	15	3	57
3950	17	22	3	73
3958	21	40	4	7
3966	23	43	9	228
3974	8	12	4	7
3982	3	45	5	3
3990	4	41	6	4
3998	4	42	4	5
4006	7	40	13	78
4014	16	74	6	4
4022	9	6	9	228
4030	13	3	4	7
4038	8	29	4	6
4046	23	68	5	3
4054	4	25	4	6
4062	10	33	7	2
4070	21	7	4	6
4078	7	18	4	133
4086	8	17	4	180
4094	22	2	4	6
4102	22	62	3	97
4110	27	26	5	3
4118	28	52	4	95
4126	27	55	7	2
4134	19	62	4	6
4142	19	35	7	1
4150	11	55	7	2
4158	18	5	5	3
4166	9	17	4	66
4174	19	40	4	7
4182	27	67	4	6
4190	7	59	4	5
4198	14	44	5	3
4206	8	42	4	51
4214	5	40	4	7
4222	16	24	4	5
4230	12	69	5	3
4238	6	35	7	1
4246	26	47	7	1
4254	18	29	6	206
4262	20	68	4	61
4270	23	56	12	122
4278	24	21	4	6
4286	20	53	7	1
4294	16	27	7	2
4302	2	6	9	228
4310	11	45	5	3
4318	16	45	3	232
4326	11	11	12	96
4334	23	30	5	3
4342	27	24	4	112
4350	4	37	9	228
4358	6	2	4	6
4366	16	10	3	219
4374	10	17	4	6
4382	24	15	7	1
4390	23	61	7	2
4398	10	70	3	152
4406	6	12	6	4
4414	10	37	3	195
4422	18	19	6	4
4430	23	6	7	1
4438	25	38	4	5
4446	2	65	12	188
4454	28	66	7	1
4462	15	25	5	3
4470	23	63	4	48
4478	26	56	4	46
4486	9	31	4	7
4494	5	25	4	104
4502	27	31	4	5
4510	14	63	4	48
4518	13	39	4	6
4526	13	44	9	228
4534	27	26	4	5
4542	14	15	3	57
4550	4	1	5	3
4558	20	61	4	52
4566	5	23	6	4
4574	25	19	3	12
4582	21	15	3	57
4590	19	53	4	6
4598	27	72	6	4
4606	26	25	3	183
4614	20	50	9	228
4622	11	51	2	212
4630	27	67	6	4
4638	5	63	11	126
4646	26	53	4	176
4654	25	61	6	4
4662	9	46	3	200
4670	15	36	3	182
4678	19	6	3	63
4686	12	71	9	228
4694	12	28	7	2
4702	8	30	4	5
4710	27	23	4	164
4718	14	1	8	88
4726	9	64	3	14
4734	20	43	4	59
4742	28	10	7	2
4750	5	67	4	41
4758	21	45	3	231
4766	9	51	4	5
4774	27	8	4	28
4782	22	35	5	3
4790	12	53	7	2
4798	26	30	3	162
4806	14	22	7	1
4814	11	18	5	3
4822	21	53	9	228
4830	17	62	4	5
4838	9	54	3	221
4846	15	12	7	1
4854	22	10	7	2
4862	22	14	4	25
4870	27	72	5	3
4878	25	71	6	4
4886	26	6	6	4
4894	26	37	7	1
4902	28	30	3	68
4910	19	54	4	5
4918	19	41	4	11
4926	8	36	4	110
4934	8	7	4	7
4942	6	72	3	72
4950	15	22	3	8
4958	19	13	4	115
4966	27	21	4	168
4974	6	64	9	228
4982	28	38	6	4
4990	18	41	4	11
4998	19	56	4	6
5006	22	3	4	5
5014	26	35	4	30
5022	21	39	4	5
4569	5	54	4	218
4577	27	18	5	3
4585	25	61	4	6
4593	27	16	4	6
4601	25	19	6	4
4609	11	46	3	226
4617	23	60	6	4
4625	24	53	10	203
4633	5	25	4	67
4641	23	21	4	5
4649	7	67	4	7
4657	23	73	7	1
4665	22	29	4	5
4673	4	61	7	2
4681	6	5	3	171
4689	22	41	7	1
4697	2	54	3	221
4705	26	59	4	6
4713	21	58	4	5
4721	23	61	4	5
4729	21	67	4	7
4737	15	63	3	126
4745	12	29	5	3
4753	10	21	4	7
4761	12	7	4	5
4769	4	29	6	207
4777	2	4	9	228
4785	22	41	4	6
4793	28	53	5	3
4801	11	5	3	119
4809	27	72	3	118
4817	27	29	3	161
4825	25	16	4	6
4833	7	11	4	5
4841	25	24	4	6
4849	27	17	7	2
4857	15	58	4	114
4865	19	33	4	5
4873	23	56	3	223
4881	12	21	5	3
4889	4	25	4	104
4897	22	12	7	1
4905	12	27	4	6
4913	25	13	4	6
4921	17	12	4	5
4929	8	28	7	1
4937	16	28	7	1
4945	12	37	7	1
4953	11	41	4	11
4961	8	5	3	84
4969	5	41	4	11
4977	19	2	7	1
4985	25	65	4	5
4993	22	12	4	6
5001	12	14	6	4
5009	9	22	4	5
5017	19	19	3	76
5025	2	70	4	43
5033	6	61	3	9
5041	3	7	9	228
5049	22	39	3	107
5057	19	24	4	112
5065	26	67	7	2
5073	15	6	4	5
5081	13	43	5	3
5089	11	40	6	4
5097	3	65	6	4
5105	18	4	9	228
5113	10	64	6	4
5121	13	42	7	2
5129	23	56	4	7
5137	3	72	4	7
5145	16	63	4	6
5153	22	43	5	3
5161	27	19	3	76
5169	27	11	3	158
5177	21	18	4	180
5185	5	1	3	13
5193	13	50	4	5
5201	28	28	3	17
5209	15	48	7	2
5217	23	11	3	24
5225	27	5	7	1
5233	17	70	4	98
5241	25	66	7	1
5249	11	46	9	228
5257	23	26	4	6
5265	14	65	3	188
5273	28	24	4	7
5281	3	68	4	61
5289	25	60	7	1
5297	17	56	4	6
5305	21	60	4	5
5313	14	72	3	37
5321	3	50	10	202
5329	28	45	12	229
5337	11	23	4	5
5345	19	3	4	157
5353	26	73	9	228
5361	8	56	7	2
5369	26	64	4	6
5377	22	47	9	228
5385	2	3	5	3
5393	27	54	3	221
5401	9	60	4	7
5409	18	17	4	180
5417	6	13	9	228
5425	17	58	4	6
5433	26	50	2	213
5441	3	38	4	94
5449	18	23	4	5
5457	3	28	6	4
5465	18	25	3	139
5473	19	30	9	228
5481	26	73	7	2
5489	11	32	4	6
5497	4	60	9	228
5505	6	20	5	3
5513	24	32	9	228
5521	17	56	4	46
5529	23	66	7	2
5537	27	71	4	5
5545	17	18	6	4
5553	5	30	4	6
5561	21	41	4	6
5569	21	28	3	17
5577	23	41	13	109
5585	22	45	3	231
5593	4	56	3	82
5601	4	12	3	15
5609	7	56	12	82
5617	28	49	2	217
5625	20	25	9	228
5633	6	53	10	203
5641	27	4	4	5
5649	5	23	4	164
5657	10	74	7	1
5665	16	46	4	230
5673	5	29	6	207
5681	13	31	6	207
5689	11	48	7	1
5697	2	62	4	5
5705	24	34	7	1
5713	15	45	4	211
5721	15	19	3	12
5729	23	45	3	201
5737	25	14	7	1
5745	16	10	3	178
5753	5	47	4	38
5761	16	34	4	7
5769	8	55	4	10
5777	8	70	5	3
5785	14	39	4	7
5793	15	18	9	228
5801	16	18	4	66
5809	12	56	3	147
5817	20	10	3	219
4205	8	52	5	3
4213	4	65	6	4
4221	5	10	4	6
4229	11	4	3	20
4237	26	53	4	6
4245	15	43	4	7
4253	17	19	7	2
4261	27	5	3	84
4269	7	58	6	4
4277	10	18	4	7
4285	15	32	4	5
4293	2	64	4	6
4301	12	8	5	3
4309	12	56	3	82
4317	11	19	5	3
4325	22	14	7	1
4333	8	70	4	7
4341	18	18	4	7
4349	20	72	4	7
4357	8	33	7	2
4365	4	40	4	7
4373	18	61	4	6
4381	23	66	4	6
4389	25	45	12	229
4397	18	37	4	30
4405	27	23	3	164
4413	26	44	4	7
4421	3	1	6	4
4429	9	14	4	5
4437	16	25	7	1
4445	19	35	4	6
4453	22	32	4	36
4461	14	12	3	15
4469	2	64	7	1
4477	13	26	4	5
4485	22	65	3	150
4493	13	28	4	6
4501	10	65	9	228
4509	11	45	4	211
4517	19	61	4	52
4525	20	45	4	5
4533	12	63	9	228
4541	17	56	3	147
4549	19	58	4	7
4557	23	64	9	228
4565	17	70	3	152
4573	11	55	4	7
4581	22	4	5	3
4589	8	13	6	4
4597	12	44	4	156
4605	22	48	7	1
4613	18	47	5	3
4621	19	39	9	228
4629	26	71	5	3
4637	11	43	6	4
4645	28	52	7	2
4653	3	27	3	53
4661	19	40	6	4
4669	23	63	3	126
4677	25	39	5	3
4685	12	36	4	5
4693	24	13	4	6
4701	19	40	5	3
4709	20	32	4	36
4717	20	66	7	1
4725	25	13	7	1
4733	2	54	9	228
4741	4	29	7	2
4749	23	4	4	6
4757	10	5	12	84
4765	8	9	4	5
4773	24	3	7	2
4781	2	67	4	6
4789	26	6	9	228
4797	7	17	7	2
4805	3	18	7	2
4813	26	46	7	2
4821	20	6	3	63
4829	26	38	4	64
4837	2	36	7	2
4845	25	18	5	3
4853	20	56	7	1
4861	25	26	5	3
4869	18	58	6	4
4877	23	60	3	169
4885	10	44	4	5
4893	19	36	4	5
4901	12	65	4	5
4909	23	10	6	4
4917	22	42	12	108
4925	27	38	9	228
4933	2	14	3	57
4941	13	51	7	1
4949	24	14	7	2
4957	14	58	4	114
4965	17	1	4	5
4973	2	26	7	2
4981	15	67	5	3
4989	5	56	4	172
4997	15	56	12	214
5005	15	24	7	2
5013	14	56	3	223
5021	27	39	4	5
5029	12	17	4	133
5037	27	56	12	122
5045	26	45	4	6
5053	27	30	4	6
5061	22	1	4	6
5069	26	56	12	196
5077	9	72	7	2
5085	24	1	4	5
5093	4	41	4	11
5101	26	34	4	6
5109	9	5	3	84
5117	18	67	4	6
5125	25	57	4	7
5133	4	64	4	7
5141	11	46	6	4
5149	9	32	6	4
5157	28	10	3	178
5165	5	20	7	1
5173	4	53	4	198
5181	8	22	4	5
5189	6	32	12	106
5197	27	57	4	79
5205	22	63	7	2
5213	13	27	7	1
5221	17	7	4	102
5229	3	44	7	2
5237	9	56	4	172
5245	8	15	5	3
5253	10	25	7	2
5261	10	58	5	3
5269	15	47	4	6
5277	5	32	5	3
5285	5	29	4	7
5293	22	18	4	103
5301	22	2	7	2
5309	7	52	5	3
5317	5	62	6	4
5325	24	36	3	182
5333	14	37	9	228
5341	22	54	5	3
5349	7	5	4	199
5357	9	56	9	228
5365	14	56	3	196
5373	25	28	4	5
5381	2	38	4	128
5389	4	18	4	32
5397	26	73	4	7
5405	7	45	6	4
5413	19	25	3	165
5421	7	46	3	231
5429	11	42	4	5
5437	27	17	4	6
5445	20	27	6	4
5453	5	64	7	1
5030	7	43	3	101
5038	4	36	6	4
5046	22	46	3	201
5054	15	33	7	1
5062	25	58	5	3
5070	13	40	4	5
5078	11	19	3	76
5086	15	18	4	160
5094	17	54	10	221
5102	22	34	7	2
5110	20	13	7	1
5118	17	25	7	2
5126	21	42	7	2
5134	28	63	4	7
5142	3	69	5	3
5150	28	16	4	7
5158	10	38	4	64
5166	16	27	4	5
5174	17	49	3	151
5182	21	49	6	4
5190	11	36	9	228
5198	16	61	4	6
5206	13	46	12	229
5214	21	50	4	5
5222	26	70	3	152
5230	9	14	7	2
5238	16	11	4	58
5246	19	48	7	1
5254	20	49	7	2
5262	4	44	9	228
5270	21	56	12	214
5278	28	39	4	140
5286	4	37	4	5
5294	28	19	7	1
5302	10	48	4	6
5310	6	65	4	173
5318	19	5	3	143
5326	23	31	6	206
5334	20	28	4	5
5342	22	46	4	227
5350	9	58	4	6
5358	27	7	7	2
5366	21	33	6	4
5374	22	40	13	78
5382	3	53	5	3
5390	9	50	10	202
5398	21	30	3	161
5406	2	8	4	6
5414	18	42	5	3
5422	2	21	4	168
5430	22	15	6	4
5438	26	33	7	2
5446	11	9	9	228
5454	24	28	3	161
5462	12	22	5	3
5470	11	6	7	1
5478	9	18	7	1
5486	18	74	5	3
5494	23	55	4	80
5502	16	8	4	6
5510	18	47	4	5
5518	2	1	4	5
5526	28	33	4	6
5534	14	53	9	228
5542	17	58	5	3
5550	14	63	3	126
5558	15	33	3	71
5566	17	24	4	6
5574	4	47	4	5
5582	24	32	6	4
5590	18	46	3	232
5598	6	22	7	1
5606	10	32	5	3
5614	25	70	4	7
5622	27	13	7	1
5630	2	45	12	229
5638	7	73	7	1
5646	24	14	9	228
5654	18	55	7	1
5662	26	17	9	228
5670	6	68	6	4
5678	4	72	5	3
5686	3	50	7	2
5694	13	33	4	6
5702	22	42	7	2
5710	8	10	7	1
5718	25	25	3	139
5726	13	11	4	6
5734	6	43	12	101
5742	6	65	7	2
5750	7	54	6	4
5758	8	56	4	7
5766	18	26	2	187
5774	20	54	9	228
5782	22	52	4	5
5790	21	9	4	5
5798	22	21	4	6
5806	13	27	6	4
5814	18	35	4	5
5822	28	51	9	228
5830	16	54	4	218
5838	2	56	7	2
5846	21	4	4	121
5854	19	27	3	149
5862	19	66	6	4
5870	28	62	4	5
5878	8	74	4	7
5886	22	62	4	5
5894	26	1	5	3
5902	20	56	12	215
5910	27	66	4	5
5918	5	6	7	1
5926	5	16	4	5
5934	14	69	7	2
5942	6	10	3	219
5950	6	2	12	175
5958	18	60	9	228
5966	7	7	4	7
5974	12	22	6	4
5982	5	55	3	144
5990	22	27	5	3
5998	21	54	6	4
6006	18	48	6	4
6014	6	56	4	5
6022	20	34	4	5
6030	6	13	6	4
6038	16	20	4	7
6046	7	41	5	3
6054	23	65	5	3
6062	17	55	6	4
6070	22	7	4	6
6078	6	36	4	30
6086	3	14	5	3
6094	26	70	9	228
6102	16	40	4	6
6110	10	40	4	78
6118	18	1	9	228
6126	6	11	4	6
6134	20	67	4	5
6142	15	42	7	1
6150	27	52	5	3
6158	12	56	12	215
6166	15	56	12	147
6174	19	71	4	6
6182	18	28	3	161
6190	20	4	4	121
6198	9	35	5	3
6206	18	36	3	182
6214	11	25	7	1
6222	21	33	9	228
6230	3	47	4	6
6238	6	64	4	6
6246	6	62	9	228
6254	9	30	4	7
6262	8	8	7	1
6270	17	67	6	4
6278	21	52	4	145
5034	2	26	4	7
5042	19	42	7	1
5050	14	46	3	201
5058	19	65	4	5
5066	12	25	4	33
5074	4	8	5	3
5082	11	45	7	1
5090	13	39	4	5
5098	11	42	7	1
5106	27	56	12	208
5114	13	29	9	228
5122	14	56	12	214
5130	13	31	9	228
5138	21	25	5	3
5146	22	61	9	228
5154	8	14	7	2
5162	8	27	4	5
5170	14	65	4	6
5178	13	49	6	4
5186	11	1	8	148
5194	2	61	4	6
5202	28	48	4	81
5210	6	67	4	41
5218	25	32	3	75
5226	16	14	7	2
5234	4	4	6	4
5242	25	38	7	2
5250	5	47	4	5
5258	9	28	3	162
5266	4	50	9	228
5274	3	44	4	156
5282	27	53	4	7
5290	3	70	4	98
5298	14	57	5	3
5306	6	9	5	3
5314	24	44	4	6
5322	24	28	5	3
5330	25	3	4	157
5338	24	53	4	5
5346	9	16	6	4
5354	24	41	4	7
5362	11	41	9	228
5370	24	66	6	4
5378	8	21	4	168
5386	4	22	4	7
5394	12	8	4	7
5402	25	10	3	190
5410	26	45	3	232
5418	2	62	3	97
5426	11	71	7	1
5434	9	39	7	1
5442	5	13	9	228
5450	3	10	4	5
5458	7	51	7	2
5466	8	20	7	2
5474	25	66	6	4
5482	27	65	7	2
5490	28	46	3	200
5498	9	42	5	3
5506	24	49	10	170
5514	10	44	9	228
5522	21	22	7	1
5530	11	47	4	5
5538	9	72	9	228
5546	9	23	7	1
5554	12	39	3	107
5562	28	10	9	228
5570	5	9	7	1
5578	19	53	3	203
5586	28	73	4	6
5594	6	7	2	186
5602	20	71	4	5
5610	18	38	4	167
5618	18	24	4	181
5626	21	38	6	4
5634	3	4	9	228
5642	10	47	4	5
5650	13	63	3	126
5658	2	28	3	99
5666	5	48	7	1
5674	17	38	4	64
5682	3	25	4	67
5690	14	15	4	6
5698	24	46	7	2
5706	19	46	9	228
5714	8	59	4	6
5722	7	27	5	3
5730	18	38	4	94
5738	18	46	3	222
5746	16	61	5	3
5754	11	60	6	4
5762	23	39	9	228
5770	5	41	4	7
5778	8	57	3	18
5786	23	12	9	228
5794	17	30	4	7
5802	13	13	5	3
5810	8	59	7	1
5818	5	10	3	153
5826	2	70	5	3
5834	4	48	9	228
5842	3	67	9	228
5850	2	59	7	1
5858	3	66	3	86
5866	18	34	9	228
5874	10	44	4	6
5882	6	63	3	90
5890	6	6	4	6
5898	18	9	6	4
5906	25	23	4	5
5914	23	56	12	147
5922	7	37	4	30
5930	18	50	10	202
5938	24	58	4	6
5946	28	26	9	228
5954	16	9	12	111
5962	26	15	7	2
5970	19	25	3	139
5978	11	40	4	78
5986	2	59	4	6
5994	28	58	7	2
6002	22	65	3	89
6010	10	52	7	2
6018	18	9	9	228
6026	3	29	4	5
6034	3	21	4	5
6042	28	59	6	4
6050	13	19	4	7
6058	18	41	7	2
6066	9	28	9	228
6074	22	40	9	228
6082	20	57	4	6
6090	22	56	3	122
6098	16	71	4	56
6106	13	21	7	2
6114	5	66	4	5
6122	25	53	4	5
6130	28	31	7	1
6138	26	38	7	1
6146	11	45	7	2
6154	19	13	9	228
6162	10	17	4	160
6170	14	65	9	228
6178	7	45	4	222
6186	10	62	4	7
6194	22	22	4	5
6202	21	12	7	2
6210	8	60	7	2
6218	16	19	7	1
6226	18	45	3	226
6234	23	4	3	20
6242	26	5	4	199
6250	17	12	4	6
6258	14	5	5	3
6266	21	13	5	3
6274	23	44	4	7
6282	24	9	9	228
5036	19	35	3	166
5044	5	18	6	4
5052	22	11	3	24
5060	2	50	2	213
5068	6	50	9	228
5076	16	70	7	1
5084	20	68	4	42
5092	12	16	7	1
5100	18	55	3	159
5108	2	37	5	3
5116	9	25	7	2
5124	6	14	4	25
5132	21	31	9	228
5140	25	52	7	1
5148	13	18	4	180
5156	3	51	5	3
5164	7	72	4	5
5172	20	62	4	6
5180	21	56	3	223
5188	17	25	3	183
5196	17	72	9	228
5204	19	47	4	5
5212	15	63	6	4
5220	10	8	4	28
5228	27	74	3	100
5236	20	61	4	7
5244	20	10	4	7
5252	27	70	9	228
5260	15	65	7	1
5268	20	40	12	92
5276	26	19	3	76
5284	7	56	3	223
5292	4	34	4	29
5300	15	7	7	1
5308	13	70	4	43
5316	13	50	3	197
5324	15	31	6	206
5332	7	19	7	2
5340	5	4	7	1
5348	21	38	7	1
5356	17	9	7	2
5364	22	49	4	6
5372	28	72	3	37
5380	9	70	4	5
5388	21	54	5	3
5396	10	56	5	3
5404	7	38	7	1
5412	11	3	4	157
5420	28	47	9	228
5428	16	42	6	4
5436	14	51	4	7
5444	4	17	4	160
5452	6	63	4	48
5460	25	17	4	103
5468	6	27	9	228
5476	23	23	7	1
5484	18	50	7	1
5492	25	72	4	6
5500	21	56	3	196
5508	3	12	4	6
5516	9	34	7	1
5524	16	65	5	3
5532	5	17	4	7
5540	13	56	12	214
5548	15	42	9	228
5556	26	35	7	2
5564	18	68	7	2
5572	5	39	4	5
5580	17	18	5	3
5588	10	46	3	232
5596	13	14	4	25
5604	25	64	9	228
5612	19	64	5	3
5620	3	67	4	6
5628	18	56	4	46
5636	8	23	7	1
5644	8	65	5	3
5652	12	11	3	132
5660	2	73	4	5
5668	28	29	5	3
5676	6	21	7	2
5684	12	57	9	228
5692	26	26	4	31
5700	18	10	3	220
5708	8	26	6	4
5716	16	59	4	6
5724	28	21	4	6
5732	7	60	4	5
5740	28	19	9	228
5748	19	44	4	6
5756	27	1	5	3
5764	18	1	4	7
5772	6	73	7	2
5780	8	66	4	47
5788	8	49	2	217
5796	28	61	4	6
5804	13	17	4	66
5812	23	19	5	3
5820	15	4	7	2
5828	28	69	7	2
5836	5	23	4	5
5844	5	3	4	157
5852	4	58	4	6
5860	21	54	9	228
5868	14	51	9	228
5876	20	17	4	66
5884	18	44	4	6
5892	23	69	6	4
5900	28	7	6	4
5908	26	46	12	216
5916	3	18	7	1
5924	10	3	4	157
5932	15	14	4	7
5940	22	59	4	136
5948	3	58	7	1
5956	24	10	3	190
5964	5	35	4	134
5972	2	29	3	161
5980	13	22	5	3
5988	28	13	4	5
5996	14	10	4	6
6004	23	72	4	7
6012	23	31	7	1
6020	19	74	5	3
6028	6	50	3	197
6036	10	74	3	135
6044	26	10	3	153
6052	9	69	7	1
6060	27	11	12	96
6068	9	74	6	4
6076	12	70	3	152
6084	20	33	6	4
6092	19	38	9	228
6100	22	23	9	228
6108	14	3	4	7
6116	6	15	7	1
6124	21	19	6	4
6132	23	47	5	3
6140	13	51	7	2
6148	14	15	5	3
6156	25	14	4	6
6164	10	21	4	5
6172	13	3	4	6
6180	3	41	13	109
6188	27	33	5	3
6196	18	46	3	225
6204	14	29	6	206
6212	12	22	9	228
6220	4	18	4	6
6228	24	72	7	1
6236	27	56	3	196
6244	9	11	3	24
6252	6	66	5	3
6260	13	29	4	6
6268	12	35	4	77
6276	16	42	9	228
6284	9	21	4	5
5032	14	56	12	82
5040	2	65	7	2
5048	26	7	2	186
5056	14	21	4	5
5064	8	11	7	2
5072	19	16	7	1
5080	19	25	7	2
5088	13	9	7	1
5096	11	53	4	7
5104	28	74	7	2
5112	17	5	3	84
5120	8	18	6	4
5128	17	12	9	228
5136	28	63	9	228
5144	22	11	4	5
5152	7	24	7	2
5160	18	56	3	208
5168	6	41	4	6
5176	9	25	3	183
5184	22	31	6	4
5192	15	49	5	3
5200	3	41	4	11
5208	25	36	5	3
5216	8	63	4	6
5224	2	46	3	226
5232	26	45	3	225
5240	17	2	7	1
5248	17	32	9	228
5256	25	57	7	2
5264	19	64	6	4
5272	11	57	7	2
5280	9	46	3	229
5288	23	29	4	5
5296	13	38	6	4
5304	14	16	7	2
5312	5	15	3	57
5320	13	51	4	7
5328	2	60	7	2
5336	14	73	5	3
5344	10	50	10	202
5352	13	57	7	1
5360	21	7	7	2
5368	18	20	9	228
5376	19	43	12	101
5384	23	23	4	6
5392	28	3	7	1
5400	14	46	4	227
5408	14	54	5	3
5416	2	10	5	3
5424	21	26	7	2
5432	22	51	4	7
5440	22	15	9	228
5448	13	59	4	7
5456	5	52	6	4
5464	4	5	12	171
5472	18	71	7	1
5480	20	45	4	7
5488	2	26	7	1
5496	17	42	5	3
5504	13	65	4	173
5512	21	24	7	2
5520	10	56	4	6
5528	8	10	4	6
5536	27	31	7	2
5544	16	69	9	228
5552	3	28	3	99
5560	10	24	4	181
5568	3	74	3	16
5576	27	38	6	4
5584	11	10	3	220
5592	15	65	3	188
5600	21	67	4	41
5608	18	48	7	1
5616	3	40	4	39
5624	10	56	4	46
5632	3	56	7	1
5640	16	8	9	228
5648	20	46	12	229
5656	6	29	9	228
5664	16	26	6	4
5672	3	64	4	7
5680	25	12	4	5
5688	4	28	4	6
5696	11	17	7	2
5704	14	70	6	4
5712	9	26	5	3
5720	9	33	3	71
5728	9	12	7	1
5736	18	28	5	3
5744	23	32	4	7
5752	15	61	4	6
5760	11	18	4	32
5768	21	65	4	7
5776	24	60	9	228
5784	18	41	4	7
5792	27	62	5	3
5800	2	11	4	5
5808	27	40	4	7
5816	3	16	6	4
5824	24	56	5	3
5832	4	18	7	1
5840	10	50	4	6
5848	28	10	7	1
5856	24	42	4	5
5864	13	45	6	4
5872	6	25	3	165
5880	26	37	7	2
5888	10	18	4	32
5896	2	67	4	7
5904	25	13	4	7
5912	28	15	6	4
5920	4	23	4	5
5928	20	65	4	173
5936	5	5	7	2
5944	13	62	5	3
5952	20	22	6	4
5960	11	48	6	4
5968	27	29	6	206
5976	12	6	7	1
5984	12	19	4	7
5992	3	52	7	2
6000	27	15	9	228
6008	21	50	2	213
6016	5	20	6	4
6024	22	8	9	228
6032	24	74	9	228
6040	4	24	4	5
6048	20	46	4	6
6056	17	60	3	169
6064	22	49	7	1
6072	24	4	4	7
6080	27	18	7	2
6088	9	66	5	3
6096	6	49	7	1
6104	23	35	4	7
6112	9	71	5	3
6120	11	5	4	5
6128	27	69	7	2
6136	20	1	9	228
6144	20	22	9	228
6152	21	59	9	228
6160	3	9	12	111
6168	15	4	3	20
6176	6	56	3	147
6184	4	66	3	86
6192	12	4	4	121
6200	11	56	4	5
6208	26	65	4	173
6216	7	27	6	4
6224	28	70	7	1
6232	17	10	4	5
6240	2	43	3	101
6248	21	68	7	1
6256	10	73	3	34
6264	22	54	3	221
6272	25	36	4	6
6280	21	8	4	93
5461	6	19	7	2
5469	5	46	12	216
5477	23	13	4	5
5485	12	25	4	6
5493	14	8	9	228
5501	5	63	4	5
5509	11	34	4	29
5517	18	44	9	228
5525	6	56	12	82
5533	23	43	3	101
5541	16	28	3	162
5549	6	12	3	87
5557	17	6	7	2
5565	8	18	4	133
5573	20	12	4	5
5581	15	24	9	228
5589	15	41	13	109
5597	25	4	5	3
5605	6	25	5	3
5613	25	3	7	2
5621	8	33	4	5
5629	10	32	6	4
5637	19	39	4	5
5645	15	56	7	2
5653	24	55	4	6
5661	5	11	7	2
5669	5	40	12	92
5677	28	28	7	2
5685	4	67	7	1
5693	27	23	4	7
5701	8	11	4	58
5709	10	34	7	1
5717	15	62	4	5
5725	13	29	7	1
5733	16	53	5	3
5741	20	15	4	7
5749	18	44	4	192
5757	20	44	12	179
5765	10	15	3	57
5773	19	10	3	153
5781	21	47	4	7
5789	26	55	3	144
5797	16	28	7	2
5805	24	71	4	26
5813	19	27	4	7
5821	28	8	6	4
5829	28	26	6	4
5837	26	5	9	228
5845	27	50	3	197
5853	15	18	4	7
5861	3	74	9	228
5869	17	61	4	5
5877	6	1	9	228
5885	8	46	3	216
5893	20	1	5	3
5901	9	49	4	85
5909	11	22	9	228
5917	27	11	7	1
5925	2	7	4	23
5933	5	53	4	5
5941	8	21	5	3
5949	9	2	5	3
5957	15	54	10	221
5965	22	7	3	155
5973	9	49	10	224
5981	8	38	4	5
5989	6	62	5	3
5997	20	73	7	2
6005	2	24	6	4
6013	12	33	9	228
6021	23	11	4	58
6029	7	68	7	1
6037	24	44	7	1
6045	24	71	4	6
6053	18	20	4	113
6061	12	5	7	2
6069	8	35	9	228
6077	2	22	3	73
6085	28	56	7	1
6093	6	60	4	6
6101	27	42	7	1
6109	17	66	5	3
6117	17	9	9	228
6125	5	10	3	190
6133	27	49	7	1
6141	13	54	3	221
6149	18	18	4	6
6157	27	57	4	6
6165	4	23	3	164
6173	5	1	7	2
6181	13	52	5	3
6189	11	46	12	216
6197	13	20	4	5
6205	25	27	4	7
6213	5	56	2	223
6221	10	18	4	6
6229	15	73	4	5
6237	8	16	7	2
6245	4	52	4	7
6253	5	74	5	3
6261	14	21	4	6
6269	14	11	12	96
6277	15	8	5	3
6285	3	60	3	169
6293	13	19	9	228
6301	8	49	4	45
6309	16	55	4	10
6317	15	40	6	4
6325	26	60	11	169
6333	20	38	4	128
6341	11	4	6	4
6349	11	33	9	228
6357	23	14	7	1
6365	16	58	4	6
6373	12	20	4	6
6381	9	7	4	131
6389	13	38	4	128
6397	5	54	7	1
6405	22	56	4	172
6413	21	54	4	218
6421	16	14	9	228
6429	27	50	4	7
6437	2	38	4	167
6445	2	38	4	64
6453	16	4	4	121
6461	10	41	9	228
6469	14	39	4	6
6477	24	70	7	2
6485	23	23	5	3
6493	28	16	7	1
6501	8	38	4	167
6509	21	50	4	7
6517	15	34	4	6
6525	24	46	5	3
6533	7	50	2	213
6541	10	46	3	225
6549	23	35	7	1
6557	19	20	6	4
6565	5	25	3	139
6573	3	18	4	6
6581	27	27	9	228
6589	7	26	4	7
6597	14	5	3	119
6605	11	65	4	173
6613	20	45	3	216
6621	27	21	7	2
6629	23	74	7	1
6637	17	14	5	3
6645	13	7	7	1
6653	15	29	3	161
6661	16	22	3	73
6669	3	33	4	7
6677	11	36	4	7
6685	11	36	4	30
6693	16	59	6	4
6701	23	35	4	30
6709	23	35	3	166
5031	20	24	3	137
5039	15	45	4	230
5047	27	57	7	2
5055	10	46	4	230
5063	5	74	3	16
5071	18	4	4	5
5079	16	41	5	3
5087	18	46	3	200
5095	11	74	3	16
5103	10	4	9	228
5111	6	58	4	114
5119	14	17	5	3
5127	8	21	4	6
5135	12	46	3	201
5143	11	56	3	174
5151	5	46	6	4
5159	26	68	5	3
5167	28	27	4	6
5175	13	56	12	208
5183	15	23	6	4
5191	27	44	3	130
5199	22	33	7	1
5207	16	62	4	5
5215	15	53	9	228
5223	10	32	4	36
5231	13	53	10	203
5239	4	40	5	3
5247	11	18	4	5
5255	19	57	7	2
5263	20	64	5	3
5271	8	69	9	228
5279	2	63	7	1
5287	18	59	4	5
5295	21	31	6	207
5303	20	19	3	76
5311	23	63	11	126
5319	15	63	11	126
5327	21	51	4	7
5335	3	51	4	6
5343	28	21	7	1
5351	2	9	12	111
5359	5	72	7	1
5367	3	49	4	45
5375	10	18	7	1
5383	7	9	4	5
5391	4	44	4	6
5399	10	1	7	2
5407	5	12	4	141
5415	2	34	7	2
5423	14	49	4	6
5431	4	34	9	228
5439	26	63	3	90
5447	24	71	7	1
5455	19	15	4	7
5463	28	29	6	206
5471	23	18	4	133
5479	17	26	4	6
5487	16	16	7	2
5495	4	25	3	139
5503	25	9	9	228
5511	13	56	3	223
5519	14	61	9	228
5527	20	9	4	6
5535	13	41	7	1
5543	4	36	4	30
5551	3	25	4	104
5559	15	20	4	7
5567	3	44	9	228
5575	2	71	4	7
5583	22	33	4	6
5591	13	41	4	6
5599	25	1	8	88
5607	6	23	3	137
5615	25	51	4	5
5623	2	7	9	228
5631	11	58	4	5
5639	28	38	4	19
5647	8	31	7	1
5655	28	70	6	4
5663	7	5	4	6
5671	28	31	9	228
5679	23	59	7	1
5687	8	64	3	14
5695	11	9	4	6
5703	10	72	6	4
5711	17	26	5	3
5719	3	49	10	224
5727	21	11	4	6
5735	18	10	3	210
5743	18	28	6	4
5751	12	54	4	7
5759	6	46	3	231
5767	2	31	3	161
5775	8	55	7	2
5783	5	23	3	164
5791	21	17	4	66
5799	22	37	4	30
5807	16	59	7	1
5815	15	19	5	3
5823	18	56	5	3
5831	17	39	4	6
5839	6	33	7	2
5847	9	28	6	4
5855	16	35	6	4
5863	9	40	7	1
5871	25	52	6	4
5879	25	30	5	3
5887	20	65	4	7
5895	9	55	9	228
5903	4	27	12	191
5911	23	41	4	5
5919	27	60	4	5
5927	13	54	5	3
5935	23	8	9	228
5943	4	32	7	1
5951	7	17	7	1
5959	8	65	3	188
5967	3	33	4	35
5975	20	30	5	3
5983	9	67	6	4
5991	20	12	4	141
5999	4	31	4	5
6007	18	58	7	1
6015	11	16	4	25
6023	12	74	4	5
6031	28	61	7	1
6039	26	13	6	4
6047	8	37	4	6
6055	27	14	3	57
6063	28	45	3	201
6071	14	40	9	228
6079	22	35	7	2
6087	5	4	6	4
6095	2	34	5	3
6103	18	64	4	6
6111	5	17	7	1
6119	8	37	4	30
6127	7	1	8	124
6135	19	30	5	3
6143	25	2	12	175
6151	4	55	5	3
6159	9	29	4	5
6167	16	23	12	137
6175	16	2	9	228
6183	19	46	7	1
6191	22	12	4	7
6199	13	12	7	2
6207	26	12	4	141
6215	15	26	5	3
6223	19	45	7	2
6231	6	22	9	228
6239	20	54	7	2
6247	27	57	7	1
6255	3	9	4	7
6263	13	5	6	4
6271	8	42	9	228
6279	13	52	4	145
5035	2	36	4	7
5043	25	42	7	1
5051	25	61	9	228
5059	23	20	6	4
5067	25	25	7	2
5075	26	22	3	73
5083	21	44	3	179
5091	10	71	4	7
5099	25	29	6	4
5107	2	18	4	7
5115	20	43	3	232
5123	9	12	9	228
5131	27	31	4	7
5139	20	10	7	2
5147	16	39	6	4
5155	7	61	3	9
5163	6	9	12	70
5171	8	72	7	2
5179	10	65	4	5
5187	8	51	9	228
5195	7	25	5	3
5203	22	48	4	81
5211	14	28	12	194
5219	19	46	6	4
5227	27	3	6	4
5235	14	56	12	174
5243	16	15	5	3
5251	2	37	6	4
5259	22	10	6	4
5267	22	63	3	126
5275	8	49	3	151
5283	9	38	4	64
5291	27	27	7	1
5299	19	66	7	1
5307	17	49	4	5
5315	11	5	4	7
5323	9	20	4	113
5331	13	5	4	199
5339	23	25	3	183
5347	24	27	12	191
5355	7	37	7	2
5363	16	10	5	3
5371	13	66	4	5
5379	2	49	2	217
5387	3	9	4	27
5395	22	7	6	4
5403	12	62	6	4
5411	2	74	4	7
5419	28	56	3	196
5427	23	21	4	6
5435	14	64	3	14
5443	27	59	6	4
5451	9	63	5	3
5459	19	17	4	103
5467	20	27	4	7
5475	14	70	7	1
5483	6	5	4	199
5491	19	72	4	6
5499	8	9	12	111
5507	2	22	3	137
5515	25	64	6	4
5523	15	66	7	2
5531	21	63	3	126
5539	12	40	12	92
5547	9	56	4	46
5555	27	54	4	6
5563	9	24	4	6
5571	13	28	3	17
5579	15	47	7	1
5587	25	72	3	118
5595	21	33	7	1
5603	7	38	9	228
5611	6	46	5	3
5619	28	21	4	142
5627	21	57	6	4
5635	7	64	4	5
5643	9	42	4	6
5651	25	46	9	228
5659	8	54	10	221
5667	16	63	7	1
5675	21	46	3	201
5683	16	64	3	14
5691	28	65	4	6
5699	26	70	7	2
5707	18	74	4	6
5715	21	29	6	206
5723	27	51	4	44
5731	18	47	4	38
5739	9	73	3	34
5747	11	24	4	5
5755	22	19	9	228
5763	27	45	9	228
5771	5	1	9	228
5779	15	24	4	6
5787	12	39	3	74
5795	13	9	4	5
5803	8	4	4	83
5811	14	3	7	1
5819	12	15	4	7
5827	19	2	12	175
5835	5	56	12	146
5843	11	15	3	57
5851	10	61	4	5
5859	12	57	7	1
5867	15	37	5	3
5875	12	27	3	149
5883	3	23	6	4
5891	27	59	4	7
5899	24	17	4	180
5907	7	31	3	162
5915	28	54	10	221
5923	23	12	6	4
5931	3	21	4	168
5939	18	62	4	127
5947	15	31	7	1
5955	8	23	12	137
5963	11	30	6	4
5971	14	40	7	2
5979	24	62	4	7
5987	3	35	5	3
5995	4	16	5	3
6003	15	56	3	122
6011	9	40	4	6
6019	25	47	4	38
6027	26	65	7	2
6035	19	5	12	177
6043	17	63	6	4
6051	4	45	4	230
6059	17	9	4	7
6067	8	2	6	4
6075	19	54	4	209
6083	2	56	5	3
6091	3	74	3	135
6099	4	25	7	1
6107	15	35	4	7
6115	17	72	4	6
6123	13	19	6	4
6131	5	43	12	101
6139	23	45	12	229
6147	14	59	4	136
6155	8	56	3	146
6163	24	67	4	62
6171	16	60	7	2
6179	16	18	4	103
6187	2	57	3	18
6195	13	30	4	5
6203	16	51	4	6
6211	27	72	3	37
6219	19	73	4	7
6227	12	10	3	219
6235	5	50	7	1
6243	5	48	6	4
6251	28	22	4	5
6259	4	74	6	4
6267	10	67	5	3
6275	18	66	9	228
6283	26	55	4	5
6292	21	63	3	90
6300	4	10	3	190
6308	6	1	6	4
6316	27	70	7	1
6324	28	15	5	3
6332	21	65	9	228
6340	21	8	5	3
6348	22	23	6	4
6356	12	12	3	15
6364	3	51	6	4
6372	13	52	4	6
6380	20	29	7	2
6388	4	2	12	175
6396	16	3	4	6
6404	5	39	3	107
6412	23	37	3	205
6420	7	31	6	4
6428	18	73	7	2
6436	7	20	7	1
6444	9	37	6	4
6452	23	55	6	4
6460	11	31	4	7
6468	14	32	4	7
6476	21	5	12	84
6484	20	70	9	228
6492	2	59	6	4
6500	7	40	7	2
6508	2	46	3	232
6516	17	4	7	2
6524	17	16	4	25
6532	27	22	5	3
6540	14	22	4	5
6548	25	10	3	210
6556	10	60	6	4
6564	26	36	4	6
6572	6	40	4	78
6580	22	45	3	201
6588	4	56	6	4
6596	10	46	5	3
6604	27	65	6	4
6612	24	36	7	2
6620	27	61	7	2
6628	9	66	9	228
6636	9	30	7	1
6644	15	72	5	3
6652	2	30	3	162
6660	14	70	4	5
6668	14	21	4	7
6676	20	73	5	3
6684	2	16	9	228
6692	15	74	7	1
6700	11	62	7	1
6708	26	54	4	6
6716	4	41	9	228
6724	12	6	4	5
6732	15	3	6	4
6740	20	39	4	140
6748	20	58	7	2
6756	4	22	4	6
6764	13	20	4	6
6772	25	56	3	147
6780	28	62	4	127
6788	15	3	9	228
6796	12	63	7	2
6804	28	68	9	228
6812	13	60	4	6
6820	17	34	5	3
6828	5	46	3	201
6836	7	52	7	1
6844	25	31	4	7
6852	20	66	4	5
6860	23	13	4	6
6868	9	38	7	2
6876	22	64	4	7
6884	9	66	6	4
6892	9	5	5	3
6900	15	35	7	2
6908	14	56	3	82
6916	16	16	9	228
6924	23	21	6	4
6932	14	61	7	2
6940	17	9	6	4
6948	13	12	4	5
6956	27	70	5	3
6964	28	32	9	228
6972	24	14	4	25
6980	23	31	4	5
6988	11	45	4	5
6996	19	28	4	6
7004	24	34	4	5
7012	20	49	7	1
7020	17	49	10	170
7028	8	15	4	5
7036	25	12	6	4
7044	5	70	9	228
7052	18	55	12	159
7060	24	56	2	223
7068	24	48	5	3
7076	21	18	4	7
7084	8	45	12	229
7092	2	66	6	4
7100	28	68	6	4
7108	23	27	7	1
7116	15	17	4	193
7124	22	49	3	151
7132	22	16	4	6
7140	27	47	4	6
7148	12	4	6	4
7156	26	18	4	7
7164	2	74	3	69
7172	23	45	3	231
7180	3	11	12	96
7188	8	39	5	3
7196	17	56	4	5
7204	8	38	4	7
7212	3	11	7	1
7220	4	15	4	6
7228	12	72	4	7
7236	7	5	3	84
7244	14	69	4	5
7252	26	44	4	156
7260	10	38	4	19
7268	5	37	9	228
7276	2	25	3	165
7284	26	73	4	5
7292	16	49	10	170
7300	8	44	12	179
7308	6	25	4	67
7316	21	50	9	228
7324	21	46	3	216
7332	11	35	4	6
7340	8	36	7	1
7348	2	55	4	6
7356	23	11	5	3
7364	18	27	4	5
7372	13	10	7	1
7380	24	74	4	5
7388	15	13	4	115
7396	19	36	4	30
7404	25	71	4	5
7412	10	16	4	5
7420	24	30	3	68
7428	20	48	4	5
7436	8	69	7	2
7444	15	45	12	216
7452	16	50	3	202
7460	18	68	4	61
7468	27	30	4	7
7476	7	46	3	222
7484	15	62	6	4
7492	24	61	7	1
7500	3	52	5	3
7508	18	65	3	89
7516	10	27	5	3
7524	16	52	9	228
7532	15	63	4	5
7540	12	38	4	5
5825	22	61	4	6
5833	19	60	6	4
5841	12	54	7	2
5849	13	4	4	121
5857	19	10	3	190
5865	15	35	4	6
5873	18	4	7	1
5881	7	33	6	4
5889	16	37	7	1
5897	21	19	7	2
5905	5	73	7	2
5913	13	10	3	219
5921	17	21	4	168
5929	17	40	4	6
5937	11	5	7	2
5945	6	70	4	60
5953	16	53	6	4
5961	3	11	3	24
5969	18	72	4	6
5977	8	65	3	125
5985	19	65	12	188
5993	25	67	4	5
6001	28	7	9	228
6009	18	32	7	1
6017	15	15	5	3
6025	12	37	4	7
6033	3	31	4	5
6041	12	40	4	78
6049	12	5	12	177
6057	6	6	4	49
6065	3	28	9	228
6073	5	25	4	6
6081	2	43	4	6
6089	17	32	4	6
6097	18	40	4	78
6105	13	56	12	147
6113	9	4	7	2
6121	13	35	4	77
6129	17	2	6	4
6137	12	41	5	3
6145	28	12	4	7
6153	23	73	4	5
6161	6	5	4	7
6169	22	46	3	200
6177	18	8	4	55
6185	15	63	7	1
6193	10	20	6	4
6201	11	16	4	5
6209	17	3	4	5
6217	23	71	4	7
6225	20	27	9	228
6233	16	56	3	146
6241	20	5	4	199
6249	9	50	3	202
6257	26	37	4	7
6265	20	17	4	103
6273	22	11	12	96
6281	10	45	3	226
6289	27	65	4	173
6297	3	48	7	2
6305	17	66	4	7
6313	17	28	9	228
6321	26	38	4	6
6329	17	35	4	6
6337	18	30	4	6
6345	12	26	7	2
6353	7	15	4	6
6361	22	61	7	2
6369	15	53	7	2
6377	12	58	4	7
6385	24	27	4	5
6393	3	23	4	164
6401	4	28	3	99
6409	4	30	4	6
6417	8	1	4	7
6425	12	11	4	7
6433	25	12	5	3
6441	5	17	4	6
6449	20	23	7	2
6457	9	16	4	25
6465	16	5	4	199
6473	18	22	4	6
6481	2	5	5	3
6489	18	69	6	4
6497	21	52	4	6
6505	4	40	4	78
6513	18	65	7	2
6521	8	2	5	3
6529	2	10	6	4
6537	21	20	4	5
6545	27	51	7	2
6553	17	21	4	5
6561	9	43	3	101
6569	28	8	9	228
6577	26	1	8	124
6585	5	72	4	6
6593	22	63	5	3
6601	25	54	7	1
6609	23	55	9	228
6617	13	51	4	5
6625	6	33	9	228
6633	14	56	7	1
6641	9	39	4	5
6649	16	27	12	163
6657	4	53	4	6
6665	23	71	4	26
6673	2	7	4	65
6681	24	25	4	6
6689	12	60	11	169
6697	8	16	5	3
6705	6	63	4	7
6713	19	14	4	5
6721	20	6	4	5
6729	28	29	6	4
6737	24	7	2	186
6745	20	18	4	193
6753	3	30	4	6
6761	27	41	4	5
6769	17	33	7	2
6777	5	73	6	4
6785	16	2	5	3
6793	23	29	6	4
6801	22	55	6	4
6809	6	41	5	3
6817	15	47	4	38
6825	25	26	4	7
6833	20	18	7	2
6841	12	65	6	4
6849	20	28	4	6
6857	23	3	9	228
6865	4	31	7	2
6873	17	6	9	228
6881	17	66	6	4
6889	17	5	5	3
6897	12	49	4	6
6905	22	50	7	2
6913	10	17	4	66
6921	23	62	4	7
6929	2	32	4	6
6937	26	4	5	3
6945	10	34	4	5
6953	23	72	6	4
6961	3	59	9	228
6969	4	51	9	228
6977	7	25	4	104
6985	5	70	3	152
6993	28	43	9	228
7001	8	69	4	7
7009	15	5	7	1
7017	5	56	3	147
7025	24	50	2	213
7033	27	23	6	4
7041	9	11	4	58
7049	22	50	4	7
7057	18	33	4	7
7065	3	18	4	32
7073	7	63	9	228
6288	9	9	4	7
6296	14	41	4	5
6304	13	7	4	7
6312	4	39	7	1
6320	12	56	4	5
6328	13	65	6	4
6336	10	16	4	25
6344	23	50	9	228
6352	19	33	9	228
6360	8	58	4	6
6368	2	50	3	185
6376	6	33	5	3
6384	5	62	7	1
6392	8	4	4	121
6400	27	8	5	3
6408	28	18	9	228
6416	9	74	5	3
6424	21	29	7	2
6432	9	41	7	2
6440	3	52	4	5
6448	27	65	9	228
6456	8	34	6	4
6464	8	14	9	228
6472	14	23	6	4
6480	2	14	9	228
6488	26	6	4	5
6496	13	11	3	132
6504	8	50	7	1
6512	8	38	7	2
6520	28	35	3	166
6528	18	70	7	2
6536	5	39	3	74
6544	15	35	7	1
6552	16	16	4	7
6560	25	22	6	4
6568	23	58	4	7
6576	20	10	3	153
6584	18	10	4	5
6592	28	2	4	6
6600	15	45	3	225
6608	26	37	4	5
6616	27	51	4	5
6624	3	32	4	6
6632	14	39	3	22
6640	10	22	7	1
6648	14	23	5	3
6656	5	38	9	228
6664	11	17	7	1
6672	14	42	7	1
6680	21	8	6	4
6688	16	12	7	2
6696	10	36	4	110
6704	26	22	3	8
6712	16	45	4	222
6720	13	60	11	169
6728	27	27	3	53
6736	16	74	9	228
6744	16	41	7	2
6752	18	28	3	162
6760	3	10	3	210
6768	25	10	3	219
6776	9	16	5	3
6784	6	40	7	2
6792	5	50	3	197
6800	13	36	9	228
6808	14	25	3	183
6816	23	67	4	7
6824	3	40	4	78
6832	25	48	4	5
6840	3	9	6	4
6848	12	23	7	2
6856	28	21	7	2
6864	5	6	5	3
6872	16	50	3	185
6880	18	66	5	3
6888	8	19	9	228
6896	11	67	4	6
6904	14	58	6	4
6912	14	29	9	228
6920	5	62	4	6
6928	7	10	7	1
6936	20	56	3	196
6944	21	49	3	151
6952	14	73	4	5
6960	17	65	12	188
6968	10	11	4	58
6976	15	51	2	212
6984	8	66	9	228
6992	23	28	3	17
7000	2	68	4	6
7008	23	29	5	3
7016	13	47	7	1
7024	17	38	4	7
7032	2	27	12	163
7040	6	23	12	137
7048	28	65	5	3
7056	12	26	6	4
7064	5	69	5	3
7072	16	51	4	44
7080	23	30	6	4
7088	7	55	4	10
7096	28	30	7	2
7104	10	50	3	197
7112	27	45	3	216
7120	17	13	4	5
7128	15	62	7	2
7136	10	67	7	1
7144	7	33	5	3
7152	24	9	5	3
7160	18	65	4	7
7168	5	33	6	4
7176	8	49	4	5
7184	14	63	6	4
7192	11	31	7	2
7200	10	23	12	137
7208	27	4	9	228
7216	5	19	5	3
7224	2	49	4	117
7232	18	27	9	228
7240	3	5	12	177
7248	18	7	4	23
7256	4	22	3	8
7264	23	29	6	207
7272	22	62	4	7
7280	9	45	3	232
7288	21	44	9	228
7296	19	43	4	6
7304	10	54	4	6
7312	8	71	5	3
7320	2	1	9	228
7328	15	22	9	228
7336	5	69	7	2
7344	16	56	12	215
7352	3	34	5	3
7360	24	41	6	4
7368	21	10	7	1
7376	20	28	7	1
7384	10	9	5	3
7392	10	25	4	6
7400	20	46	4	5
7408	10	69	9	228
7416	4	27	4	5
7424	14	11	3	158
7432	20	64	3	14
7440	3	2	12	175
7448	5	23	7	2
7456	25	74	4	5
7464	19	22	7	1
7472	18	48	4	5
7480	28	54	7	2
7488	9	34	4	5
7496	11	11	4	58
7504	26	64	7	2
7512	9	31	6	207
7520	25	62	3	97
7528	21	4	9	228
7536	22	62	7	2
6286	15	71	4	7
6294	8	61	5	3
6302	8	23	9	228
6310	20	25	7	1
6318	6	28	3	184
6326	15	72	9	228
6334	26	55	4	7
6342	3	12	7	2
6350	14	72	7	2
6358	28	39	3	22
6366	11	36	7	2
6374	16	41	4	7
6382	7	51	4	5
6390	20	53	4	198
6398	28	55	4	10
6406	15	61	9	228
6414	17	74	5	3
6422	26	1	4	5
6430	10	23	4	164
6438	3	32	7	1
6446	9	40	4	78
6454	24	69	6	4
6462	20	65	3	89
6470	13	5	12	84
6478	14	52	4	6
6486	27	40	6	4
6494	22	36	5	3
6502	24	45	4	5
6510	9	72	4	6
6518	19	38	4	19
6526	3	65	12	188
6534	13	29	6	206
6542	14	3	4	6
6550	11	39	3	74
6558	6	15	7	2
6566	18	34	6	4
6574	21	7	4	7
6582	11	62	4	7
6590	13	26	4	7
6598	5	50	2	213
6606	21	18	4	133
6614	2	51	7	2
6622	14	23	9	228
6630	13	31	5	3
6638	18	36	4	110
6646	28	63	5	3
6654	15	56	4	6
6662	25	38	5	3
6670	26	46	4	211
6678	14	40	6	4
6686	7	49	4	6
6694	18	23	3	137
6702	22	23	5	3
6710	24	16	4	25
6718	16	13	5	3
6726	14	35	3	166
6734	7	47	7	1
6742	18	10	3	153
6750	17	11	4	58
6758	14	72	4	7
6766	8	70	4	98
6774	5	26	7	2
6782	14	49	3	151
6790	12	66	4	5
6798	11	70	9	228
6806	20	65	6	4
6814	22	52	4	6
6822	21	36	6	4
6830	17	64	4	6
6838	17	73	7	2
6846	18	19	3	12
6854	22	55	9	228
6862	20	23	12	137
6870	27	36	9	228
6878	14	68	6	4
6886	24	19	3	12
6894	20	18	4	7
6902	16	52	4	145
6910	5	74	4	5
6918	23	61	9	228
6926	21	55	7	2
6934	15	67	4	7
6942	21	12	4	5
6950	12	68	4	7
6958	15	58	5	3
6966	28	25	4	7
6974	25	39	3	107
6982	19	62	7	1
6990	7	58	4	7
6998	22	21	4	7
7006	26	36	6	4
7014	3	51	4	7
7022	7	68	9	228
7030	13	65	9	228
7038	10	10	3	153
7046	5	5	3	84
7054	16	70	4	98
7062	22	68	5	3
7070	2	50	4	6
7078	2	9	4	7
7086	7	55	7	2
7094	15	11	3	158
7102	12	8	6	4
7110	3	33	7	2
7118	25	37	4	5
7126	3	46	9	228
7134	16	49	4	45
7142	27	23	9	228
7150	6	20	7	1
7158	4	9	5	3
7166	2	60	4	5
7174	23	72	9	228
7182	20	36	9	228
7190	27	55	4	10
7198	9	70	9	228
7206	11	62	3	97
7214	27	56	3	208
7222	16	70	7	2
7230	5	55	7	2
7238	26	49	3	151
7246	22	8	4	5
7254	6	49	3	151
7262	11	53	7	1
7270	15	29	6	207
7278	20	67	7	1
7286	3	13	5	3
7294	11	3	4	6
7302	15	25	4	33
7310	16	71	5	3
7318	18	23	4	7
7326	5	27	5	3
7334	14	36	4	30
7342	17	13	6	4
7350	7	18	4	193
7358	16	8	4	55
7366	28	58	6	4
7374	4	73	4	7
7382	24	44	7	2
7390	8	74	3	69
7398	27	40	9	228
7406	3	6	9	228
7414	27	58	7	2
7422	11	9	4	5
7430	28	43	7	2
7438	7	56	12	147
7446	23	8	4	28
7454	27	26	9	228
7462	26	18	4	133
7470	7	32	4	36
7478	13	22	7	2
7486	27	71	4	6
7494	16	55	12	159
7502	28	8	4	5
7510	13	4	9	228
7518	2	29	3	162
7526	23	13	7	1
7534	9	25	7	1
6287	18	67	4	62
6295	23	46	3	200
6303	17	43	3	21
6311	26	25	7	1
6319	15	5	4	5
6327	2	3	4	6
6335	7	53	3	203
6343	16	9	7	2
6351	28	55	4	116
6359	5	5	4	5
6367	28	61	4	7
6375	12	27	3	53
6383	22	53	7	2
6391	9	35	4	6
6399	8	19	6	4
6407	18	25	3	165
6415	20	11	4	7
6423	6	57	7	1
6431	14	32	9	228
6439	10	44	4	7
6447	14	61	4	7
6455	8	3	4	6
6463	5	63	7	2
6471	18	6	6	4
6479	8	48	6	4
6487	4	46	5	3
6495	2	41	7	2
6503	4	44	4	156
6511	17	33	4	7
6519	5	70	6	4
6527	22	47	4	6
6535	11	46	7	1
6543	26	51	4	44
6551	2	42	9	228
6559	23	42	7	1
6567	5	44	7	1
6575	14	7	9	228
6583	2	2	6	4
6591	26	12	5	3
6599	8	72	7	1
6607	11	44	6	4
6615	21	45	3	222
6623	23	32	5	3
6631	24	71	4	5
6639	8	59	6	4
6647	6	70	3	152
6655	28	18	6	4
6663	5	44	9	228
6671	2	1	4	7
6679	19	12	3	15
6687	14	19	3	76
6695	6	46	4	5
6703	22	55	4	116
6711	25	28	4	6
6719	14	47	7	1
6727	28	31	3	161
6735	18	41	9	228
6743	12	17	4	32
6751	2	17	4	180
6759	3	25	3	165
6767	3	13	4	5
6775	17	3	4	6
6783	7	32	7	2
6791	5	54	4	6
6799	11	38	4	19
6807	11	6	5	3
6815	19	17	4	66
6823	22	64	7	2
6831	14	65	5	3
6839	28	73	4	5
6847	10	28	3	99
6855	7	43	4	7
6863	5	36	4	30
6871	8	55	4	6
6879	14	67	4	41
6887	8	37	3	195
6895	24	65	4	7
6903	27	21	4	7
6911	23	46	3	222
6919	24	70	4	7
6927	18	31	7	2
6935	8	1	7	2
6943	25	73	6	4
6951	15	72	6	4
6959	26	10	4	6
6967	16	74	3	135
6975	5	33	9	228
6983	6	38	4	19
6991	6	18	4	193
6999	23	40	5	3
7007	11	67	7	1
7015	10	14	4	25
7023	8	46	3	232
7031	23	71	7	1
7039	27	73	5	3
7047	25	65	3	89
7055	14	68	5	3
7063	28	3	7	2
7071	10	45	4	5
7079	9	35	7	1
7087	17	69	4	50
7095	16	29	7	1
7103	27	29	6	207
7111	9	18	4	32
7119	2	10	3	190
7127	13	52	7	1
7135	15	63	5	3
7143	8	41	4	7
7151	2	40	4	6
7159	17	12	4	7
7167	14	3	9	228
7175	10	53	7	1
7183	2	3	7	1
7191	21	55	4	10
7199	3	31	7	2
7207	7	50	6	4
7215	23	67	4	41
7223	4	49	4	6
7231	22	22	4	7
7239	10	8	6	4
7247	19	3	4	6
7255	10	63	11	90
7263	22	25	4	7
7271	23	46	12	216
7279	4	31	9	228
7287	9	13	5	3
7295	25	1	4	5
7303	9	37	4	30
7311	4	17	7	1
7319	8	27	3	149
7327	27	44	4	156
7335	14	11	7	2
7343	14	57	4	7
7351	11	22	7	1
7359	8	8	4	55
7367	16	60	4	5
7375	3	24	4	5
7383	22	13	4	6
7391	8	60	4	5
7399	17	71	4	56
7407	12	23	4	7
7415	8	56	5	3
7423	11	66	4	5
7431	21	7	4	23
7439	11	12	3	15
7447	9	71	4	56
7455	23	70	4	5
7463	19	50	3	197
7471	6	41	4	5
7479	8	12	4	141
7487	11	23	6	4
7495	26	65	5	3
7503	9	33	6	4
7511	15	57	9	228
7519	10	66	4	5
7527	13	50	6	4
7535	3	13	9	228
6290	27	19	4	7
6298	19	27	3	123
6306	22	7	9	228
6314	28	9	4	5
6322	5	22	6	4
6330	7	68	4	7
6338	16	49	10	224
6346	6	45	3	216
6354	9	1	7	2
6362	12	73	6	4
6370	28	67	4	41
6378	13	61	7	2
6386	13	40	13	78
6394	14	53	10	203
6402	24	11	4	58
6410	16	55	7	1
6418	5	14	4	25
6426	25	41	5	3
6434	9	61	4	6
6442	26	63	11	90
6450	21	40	13	78
6458	24	56	3	147
6466	26	63	4	7
6474	7	29	7	2
6482	6	65	3	89
6490	27	63	11	90
6498	9	64	4	6
6506	6	19	4	5
6514	27	58	4	7
6522	14	35	4	7
6530	24	58	7	1
6538	16	43	5	3
6546	19	67	4	5
6554	5	65	12	188
6562	22	15	5	3
6570	19	50	4	6
6578	16	74	7	2
6586	27	73	6	4
6594	16	34	9	228
6602	19	65	4	173
6610	19	44	6	4
6618	15	55	9	228
6626	27	68	6	4
6634	20	11	7	2
6642	28	7	4	6
6650	13	23	12	137
6658	19	45	4	5
6666	23	45	4	6
6674	2	71	4	56
6682	23	26	4	5
6690	28	23	5	3
6698	18	46	12	229
6706	2	66	3	86
6714	19	46	3	201
6722	13	26	6	4
6730	6	70	9	228
6738	11	22	4	6
6746	9	19	9	228
6754	12	39	4	140
6762	6	1	5	3
6770	28	8	5	3
6778	6	44	5	3
6786	19	70	6	4
6794	6	31	6	4
6802	19	12	9	228
6810	23	40	4	39
6818	23	47	4	38
6826	16	1	7	2
6834	8	21	7	1
6842	28	53	4	7
6850	3	22	3	73
6858	9	46	4	222
6866	9	46	9	228
6874	19	71	4	5
6882	13	29	6	207
6890	2	9	7	2
6898	10	51	6	4
6906	19	28	3	162
6914	5	22	7	1
6922	26	15	7	1
6930	10	36	7	2
6938	17	43	7	1
6946	15	36	4	5
6954	18	25	4	6
6962	15	27	4	6
6970	15	32	4	36
6978	5	38	4	19
6986	8	7	4	5
6994	28	42	4	6
7002	4	46	9	228
7010	15	68	4	42
7018	23	27	4	6
7026	25	38	4	19
7034	5	22	4	6
7042	19	70	4	7
7050	25	70	6	4
7058	27	52	7	1
7066	24	35	4	6
7074	16	14	6	4
7082	16	10	3	204
7090	24	12	9	228
7098	9	24	4	5
7106	27	72	4	7
7114	8	40	7	1
7122	16	5	9	228
7130	27	64	3	14
7138	26	55	7	2
7146	15	64	9	228
7154	11	69	5	3
7162	17	7	4	131
7170	21	26	9	228
7178	22	25	4	67
7186	5	71	4	5
7194	7	46	4	5
7202	12	45	4	211
7210	24	41	5	3
7218	23	55	3	144
7226	11	63	9	228
7234	3	30	3	68
7242	12	55	9	228
7250	17	68	7	1
7258	5	4	3	20
7266	25	49	7	1
7274	14	22	4	7
7282	17	10	3	219
7290	26	5	3	84
7298	16	16	4	5
7306	17	31	4	7
7314	17	33	9	228
7322	5	56	3	196
7330	15	53	3	203
7338	6	32	7	2
7346	23	52	4	95
7354	7	32	4	7
7362	12	28	7	1
7370	3	71	4	56
7378	14	13	4	6
7386	5	67	4	6
7394	14	4	4	5
7402	16	16	5	3
7410	24	46	6	4
7418	10	62	7	1
7426	12	63	3	126
7434	28	13	4	6
7442	24	35	7	1
7450	6	31	6	207
7458	26	38	5	3
7466	13	73	4	5
7474	24	17	4	32
7482	3	50	3	197
7490	2	36	7	1
7498	15	61	4	7
7506	13	10	3	220
7514	18	27	5	3
7522	2	38	4	7
7530	16	28	4	5
7538	25	69	4	50
6291	28	55	4	80
6299	5	41	7	2
6307	19	18	4	32
6315	10	45	4	230
6323	19	45	3	229
6331	17	37	3	195
6339	14	18	9	228
6347	10	56	3	147
6355	19	50	2	213
6363	20	17	4	6
6371	9	73	4	7
6379	8	20	4	5
6387	17	41	7	2
6395	22	38	4	94
6403	21	8	9	228
6411	9	14	6	4
6419	7	36	6	4
6427	9	12	7	2
6435	10	4	7	2
6443	10	37	5	3
6451	3	35	7	1
6459	23	22	4	7
6467	8	23	4	112
6475	10	35	4	6
6483	23	64	7	2
6491	3	30	7	1
6499	21	11	3	132
6507	9	65	12	188
6515	14	40	4	39
6523	5	34	4	5
6531	23	40	6	4
6539	14	12	4	7
6547	24	25	3	139
6555	4	58	7	1
6563	11	54	4	7
6571	11	27	3	123
6579	26	45	9	228
6587	2	35	9	228
6595	26	38	4	128
6603	18	46	5	3
6611	15	61	6	4
6619	16	74	5	3
6627	12	10	7	1
6635	8	37	4	7
6643	5	23	4	7
6651	25	22	4	6
6659	22	70	4	5
6667	21	3	7	2
6675	21	4	5	3
6683	11	57	7	1
6691	20	22	3	8
6699	21	25	3	183
6707	18	30	7	1
6715	18	59	5	3
6723	27	43	4	7
6731	24	37	5	3
6739	14	58	9	228
6747	25	65	4	7
6755	15	13	4	6
6763	16	5	5	3
6771	9	3	4	6
6779	5	53	4	198
6787	20	26	4	7
6795	24	8	7	2
6803	20	4	9	228
6811	24	5	3	84
6819	10	49	4	117
6827	27	43	3	232
6835	14	64	7	2
6843	21	21	4	7
6851	22	65	5	3
6859	15	29	6	4
6867	24	42	4	51
6875	21	23	9	228
6883	2	42	5	3
6891	4	16	4	5
6899	26	29	4	7
6907	27	38	4	128
6915	22	63	6	4
6923	7	40	9	228
6931	4	39	3	107
6939	27	32	7	2
6947	13	49	3	151
6955	13	43	3	232
6963	26	65	3	89
6971	3	50	4	6
6979	14	55	4	116
6987	27	69	4	5
6995	20	12	5	3
7003	16	72	4	6
7011	18	45	4	5
7019	17	59	5	3
7027	27	31	3	161
7035	25	53	4	198
7043	5	8	4	93
7051	28	11	9	228
7059	20	44	5	3
7067	16	11	4	6
7075	8	68	4	6
7083	14	72	6	4
7091	25	1	5	3
7099	6	31	9	228
7107	12	40	7	2
7115	25	67	4	6
7123	2	68	7	1
7131	2	8	4	55
7139	9	69	4	50
7147	11	30	3	68
7155	2	52	4	145
7163	6	49	4	6
7171	27	56	12	147
7179	16	42	5	3
7187	11	23	7	2
7195	20	44	9	228
7203	11	37	5	3
7211	3	70	3	152
7219	6	39	4	6
7227	12	67	7	1
7235	26	12	9	228
7243	5	63	9	228
7251	24	19	9	228
7259	28	74	7	1
7267	28	56	3	174
7275	25	47	4	6
7283	25	6	4	5
7291	11	40	4	7
7299	14	65	3	150
7307	12	5	4	5
7315	13	74	3	16
7323	19	45	3	201
7331	3	29	7	1
7339	4	40	13	78
7347	24	30	7	1
7355	15	62	4	127
7363	10	35	7	1
7371	21	40	9	228
7379	15	25	7	2
7387	19	36	4	110
7395	23	65	4	5
7403	22	19	3	76
7411	28	63	6	4
7419	7	23	9	228
7427	8	22	3	73
7435	2	69	7	2
7443	8	14	6	4
7451	13	18	4	7
7459	10	46	3	201
7467	22	18	5	3
7475	5	19	9	228
7483	26	69	9	228
7491	9	5	12	177
7499	9	16	4	5
7507	19	72	7	2
7515	19	46	4	5
7523	18	8	4	7
7531	11	44	4	7
7539	15	30	3	161
6717	8	61	7	1
6725	2	34	6	4
6733	21	58	4	7
6741	6	48	4	5
6749	5	30	3	68
6757	4	45	4	5
6765	8	5	5	3
6773	5	67	7	1
6781	2	49	4	45
6789	3	50	3	185
6797	12	23	12	137
6805	6	18	4	133
6813	14	72	9	228
6821	12	29	4	7
6829	21	32	4	7
6837	15	38	4	94
6845	28	72	6	4
6853	20	54	4	218
6861	8	5	4	199
6869	2	59	4	136
6877	15	39	7	1
6885	17	50	7	1
6893	23	61	3	9
6901	5	12	3	15
6909	15	50	6	4
6917	19	73	9	228
6925	28	56	3	122
6933	16	17	4	180
6941	13	45	3	216
6949	16	61	7	1
6957	28	64	7	2
6965	21	20	7	1
6973	11	46	5	3
6981	20	54	7	1
6989	25	65	4	173
6997	3	23	3	137
7005	27	49	3	151
7013	10	8	7	2
7021	16	43	7	1
7029	7	65	9	228
7037	16	52	4	5
7045	25	23	7	2
7053	20	40	13	78
7061	27	60	4	6
7069	12	9	4	5
7077	14	41	4	11
7085	16	15	4	5
7093	26	40	13	78
7101	11	59	4	5
7109	4	19	3	12
7117	15	29	5	3
7125	21	36	5	3
7133	19	46	5	3
7141	3	64	7	1
7149	12	56	3	196
7157	13	21	4	7
7165	14	53	7	2
7173	23	22	7	2
7181	17	25	3	165
7189	4	46	3	201
7197	14	60	7	1
7205	15	52	7	1
7213	6	51	5	3
7221	8	70	7	2
7229	24	5	6	4
7237	13	15	3	57
7245	26	33	4	5
7253	22	25	6	4
7261	26	51	9	228
7269	18	39	4	140
7277	9	65	4	7
7285	23	46	3	225
7293	28	20	4	6
7301	27	10	3	220
7309	5	65	6	4
7317	12	50	7	2
7325	8	25	3	165
7333	12	53	4	198
7341	22	60	4	6
7349	6	70	6	4
7357	14	56	3	208
7365	11	1	5	3
7373	25	69	5	3
7381	14	45	3	225
7389	17	2	12	175
7397	2	52	5	3
7405	6	1	8	124
7413	22	43	3	232
7421	13	33	4	5
7429	18	10	3	219
7437	13	8	6	4
7445	17	1	4	7
7453	21	24	4	6
7461	24	68	4	61
7469	6	28	3	162
7477	21	26	5	3
7485	10	31	6	4
7493	28	17	4	7
7501	25	53	7	1
7509	25	40	4	7
7517	24	45	12	229
7525	20	36	4	7
7533	15	18	4	5
7541	25	56	3	196
7549	10	59	9	228
7557	28	34	4	29
7565	19	53	7	1
7573	11	26	9	228
7581	3	22	7	1
7589	17	29	7	1
7597	21	74	3	16
7605	28	58	4	5
7613	18	52	4	145
7621	24	46	4	211
7629	11	4	7	2
7637	10	73	9	228
7645	5	72	4	7
7653	2	34	4	5
7661	19	51	6	4
7669	26	16	7	1
7677	17	57	7	1
7685	5	69	4	7
7693	4	73	9	228
7701	7	63	5	3
7709	17	41	9	228
7717	5	15	4	6
7725	10	21	4	6
7733	18	59	9	228
7741	13	16	7	1
7749	10	45	6	4
7757	12	52	4	6
7765	17	16	4	6
7773	24	56	3	208
7781	27	24	4	7
7789	27	70	6	4
7797	17	46	4	230
7805	26	16	3	57
7813	3	53	4	198
7821	18	69	5	3
7829	20	26	4	31
7837	26	36	5	3
7845	6	3	7	2
7853	5	4	4	83
7861	4	26	4	31
7869	2	51	2	212
7877	11	17	9	228
7885	18	67	6	4
7893	4	51	4	6
7901	10	60	7	2
7909	18	21	5	3
7917	16	39	4	6
7925	16	37	3	205
7933	26	49	9	228
7941	4	30	5	3
7949	19	41	4	6
7957	4	7	4	23
7965	6	50	4	7
7081	8	50	3	202
7089	12	7	4	23
7097	23	11	3	158
7105	19	65	4	7
7113	7	50	7	2
7121	16	27	6	4
7129	3	46	4	222
7137	16	46	3	229
7145	17	48	6	4
7153	9	73	7	2
7161	7	8	6	4
7169	14	50	7	2
7177	24	10	3	219
7185	18	17	4	66
7193	23	30	7	2
7201	4	23	7	2
7209	17	70	9	228
7217	10	11	12	96
7225	23	36	6	4
7233	20	32	4	7
7241	13	64	4	7
7249	3	33	6	4
7257	6	42	4	6
7265	17	65	7	2
7273	14	62	4	7
7281	16	60	5	3
7289	13	55	6	4
7297	3	14	4	25
7305	5	26	9	228
7313	7	70	4	5
7321	8	46	4	222
7329	20	35	7	1
7337	4	50	3	197
7345	17	17	4	160
7353	27	18	9	228
7361	17	42	4	5
7369	3	51	7	2
7377	22	45	3	225
7385	23	13	4	115
7393	2	48	9	228
7401	26	11	7	2
7409	12	18	4	133
7417	6	36	9	228
7425	2	15	4	25
7433	27	72	7	2
7441	4	56	12	215
7449	27	20	4	6
7457	14	62	4	127
7465	9	13	9	228
7473	4	27	9	228
7481	12	39	4	6
7489	6	25	4	104
7497	8	5	3	40
7505	7	10	3	220
7513	23	57	9	228
7521	25	61	4	52
7529	23	18	4	5
7537	18	18	4	193
7545	27	64	4	7
7553	18	19	9	228
7561	21	55	9	228
7569	27	56	4	46
7577	14	46	3	222
7585	13	12	3	15
7593	18	33	9	228
7601	10	52	4	5
7609	11	69	6	4
7617	22	25	4	33
7625	21	56	4	46
7633	22	34	4	6
7641	20	74	3	16
7649	22	54	4	7
7657	19	63	11	90
7665	19	4	7	2
7673	17	29	4	6
7681	14	32	4	36
7689	20	18	9	228
7697	25	10	4	6
7705	16	1	9	228
7713	28	25	9	228
7721	23	40	12	92
7729	20	73	4	5
7737	21	56	7	1
7745	15	49	4	7
7753	21	21	9	228
7761	12	26	4	31
7769	27	25	4	5
7777	27	10	4	7
7785	27	70	3	152
7793	28	34	7	2
7801	20	35	3	166
7809	2	61	4	52
7817	20	46	5	3
7825	20	23	4	164
7833	16	23	4	6
7841	17	19	4	5
7849	2	35	4	6
7857	25	60	4	7
7865	22	2	6	4
7873	17	74	4	6
7881	15	21	4	6
7889	23	17	4	160
7897	18	68	4	5
7905	20	3	4	157
7913	11	63	3	90
7921	7	7	5	3
7929	18	56	12	122
7937	13	7	9	228
7945	21	47	9	228
7953	5	56	12	208
7961	5	3	4	6
7969	13	28	7	1
7977	15	62	9	228
7985	15	17	6	4
7993	22	24	4	181
8001	28	1	3	13
8009	10	26	7	2
8017	17	59	4	7
8025	4	23	4	7
8033	28	44	5	3
8041	7	36	7	2
8049	18	11	7	1
8057	8	39	3	107
8065	13	56	4	172
8073	9	22	7	1
8081	7	28	3	162
8089	2	45	3	232
8097	3	4	4	121
8105	11	22	3	8
8113	24	31	6	207
8121	23	11	6	4
8129	28	9	7	1
8137	6	73	4	5
8145	2	35	4	134
8153	24	26	7	2
8161	9	11	4	6
8169	24	6	4	5
8177	2	56	2	223
8185	3	28	4	5
8193	21	37	4	5
8201	6	25	3	183
8209	9	65	7	2
8217	11	54	4	218
8225	10	5	5	3
8233	23	60	11	169
8241	11	43	7	1
8249	8	56	4	5
8257	27	3	5	3
8265	26	66	7	1
8273	8	33	5	3
8281	19	43	6	4
8289	21	26	4	31
8297	23	18	4	160
8305	18	74	3	16
8313	23	41	4	6
8321	24	24	4	6
8329	9	45	3	216
7546	28	69	4	5
7554	12	44	7	2
7562	6	50	7	2
7570	27	74	3	16
7578	3	62	4	6
7586	6	7	4	6
7594	2	2	4	5
7602	13	72	3	72
7610	6	56	3	122
7618	10	61	4	6
7626	28	10	3	220
7634	6	30	4	7
7642	28	24	3	137
7650	15	68	6	4
7658	20	56	3	122
7666	13	56	3	82
7674	18	21	4	6
7682	19	52	4	5
7690	21	25	4	67
7698	9	56	12	215
7706	7	18	6	4
7714	3	1	9	228
7722	17	45	6	4
7730	19	45	5	3
7738	22	15	3	57
7746	26	2	7	1
7754	18	46	7	2
7762	13	17	5	3
7770	23	4	4	83
7778	4	48	7	1
7786	27	28	3	17
7794	4	56	7	1
7802	28	74	4	7
7810	25	17	7	2
7818	22	3	5	3
7826	15	67	9	228
7834	10	38	4	167
7842	16	63	11	126
7850	3	67	7	1
7858	10	28	4	7
7866	12	49	9	228
7874	4	17	4	133
7882	26	35	4	5
7890	6	33	3	105
7898	9	21	4	142
7906	26	27	3	123
7914	11	17	6	4
7922	14	45	9	228
7930	2	31	4	5
7938	28	40	7	1
7946	2	27	4	6
7954	10	64	5	3
7962	3	46	3	201
7970	19	69	7	2
7978	20	31	3	161
7986	21	10	3	220
7994	14	22	7	2
8002	18	1	8	124
8010	24	27	5	3
8018	28	20	7	1
8026	14	36	9	228
8034	27	44	6	4
8042	6	62	3	97
8050	8	46	3	201
8058	10	17	7	1
8066	2	46	4	222
8074	20	39	7	1
8082	12	27	4	5
8090	21	25	7	2
8098	27	36	4	30
8106	23	64	6	4
8114	12	70	4	5
8122	3	27	3	149
8130	27	12	3	15
8138	19	65	5	3
8146	12	39	7	1
8154	17	41	6	4
8162	7	39	4	6
8170	5	18	7	2
8178	18	63	4	7
8186	3	8	4	7
8194	16	46	9	228
8202	21	53	4	198
8210	9	59	7	2
8218	5	35	7	1
8226	25	51	9	228
8234	8	38	9	228
8242	7	45	4	5
8250	18	70	9	228
8258	17	31	6	206
8266	18	42	7	1
8274	28	21	4	168
8282	15	54	7	1
8290	15	56	12	174
8298	25	34	7	1
8306	13	23	4	164
8314	11	21	4	7
8322	9	68	4	7
8330	20	21	4	142
8338	4	14	4	7
8346	14	35	5	3
8354	24	26	5	3
8362	5	6	3	63
8370	15	10	3	190
8378	12	52	7	2
8386	10	46	4	6
8394	16	63	5	3
8402	14	52	3	95
8410	13	39	7	2
8418	5	73	7	1
8426	20	73	4	6
8434	3	43	6	4
8442	13	16	7	2
8450	16	72	9	228
8458	9	29	3	161
8466	13	48	4	7
8474	23	71	6	4
8482	15	34	9	228
8490	23	68	7	1
8498	7	56	12	214
8506	27	49	4	85
8514	16	71	4	6
8522	8	71	4	6
8530	17	5	4	6
8538	11	47	7	2
8546	9	22	9	228
8554	5	42	12	108
8562	16	67	4	7
8570	26	23	6	4
8578	14	71	7	1
8586	19	70	5	3
8594	26	39	3	22
8602	4	37	3	195
8610	4	19	9	228
8618	8	5	4	7
8626	19	15	7	1
8634	4	8	4	93
8642	2	7	2	186
8650	2	5	12	177
8658	2	33	4	7
8666	27	55	6	4
8674	20	72	7	2
8682	4	20	4	5
8690	12	25	3	183
8698	12	36	4	7
8706	11	47	7	1
8714	17	65	4	173
8722	5	63	11	90
8730	9	73	6	4
8738	17	37	4	5
8746	9	27	3	53
8754	23	46	4	5
8762	5	3	6	4
8770	27	40	12	92
8778	10	11	3	132
8786	27	61	5	3
8794	16	63	3	90
7542	24	11	12	96
7550	24	7	4	23
7558	23	11	4	7
7566	20	41	4	11
7574	20	25	4	67
7582	6	55	6	4
7590	27	65	4	5
7598	22	36	4	30
7606	14	60	4	6
7614	28	32	4	36
7622	25	63	11	90
7630	19	69	4	7
7638	27	55	5	3
7646	13	71	4	26
7654	9	9	4	5
7662	16	56	3	147
7670	15	12	3	87
7678	21	26	4	5
7686	15	30	5	3
7694	6	38	4	94
7702	8	59	7	2
7710	19	44	7	2
7718	15	52	4	6
7726	17	26	4	7
7734	28	72	3	118
7742	16	43	12	101
7750	21	28	4	6
7758	9	4	9	228
7766	20	67	4	41
7774	23	11	4	5
7782	2	2	7	1
7790	9	71	6	4
7798	13	58	4	114
7806	21	32	4	5
7814	15	65	4	6
7822	8	8	6	4
7830	13	24	4	7
7838	8	47	5	3
7846	2	31	6	206
7854	28	28	4	5
7862	6	22	4	5
7870	13	33	3	71
7878	20	49	9	228
7886	20	9	6	129
7894	3	18	4	5
7902	2	58	5	3
7910	10	21	5	3
7918	14	19	4	7
7926	6	18	4	160
7934	9	44	3	130
7942	21	39	7	2
7950	3	48	7	1
7958	20	53	4	6
7966	18	58	7	2
7974	12	49	3	151
7982	9	8	7	2
7990	24	43	4	6
7998	5	7	4	23
8006	6	62	4	127
8014	24	38	5	3
8022	28	55	5	3
8030	15	1	8	148
8038	11	8	6	4
8046	27	40	4	39
8054	25	51	6	4
8062	20	10	4	6
8070	15	6	7	1
8078	6	53	7	1
8086	22	36	9	228
8094	5	21	4	6
8102	12	23	5	3
8110	16	35	4	134
8118	4	51	7	2
8126	8	2	12	175
8134	23	29	4	7
8142	25	52	4	5
8150	25	43	7	1
8158	3	5	9	228
8166	6	47	4	6
8174	24	54	7	1
8182	20	56	12	147
8190	13	67	7	1
8198	19	17	4	32
8206	18	23	7	2
8214	26	7	7	1
8222	25	23	12	137
8230	9	68	7	1
8238	2	1	6	4
8246	9	56	3	147
8254	10	47	5	3
8262	9	8	4	93
8270	23	13	7	2
8278	22	62	7	1
8286	6	38	4	7
8294	8	36	4	7
8302	10	2	7	1
8310	10	70	4	98
8318	18	73	4	5
8326	26	50	5	3
8334	13	22	7	1
8342	20	19	4	6
8350	17	10	7	1
8358	26	72	6	4
8366	2	74	7	1
8374	19	60	7	2
8382	13	28	3	161
8390	27	65	3	125
8398	8	30	7	2
8406	19	56	12	208
8414	21	49	2	217
8422	10	61	5	3
8430	21	45	4	7
8438	26	25	4	5
8446	4	43	5	3
8454	22	19	4	7
8462	2	11	5	3
8470	20	70	4	6
8478	2	56	3	208
8486	16	74	4	6
8494	16	72	3	72
8502	12	15	9	228
8510	16	32	6	4
8518	2	27	7	1
8526	3	19	7	1
8534	16	29	9	228
8542	19	47	7	2
8550	13	45	3	226
8558	26	36	7	1
8566	6	16	7	2
8574	25	65	9	228
8582	28	22	7	2
8590	9	1	8	124
8598	27	39	4	6
8606	17	50	2	213
8614	5	5	5	3
8622	18	54	4	6
8630	17	5	9	228
8638	22	25	9	228
8646	25	70	5	3
8654	25	50	4	7
8662	22	66	4	6
8670	11	51	9	228
8678	23	62	9	228
8686	12	19	3	12
8694	4	8	9	228
8702	15	4	4	5
8710	18	27	12	163
8718	27	67	7	1
8726	6	44	4	7
8734	11	65	5	3
8742	5	24	4	6
8750	16	72	3	37
8758	27	1	7	1
8766	20	56	12	196
8774	5	2	4	6
8782	21	6	6	4
8790	20	28	12	194
7543	11	63	6	4
7551	12	64	4	7
7559	2	33	7	2
7567	22	1	3	13
7575	9	52	3	95
7583	28	14	7	1
7591	4	69	4	50
7599	10	37	4	30
7607	22	1	8	148
7615	22	9	7	1
7623	4	72	3	37
7631	14	60	11	169
7639	5	70	5	3
7647	19	31	9	228
7655	3	26	4	7
7663	11	8	5	3
7671	9	50	2	213
7679	23	25	5	3
7687	14	36	6	4
7695	14	40	4	5
7703	10	46	4	5
7711	5	65	3	89
7719	11	51	6	4
7727	14	27	3	53
7735	12	23	9	228
7743	14	46	3	225
7751	21	39	3	22
7759	26	22	4	6
7767	5	36	6	4
7775	20	43	4	7
7783	12	35	3	166
7791	16	33	4	5
7799	27	2	4	7
7807	9	33	4	5
7815	23	65	4	6
7823	6	46	12	229
7831	21	48	4	81
7839	22	11	5	3
7847	20	11	6	4
7855	4	40	12	92
7863	17	13	4	115
7871	15	74	9	228
7879	8	32	3	75
7887	4	1	7	1
7895	23	7	4	65
7903	18	20	7	2
7911	13	5	7	2
7919	6	70	7	1
7927	5	70	4	43
7935	27	8	4	6
7943	2	55	4	116
7951	7	56	3	146
7959	11	69	4	50
7967	17	11	7	1
7975	10	65	6	4
7983	7	62	4	127
7991	26	25	4	104
7999	14	24	4	181
8007	15	17	9	228
8015	16	14	5	3
8023	7	74	3	16
8031	26	63	6	4
8039	14	72	3	118
8047	11	46	4	5
8055	24	56	3	196
8063	8	38	6	4
8071	17	22	7	1
8079	6	38	4	128
8087	8	55	12	159
8095	11	21	4	6
8103	23	25	9	228
8111	16	2	12	175
8119	22	74	4	6
8127	25	69	4	7
8135	4	18	4	7
8143	7	56	7	1
8151	15	45	3	222
8159	24	59	6	4
8167	16	27	3	149
8175	3	19	4	7
8183	28	12	3	15
8191	10	9	4	5
8199	25	49	3	151
8207	8	33	4	7
8215	17	70	4	7
8223	28	14	4	6
8231	20	12	6	4
8239	21	18	9	228
8247	15	36	6	4
8255	19	51	2	212
8263	11	39	9	228
8271	16	33	5	3
8279	10	23	7	1
8287	12	59	4	6
8295	20	14	5	3
8303	24	12	3	87
8311	23	58	4	114
8319	24	43	4	7
8327	18	26	5	3
8335	23	38	5	3
8343	19	4	4	5
8351	17	65	9	228
8359	18	5	3	119
8367	16	61	6	4
8375	22	26	2	187
8383	18	54	7	2
8391	21	57	3	18
8399	9	22	7	2
8407	14	19	7	2
8415	11	48	4	81
8423	16	61	3	9
8431	15	1	7	2
8439	8	68	5	3
8447	8	17	4	193
8455	11	28	9	228
8463	28	11	7	1
8471	2	39	7	1
8479	12	67	4	62
8487	4	6	7	1
8495	13	49	2	217
8503	25	73	7	1
8511	16	53	10	203
8519	13	12	4	141
8527	8	13	4	6
8535	6	56	3	146
8543	27	71	7	2
8551	18	19	4	6
8559	3	43	5	3
8567	5	24	7	2
8575	13	56	12	196
8583	22	64	9	228
8591	6	47	7	1
8599	3	56	12	215
8607	2	74	4	5
8615	21	36	7	2
8623	8	39	4	5
8631	27	53	4	198
8639	23	5	12	84
8647	24	27	12	163
8655	24	58	4	7
8663	23	25	6	4
8671	7	39	3	22
8679	14	68	4	7
8687	24	69	4	7
8695	19	44	4	7
8703	23	30	3	161
8711	17	39	3	107
8719	16	42	4	5
8727	21	16	4	6
8735	22	68	4	7
8743	21	48	4	6
8751	27	46	5	3
8759	7	64	5	3
8767	14	17	9	228
8775	7	6	9	228
8783	21	25	6	4
8791	8	63	3	90
7548	7	41	4	11
7556	28	68	7	2
7564	8	45	3	232
7572	19	11	12	96
7580	14	63	4	5
7588	18	50	2	213
7596	25	4	4	7
7604	17	54	4	209
7612	20	64	4	7
7620	12	38	4	94
7628	14	25	4	33
7636	2	9	9	228
7644	15	40	12	92
7652	10	33	9	228
7660	22	50	9	228
7668	15	51	4	5
7676	8	6	9	228
7684	12	55	4	10
7692	15	69	4	5
7700	17	14	4	5
7708	13	36	4	30
7716	25	40	7	2
7724	5	32	4	7
7732	24	63	3	126
7740	26	4	4	7
7748	14	71	4	6
7756	5	9	12	70
7764	4	71	9	228
7772	24	4	5	3
7780	17	4	4	7
7788	10	57	7	2
7796	17	63	7	1
7804	4	26	4	5
7812	23	31	3	161
7820	27	52	3	154
7828	11	72	5	3
7836	5	8	4	28
7844	3	18	9	228
7852	11	1	4	6
7860	4	28	9	228
7868	23	30	3	162
7876	4	55	4	5
7884	3	21	4	142
7892	7	65	7	1
7900	2	61	6	4
7908	17	44	3	130
7916	19	31	3	162
7924	21	2	9	228
7932	23	56	9	228
7940	26	22	4	5
7948	5	1	4	6
7956	8	21	6	4
7964	28	62	4	7
7972	9	9	5	3
7980	9	46	3	201
7988	6	51	6	4
7996	24	31	9	228
8004	27	74	4	6
8012	23	53	3	203
8020	7	46	3	216
8028	8	13	9	228
8036	24	40	4	7
8044	9	46	12	229
8052	3	19	7	2
8060	19	63	6	4
8068	14	24	3	137
8076	5	41	4	5
8084	13	34	7	1
8092	24	52	4	145
8100	24	33	6	4
8108	6	22	3	137
8116	21	18	6	4
8124	3	59	7	2
8132	9	19	4	7
8140	20	44	4	7
8148	19	64	3	14
8156	8	65	12	188
8164	9	33	9	228
8172	7	71	7	1
8180	8	60	5	3
8188	23	27	3	53
8196	2	40	4	78
8204	23	69	4	5
8212	22	26	4	5
8220	7	32	9	228
8228	7	37	4	5
8236	11	63	11	90
8244	11	50	4	7
8252	2	23	4	164
8260	8	33	9	228
8268	11	34	7	1
8276	5	18	9	228
8284	5	56	7	1
8292	7	49	4	7
8300	11	56	3	82
8308	17	64	3	14
8316	26	74	4	6
8324	26	72	9	228
8332	20	28	7	2
8340	5	40	4	39
8348	23	57	5	3
8356	10	74	3	16
8364	24	26	6	4
8372	19	57	4	79
8380	11	10	7	2
8388	18	46	4	6
8396	21	7	6	4
8404	20	54	3	221
8412	16	29	3	161
8420	12	13	4	7
8428	8	50	6	4
8436	26	5	12	171
8444	27	26	7	1
8452	4	46	4	6
8460	9	64	9	228
8468	28	45	4	7
8476	21	35	4	134
8484	21	52	9	228
8492	12	45	4	230
8500	4	58	4	5
8508	23	66	6	4
8516	24	5	3	177
8524	14	71	9	228
8532	22	13	9	228
8540	16	56	4	172
8548	25	20	7	2
8556	20	47	4	7
8564	22	5	12	177
8572	10	33	6	4
8580	24	73	6	4
8588	19	47	7	1
8596	6	56	12	147
8604	17	19	4	7
8612	18	63	3	126
8620	20	7	7	1
8628	21	34	4	6
8636	27	22	4	7
8644	24	65	9	228
8652	22	23	4	5
8660	18	8	9	228
8668	21	19	4	5
8676	18	45	4	222
8684	16	23	4	164
8692	4	37	6	4
8700	28	17	4	193
8708	10	15	4	6
8716	28	4	5	3
8724	19	11	4	58
8732	25	22	3	137
8740	11	45	4	6
8748	15	14	4	25
8756	9	65	5	3
8764	2	33	5	3
8772	11	21	6	4
8780	20	74	7	1
8788	24	42	4	6
8796	14	1	7	1
7973	13	44	4	156
7981	22	17	7	2
7989	25	72	4	7
7997	9	29	3	162
8005	3	25	7	1
8013	23	66	7	1
8021	6	68	4	61
8029	20	27	4	5
8037	6	8	5	3
8045	12	24	4	6
8053	10	37	9	228
8061	9	74	4	5
8069	5	31	5	3
8077	24	45	5	3
8085	24	1	8	124
8093	17	57	4	6
8101	18	49	7	1
8109	13	74	7	1
8117	20	26	6	4
8125	26	2	4	6
8133	13	24	4	112
8141	10	33	5	3
8149	3	48	4	5
8157	15	57	7	2
8165	7	19	4	5
8173	17	65	4	7
8181	12	55	4	116
8189	20	59	5	3
8197	6	63	9	228
8205	12	22	3	137
8213	3	34	4	5
8221	23	54	4	7
8229	19	61	4	6
8237	9	27	9	228
8245	18	37	6	4
8253	17	28	4	5
8261	24	46	4	230
8269	28	1	4	6
8277	18	23	7	1
8285	20	34	4	29
8293	27	60	7	2
8301	9	10	7	1
8309	22	4	4	83
8317	14	41	7	1
8325	7	40	12	92
8333	6	17	4	7
8341	11	3	6	4
8349	21	17	4	133
8357	12	28	3	17
8365	10	20	7	2
8373	25	20	4	113
8381	20	52	7	2
8389	6	10	9	228
8397	5	60	3	169
8405	28	71	7	2
8413	21	51	10	54
8421	28	66	7	2
8429	25	63	3	90
8437	13	49	4	85
8445	28	42	5	3
8453	28	46	3	229
8461	13	39	6	4
8469	20	46	3	200
8477	15	45	9	228
8485	12	56	3	146
8493	16	62	4	7
8501	24	1	7	1
8509	9	72	3	118
8517	20	48	4	81
8525	21	12	4	141
8533	23	27	9	228
8541	24	54	4	7
8549	17	22	9	228
8557	28	71	9	228
8565	18	57	4	7
8573	9	39	3	107
8581	3	31	4	7
8589	18	57	4	6
8597	5	51	6	4
8605	6	42	7	1
8613	17	41	5	3
8621	12	7	7	1
8629	20	42	4	6
8637	14	74	7	1
8645	19	40	13	78
8653	10	8	4	93
8661	17	27	12	163
8669	5	1	4	5
8677	8	56	2	223
8685	15	1	4	6
8693	23	45	3	222
8701	24	43	7	1
8709	14	23	4	5
8717	27	15	3	57
8725	15	43	3	232
8733	5	49	3	151
8741	27	23	3	137
8749	12	50	5	3
8757	16	54	3	221
8765	7	72	3	118
8773	25	32	9	228
8781	12	11	3	158
8789	18	21	4	7
8797	16	9	4	5
8805	18	25	3	183
8813	17	54	3	221
8821	27	24	3	137
8829	10	10	7	1
8837	19	38	4	167
8845	12	11	5	3
8853	21	59	4	6
8861	19	72	6	4
8869	12	14	5	3
8877	19	16	4	6
8885	7	9	12	70
8893	18	29	4	7
8901	11	33	4	5
8909	21	35	5	3
8917	12	30	4	6
8925	20	19	7	1
8933	23	14	4	5
8941	25	56	4	172
8949	25	33	4	5
8957	11	71	9	228
8965	24	63	4	6
8973	11	5	7	1
8981	15	2	5	3
8989	5	12	7	1
8997	10	49	7	2
9005	25	35	4	5
9013	19	67	4	62
9021	10	46	3	231
9029	15	46	4	7
9037	3	68	4	42
9045	15	9	4	7
9053	19	42	7	2
9061	22	6	3	63
9069	24	3	4	5
9077	28	29	3	162
9085	22	39	6	4
9093	16	43	9	228
9101	23	71	9	228
9109	28	10	4	5
9117	22	33	4	35
9125	6	20	6	4
9133	14	14	4	7
9141	17	17	4	193
9149	14	5	9	228
9157	4	56	12	208
9165	19	45	4	227
9173	5	70	4	60
9181	3	36	6	4
9189	18	56	12	147
9197	20	68	5	3
9205	24	11	3	132
9213	20	6	7	2
9221	3	11	7	2
7547	17	73	9	228
7555	12	62	3	97
7563	24	23	4	7
7571	17	27	6	4
7579	4	45	9	228
7587	28	63	4	5
7595	7	74	4	6
7603	4	8	7	2
7611	21	55	4	116
7619	11	65	9	228
7627	5	69	9	228
7635	3	41	9	228
7643	15	70	4	60
7651	3	50	2	213
7659	8	17	4	103
7667	9	54	4	209
7675	23	1	7	1
7683	11	52	4	5
7691	18	37	3	195
7699	25	8	9	228
7707	12	18	9	228
7715	20	19	5	3
7723	7	58	9	228
7731	16	6	9	228
7739	14	72	3	72
7747	8	43	12	101
7755	12	23	4	164
7763	8	44	4	7
7771	18	60	7	1
7779	8	25	3	183
7787	27	48	4	81
7795	26	38	9	228
7803	12	46	12	229
7811	7	21	9	228
7819	17	7	5	3
7827	14	56	7	2
7835	6	43	4	7
7843	15	11	4	5
7851	22	45	4	7
7859	11	60	9	228
7867	8	23	3	164
7875	22	42	9	228
7883	9	50	6	4
7891	13	14	4	7
7899	8	34	7	1
7907	16	24	4	112
7915	15	24	4	5
7923	2	8	4	28
7931	2	63	5	3
7939	22	66	3	86
7947	12	31	3	162
7955	10	28	9	228
7963	26	55	9	228
7971	6	40	6	4
7979	28	57	4	7
7987	7	51	5	3
7995	3	52	3	95
8003	3	35	4	77
8011	9	38	6	4
8019	22	56	3	174
8027	4	46	4	211
8035	3	10	3	219
8043	9	37	4	7
8051	11	10	7	1
8059	20	47	7	1
8067	21	55	5	3
8075	12	55	6	4
8083	11	65	6	4
8091	13	32	6	4
8099	19	8	9	228
8107	26	11	4	58
8115	17	1	8	124
8123	17	38	5	3
8131	24	45	3	201
8139	9	17	7	1
8147	5	51	9	228
8155	11	15	4	6
8163	9	70	7	2
8171	7	62	7	2
8179	15	29	7	2
8187	28	65	3	150
8195	22	9	12	70
8203	9	70	3	152
8211	6	18	6	4
8219	27	30	9	228
8227	22	63	4	48
8235	8	10	3	153
8243	24	9	4	5
8251	24	40	7	2
8259	27	64	6	4
8267	25	74	7	1
8275	17	31	7	1
8283	11	7	4	5
8291	26	32	6	4
8299	11	4	4	5
8307	19	52	4	95
8315	27	6	9	228
8323	27	17	4	193
8331	23	15	7	1
8339	9	62	4	5
8347	18	45	3	222
8355	25	39	6	4
8363	4	29	9	228
8371	2	65	4	5
8379	9	45	7	1
8387	9	71	4	6
8395	3	46	3	222
8403	5	41	4	6
8411	28	27	6	4
8419	27	18	4	103
8427	4	25	6	4
8435	3	9	12	70
8443	4	19	7	1
8451	28	40	4	6
8459	3	45	7	1
8467	25	7	4	7
8475	25	17	9	228
8483	16	32	3	75
8491	23	74	6	4
8499	25	10	4	7
8507	21	49	4	85
8515	8	22	7	2
8523	4	17	6	4
8531	23	50	3	202
8539	13	7	3	155
8547	13	39	9	228
8555	16	44	3	130
8563	22	11	7	1
8571	15	3	4	7
8579	16	16	4	25
8587	3	46	5	3
8595	23	9	4	6
8603	5	52	4	5
8611	25	13	4	5
8619	20	4	4	7
8627	26	32	9	228
8635	13	23	5	3
8643	15	6	4	6
8651	12	53	4	6
8659	14	30	9	228
8667	19	73	5	3
8675	11	37	6	4
8683	28	23	3	164
8691	5	19	3	12
8699	10	27	12	163
8707	17	62	7	1
8715	13	25	4	7
8723	28	60	7	1
8731	12	4	7	2
8739	4	18	4	133
8747	23	14	4	25
8755	15	5	12	171
8763	20	67	7	2
8771	16	56	3	196
8779	6	45	3	231
8787	18	53	3	203
8795	7	53	9	228
7544	11	37	9	228
7552	19	5	5	3
7560	24	8	6	4
7568	15	36	5	3
7576	3	29	3	162
7584	24	18	4	133
7592	23	68	6	4
7600	26	46	3	216
7608	7	44	6	4
7616	8	45	3	229
7624	3	27	6	4
7632	15	65	3	150
7640	25	7	7	1
7648	24	64	3	14
7656	24	51	4	7
7664	28	11	4	7
7672	13	55	4	116
7680	24	73	5	3
7688	20	63	9	228
7696	3	11	4	6
7704	16	59	7	2
7712	21	71	4	26
7720	9	35	4	77
7728	14	37	4	5
7736	11	5	5	3
7744	10	3	4	6
7752	21	56	3	122
7760	16	69	4	50
7768	12	56	3	174
7776	2	71	7	2
7784	16	72	7	2
7792	4	7	4	5
7800	10	55	7	1
7808	4	46	3	232
7816	10	56	3	208
7824	10	6	3	63
7832	26	21	4	7
7840	10	48	7	1
7848	18	38	4	64
7856	25	3	4	5
7864	5	38	7	1
7872	27	70	4	6
7880	21	7	9	228
7888	8	62	4	7
7896	26	52	4	7
7904	2	26	4	5
7912	13	10	9	228
7920	14	42	6	4
7928	12	9	6	129
7936	7	17	4	5
7944	20	13	4	7
7952	11	57	6	4
7960	6	28	3	99
7968	2	67	4	5
7976	14	66	4	6
7984	13	62	4	127
7992	13	30	7	2
8000	5	53	7	1
8008	24	70	6	4
8016	10	38	5	3
8024	12	26	5	3
8032	4	21	7	1
8040	8	16	4	5
8048	26	68	4	61
8056	18	37	9	228
8064	11	38	4	5
8072	9	50	3	197
8080	23	22	9	228
8088	16	41	6	4
8096	19	12	4	7
8104	24	59	4	136
8112	4	19	6	4
8120	16	74	4	5
8128	17	37	7	2
8136	12	4	4	7
8144	24	60	4	5
8152	23	12	4	5
8160	2	2	12	175
8168	20	58	9	228
8176	12	12	6	4
8184	15	60	11	169
8192	22	32	3	75
8200	11	22	3	137
8208	7	28	4	6
8216	10	18	4	193
8224	7	30	4	7
8232	12	51	5	3
8240	17	59	7	2
8248	4	45	4	222
8256	19	46	3	226
8264	5	11	3	132
8272	14	62	7	1
8280	7	30	7	1
8288	27	26	4	31
8296	21	65	3	150
8304	26	56	4	6
8312	4	29	4	7
8320	20	72	6	4
8328	27	6	6	4
8336	19	3	6	4
8344	26	16	4	6
8352	27	9	4	6
8360	10	56	12	147
8368	19	35	5	3
8376	14	15	4	25
8384	14	71	7	2
8392	21	28	3	161
8400	28	37	4	7
8408	27	24	6	4
8416	22	56	9	228
8424	27	10	3	178
8432	17	17	7	2
8440	6	17	5	3
8448	2	52	4	95
8456	7	57	3	18
8464	28	5	12	177
8472	17	47	4	38
8480	23	71	4	56
8488	19	48	4	81
8496	23	8	4	55
8504	2	10	3	220
8512	21	56	4	7
8520	3	68	4	5
8528	25	4	7	1
8536	5	9	6	129
8544	2	30	9	228
8552	21	5	3	40
8560	15	7	4	131
8568	6	42	7	2
8576	22	71	7	1
8584	21	2	4	6
8592	27	56	12	196
8600	5	4	7	2
8608	6	33	4	5
8616	3	37	7	2
8624	28	62	7	2
8632	8	6	6	4
8640	18	26	7	2
8648	9	46	5	3
8656	12	24	4	112
8664	27	34	4	29
8672	3	65	4	173
8680	21	62	4	127
8688	19	49	3	151
8696	16	73	7	2
8704	20	38	4	5
8712	11	70	5	3
8720	21	18	5	3
8728	6	44	4	156
8736	3	29	6	207
8744	28	20	4	7
8752	19	58	9	228
8760	4	54	4	5
8768	16	17	4	6
8776	6	74	4	6
8784	20	11	3	158
8792	17	73	5	3
8337	12	32	5	3
8345	20	30	7	1
8353	19	56	3	82
8361	28	17	9	228
8369	8	24	4	112
8377	15	19	9	228
8385	22	50	3	202
8393	15	6	7	2
8401	15	5	6	4
8409	13	34	7	2
8417	15	74	6	4
8425	21	65	4	6
8433	8	32	6	4
8441	5	25	5	3
8449	19	15	9	228
8457	16	34	7	1
8465	9	21	6	4
8473	20	67	4	62
8481	24	20	4	7
8489	28	49	10	224
8497	25	30	4	5
8505	5	32	4	5
8513	3	3	12	189
8521	22	66	4	47
8529	16	13	4	6
8537	20	70	4	43
8545	14	13	9	228
8553	6	47	9	228
8561	10	50	5	3
8569	15	72	3	118
8577	24	54	4	6
8585	13	55	5	3
8593	12	69	6	4
8601	20	23	6	4
8609	9	14	4	25
8617	3	1	5	3
8625	22	22	7	2
8633	28	63	4	48
8641	16	41	9	228
8649	15	64	5	3
8657	25	28	3	99
8665	27	50	6	4
8673	10	51	7	2
8681	13	72	6	4
8689	14	48	7	1
8697	22	10	3	220
8705	5	55	4	7
8713	17	8	4	7
8721	20	47	4	6
8729	2	56	4	5
8737	4	26	5	3
8745	16	33	9	228
8753	11	39	5	3
8761	6	72	5	3
8769	27	7	2	186
8777	5	12	3	87
8785	17	8	6	4
8793	15	17	5	3
8801	3	54	3	221
8809	25	27	4	6
8817	25	5	4	6
8825	13	53	9	228
8833	25	11	9	228
8841	3	12	3	15
8849	5	53	7	2
8857	19	18	5	3
8865	9	60	11	169
8873	8	57	7	1
8881	17	39	4	7
8889	4	7	6	4
8897	24	10	7	1
8905	26	8	4	28
8913	6	56	4	172
8921	24	64	7	2
8929	23	42	7	2
8937	20	40	5	3
8945	17	60	7	1
8953	4	50	7	2
8961	15	44	4	192
8969	2	54	6	4
8977	4	9	12	70
8985	10	18	4	5
8993	12	48	4	81
9001	14	23	4	112
9009	11	67	4	62
9017	9	47	4	38
9025	14	51	10	54
9033	10	28	7	2
9041	14	34	6	4
9049	11	2	7	2
9057	21	42	9	228
9065	25	49	9	228
9073	21	31	4	6
9081	10	54	7	2
9089	4	18	4	5
9097	15	4	4	121
9105	10	42	12	108
9113	5	72	4	5
9121	19	52	4	7
9129	18	60	4	7
9137	4	11	3	24
9145	15	23	4	112
9153	19	70	4	43
9161	27	46	3	226
9169	13	27	4	7
9177	4	59	7	1
9185	6	74	7	1
9193	23	45	4	227
9201	5	21	4	7
9209	19	40	9	228
9217	14	20	4	7
9225	25	25	4	67
9233	12	71	5	3
9241	12	5	3	171
9249	10	31	4	6
9257	18	26	6	4
9265	12	44	3	130
9273	27	49	4	7
9281	18	43	4	7
9289	20	7	4	131
9297	11	47	5	3
9305	6	66	7	1
9313	28	58	4	114
9321	11	61	7	2
9329	6	45	12	216
9337	3	46	4	227
9345	22	20	4	7
9353	13	49	4	7
9361	2	40	7	2
9369	27	22	7	1
9377	15	33	4	6
9385	21	37	3	205
9393	19	5	7	1
9401	13	52	10	154
9409	7	17	4	193
9417	13	43	3	101
9425	7	67	7	2
9433	12	27	7	1
9441	22	1	8	88
9449	3	11	4	7
9457	25	68	5	3
9465	19	45	7	1
9473	18	71	4	7
9481	12	61	5	3
9489	25	6	7	2
9497	28	12	4	6
9505	9	41	4	5
9513	27	43	4	59
9521	3	26	9	228
9529	28	55	7	2
9537	2	19	3	12
9545	18	64	6	4
9553	21	70	6	4
9561	3	38	4	167
9569	26	31	7	2
9577	23	63	6	4
9585	22	56	7	2
8798	9	1	4	5
8806	21	25	4	33
8814	19	63	7	1
8822	23	18	4	180
8830	8	8	4	93
8838	22	46	12	229
8846	21	30	7	1
8854	21	72	5	3
8862	15	38	5	3
8870	20	45	12	216
8878	4	43	4	7
8886	12	26	4	5
8894	24	40	9	228
8902	23	12	4	6
8910	7	29	4	5
8918	13	28	12	194
8926	4	67	4	41
8934	16	68	4	7
8942	5	14	4	7
8950	19	50	4	7
8958	5	27	7	1
8966	19	45	12	216
8974	6	8	4	5
8982	4	41	4	6
8990	7	2	6	4
8998	11	15	9	228
9006	15	18	4	32
9014	16	62	7	2
9022	17	5	3	171
9030	13	5	3	40
9038	2	32	4	36
9046	16	62	4	127
9054	17	17	4	7
9062	11	54	9	228
9070	4	6	4	6
9078	22	29	3	162
9086	7	70	7	1
9094	23	48	9	228
9102	19	20	7	2
9110	15	45	4	222
9118	22	9	4	7
9126	8	25	4	7
9134	21	56	3	146
9142	6	15	6	4
9150	12	53	4	5
9158	4	63	4	48
9166	7	63	11	126
9174	6	13	7	2
9182	18	47	9	228
9190	19	71	4	56
9198	3	37	4	5
9206	24	18	9	228
9214	3	49	7	1
9222	26	50	9	228
9230	20	7	4	65
9238	19	43	9	228
9246	3	31	6	206
9254	13	53	6	4
9262	5	46	4	230
9270	6	13	4	115
9278	22	26	4	31
9286	20	32	3	75
9294	10	7	4	102
9302	6	46	7	2
9310	11	32	9	228
9318	5	2	7	1
9326	5	42	4	6
9334	19	21	9	228
9342	7	28	7	2
9350	14	54	4	209
9358	24	44	4	5
9366	26	56	7	1
9374	21	23	3	137
9382	14	31	6	207
9390	26	64	6	4
9398	24	52	4	6
9406	24	46	4	227
9414	25	2	7	1
9422	6	55	4	6
9430	28	57	6	4
9438	5	64	4	7
9446	23	64	4	5
9454	22	40	12	92
9462	28	44	3	179
9470	20	28	3	17
9478	27	3	12	189
9486	25	7	4	65
9494	17	15	5	3
9502	5	53	4	7
9510	6	56	12	196
9518	26	68	4	42
9526	27	66	7	1
9534	13	70	6	4
9542	2	40	6	4
9550	17	55	4	6
9558	24	25	4	7
9566	7	11	9	228
9574	8	58	6	4
9582	11	49	7	2
9590	16	46	3	225
9598	26	53	6	4
9606	10	45	7	1
9614	15	49	10	170
9622	5	10	3	178
9630	6	21	4	5
9638	4	70	4	6
9646	12	74	4	7
9654	27	14	6	4
9662	16	60	4	6
9670	20	7	3	155
9678	10	52	3	154
9686	4	24	4	7
9694	14	44	7	1
9702	2	56	3	174
9710	25	21	4	168
9718	6	74	9	228
9726	17	1	8	88
9734	19	43	5	3
9742	6	4	4	83
9750	13	28	6	4
9758	13	40	7	1
9766	10	21	4	142
9774	7	63	4	6
9782	16	46	12	216
9790	8	56	12	122
9798	18	40	9	228
9806	21	49	7	2
9814	13	56	3	174
9822	11	46	7	2
9830	12	38	7	2
9838	19	71	6	4
9846	26	40	5	3
9854	16	1	5	3
9862	23	10	4	7
9870	9	39	7	2
9878	20	56	4	172
9886	3	10	4	6
9894	6	72	3	118
9902	3	51	4	5
9910	4	49	3	151
9918	14	16	3	57
9926	17	4	5	3
9934	11	23	7	1
9942	12	48	4	6
9950	28	56	3	223
9958	4	24	4	6
9966	2	41	5	3
9974	17	20	4	6
9982	6	65	4	5
9990	21	53	6	4
9998	20	30	3	68
10006	27	39	4	140
10014	8	46	3	226
10022	19	24	4	181
10030	2	58	4	7
10038	8	61	4	6
10046	6	9	7	1
8799	18	24	4	6
8807	13	25	4	33
8815	25	14	9	228
8823	28	31	6	207
8831	19	44	4	5
8839	5	61	7	2
8847	23	44	4	192
8855	19	74	7	1
8863	15	15	7	1
8871	20	48	7	1
8879	25	72	6	4
8887	17	26	6	4
8895	7	66	4	6
8903	26	52	3	154
8911	26	46	4	222
8919	4	23	4	6
8927	15	15	4	6
8935	26	57	7	2
8943	6	6	4	7
8951	4	58	9	228
8959	3	29	4	7
8967	24	58	6	4
8975	26	30	4	6
8983	23	9	4	7
8991	28	29	7	1
8999	14	66	7	2
9007	3	3	5	3
9015	12	14	3	57
9023	5	47	7	2
9031	11	5	3	177
9039	10	66	7	1
9047	3	3	6	4
9055	27	10	5	3
9063	18	67	9	228
9071	19	38	4	6
9079	4	46	12	216
9087	5	45	4	227
9095	2	53	4	176
9103	4	29	4	5
9111	2	56	4	6
9119	8	64	7	2
9127	5	33	7	1
9135	6	28	3	161
9143	28	10	3	204
9151	21	45	3	226
9159	22	45	7	2
9167	28	13	5	3
9175	17	23	3	164
9183	5	46	3	226
9191	8	31	3	162
9199	6	29	3	161
9207	14	21	4	168
9215	28	60	4	7
9223	16	65	4	173
9231	9	72	4	7
9239	9	11	7	2
9247	18	55	4	80
9255	17	68	7	2
9263	11	58	6	4
9271	20	46	7	2
9279	18	3	7	2
9287	10	63	11	126
9295	22	70	7	2
9303	7	29	3	161
9311	15	2	7	2
9319	21	50	5	3
9327	9	40	13	78
9335	3	54	5	3
9343	2	12	5	3
9351	19	29	9	228
9359	8	39	7	2
9367	11	23	4	6
9375	26	28	12	194
9383	2	57	7	1
9391	14	12	7	1
9399	28	67	6	4
9407	20	52	3	154
9415	26	74	7	1
9423	16	59	4	5
9431	22	60	3	169
9439	24	43	7	2
9447	4	53	10	203
9455	26	19	4	6
9463	9	68	7	2
9471	24	65	5	3
9479	16	7	4	7
9487	21	29	4	5
9495	20	24	4	181
9503	11	32	6	4
9511	3	20	4	6
9519	19	73	4	5
9527	16	39	4	7
9535	17	72	6	4
9543	28	68	4	42
9551	21	29	9	228
9559	7	32	4	5
9567	6	46	3	201
9575	21	46	12	229
9583	23	53	9	228
9591	2	22	6	4
9599	27	70	4	98
9607	16	52	7	1
9615	5	26	4	6
9623	17	53	3	203
9631	8	17	4	7
9639	6	63	4	6
9647	10	19	7	1
9655	6	43	3	101
9663	23	73	4	7
9671	28	72	7	1
9679	21	56	3	215
9687	27	1	7	2
9695	2	72	5	3
9703	24	56	3	146
9711	14	36	7	1
9719	7	6	7	2
9727	15	56	4	5
9735	23	13	9	228
9743	6	54	10	221
9751	18	45	4	6
9759	5	56	3	146
9767	28	9	6	4
9775	3	17	6	4
9783	22	47	4	5
9791	22	38	4	7
9799	6	14	9	228
9807	21	35	9	228
9815	3	55	4	80
9823	5	25	7	2
9831	20	38	7	2
9839	13	19	4	6
9847	20	46	4	7
9855	19	50	6	4
9863	28	9	6	129
9871	19	7	4	102
9879	21	37	7	1
9887	7	25	6	4
9895	5	56	4	6
9903	5	46	3	229
9911	21	21	4	168
9919	12	25	4	7
9927	13	21	5	3
9935	8	50	2	213
9943	28	20	4	113
9951	2	11	7	2
9959	12	35	9	228
9967	10	32	7	2
9975	22	69	4	6
9983	21	67	7	2
9991	24	7	3	155
9999	9	69	5	3
10007	20	29	6	207
10015	18	48	4	6
10023	15	31	3	161
10031	21	56	12	208
10039	18	17	4	193
10047	21	12	3	87
8800	9	46	4	227
8808	15	35	4	5
8816	17	11	7	2
8824	10	45	3	222
8832	14	50	4	5
8840	19	45	3	225
8848	12	52	4	95
8856	13	72	5	3
8864	27	51	4	6
8872	11	36	4	5
8880	3	29	7	2
8888	20	55	12	159
8896	5	68	6	4
8904	12	40	4	39
8912	9	60	7	1
8920	8	4	5	3
8928	15	53	4	5
8936	14	43	3	101
8944	10	43	3	232
8952	10	1	4	5
8960	9	12	4	5
8968	19	56	3	208
8976	25	10	3	220
8984	2	36	4	5
8992	25	70	4	60
9000	5	38	4	6
9008	8	29	6	4
9016	11	54	6	4
9024	8	23	5	3
9032	20	60	9	228
9040	2	29	5	3
9048	5	2	7	2
9056	16	55	6	4
9064	11	43	3	21
9072	17	43	4	59
9080	15	55	4	6
9088	19	5	3	177
9096	11	49	9	228
9104	24	60	4	7
9112	4	4	4	83
9120	7	44	12	179
9128	8	56	12	196
9136	12	54	5	3
9144	22	56	3	215
9152	7	33	3	71
9160	27	43	12	101
9168	16	64	7	2
9176	20	18	4	180
9184	12	16	4	6
9192	25	45	3	225
9200	20	52	10	154
9208	6	32	6	4
9216	19	30	3	162
9224	20	25	4	33
9232	6	34	7	1
9240	17	36	6	4
9248	20	16	4	6
9256	13	17	4	193
9264	15	60	9	228
9272	25	45	12	216
9280	9	7	3	155
9288	6	7	4	5
9296	13	28	7	2
9304	13	29	3	161
9312	6	72	6	4
9320	17	47	9	228
9328	8	15	9	228
9336	23	24	4	7
9344	24	71	7	2
9352	26	72	3	72
9360	13	20	7	2
9368	21	20	7	2
9376	9	29	7	2
9384	25	53	7	2
9392	12	8	4	28
9400	6	21	9	228
9408	7	56	12	122
9416	22	25	5	3
9424	10	68	9	228
9432	4	56	3	122
9440	14	44	3	179
9448	25	32	6	4
9456	20	47	4	5
9464	17	41	4	5
9472	28	60	7	2
9480	26	24	3	137
9488	14	70	4	7
9496	10	4	4	5
9504	26	43	9	228
9512	6	46	4	7
9520	26	35	9	228
9528	16	1	4	5
9536	14	21	9	228
9544	21	23	7	2
9552	10	67	4	6
9560	6	40	4	5
9568	22	17	5	3
9576	17	59	4	5
9584	4	67	4	6
9592	26	8	7	1
9600	25	39	4	7
9608	12	69	7	1
9616	8	32	12	106
9624	22	10	4	5
9632	17	15	4	7
9640	2	62	6	4
9648	2	15	7	2
9656	6	35	5	3
9664	18	29	5	3
9672	25	37	7	1
9680	13	73	3	34
9688	28	10	3	210
9696	25	2	6	4
9704	17	46	3	231
9712	5	2	9	228
9720	3	47	7	2
9728	4	9	6	129
9736	3	45	3	222
9744	22	13	7	2
9752	24	45	4	6
9760	11	17	4	5
9768	21	4	4	83
9776	17	11	6	4
9784	27	49	4	45
9792	11	71	7	2
9800	11	68	6	4
9808	6	64	6	4
9816	7	21	4	168
9824	3	20	7	1
9832	6	3	5	3
9840	28	45	3	200
9848	27	38	4	7
9856	12	18	5	3
9864	8	65	9	228
9872	11	64	4	7
9880	2	73	6	4
9888	24	5	12	84
9896	10	64	7	2
9904	19	47	5	3
9912	9	10	4	6
9920	26	23	3	137
9928	12	21	6	4
9936	10	65	5	3
9944	14	22	4	6
9952	5	46	3	232
9960	7	25	9	228
9968	9	33	5	3
9976	8	57	4	6
9984	21	17	4	193
9992	4	54	10	221
10000	18	38	7	2
10008	2	35	7	1
10016	12	30	3	68
10024	12	39	4	5
10032	22	24	4	7
10040	5	26	4	5
10048	10	18	5	3
9229	9	32	4	7
9237	10	26	9	228
9245	13	21	4	142
9253	13	3	12	189
9261	9	56	3	196
9269	20	72	3	72
9277	8	54	6	4
9285	10	25	3	183
9293	22	53	5	3
9301	21	35	6	4
9309	6	44	3	130
9317	19	13	4	6
9325	5	26	5	3
9333	11	21	9	228
9341	18	42	4	6
9349	5	51	2	212
9357	25	18	9	228
9365	12	3	9	228
9373	18	36	5	3
9381	6	11	3	158
9389	10	50	4	7
9397	12	40	5	3
9405	25	43	9	228
9413	23	45	4	230
9421	9	8	6	4
9429	3	65	3	89
9437	28	21	4	5
9445	28	39	3	107
9453	14	40	12	92
9461	24	7	5	3
9469	18	11	3	132
9477	11	43	3	232
9485	24	39	6	4
9493	18	40	6	4
9501	10	45	3	225
9509	22	51	7	1
9517	2	44	9	228
9525	19	45	3	222
9533	22	64	4	5
9541	20	18	4	5
9549	12	31	6	207
9557	24	6	4	7
9565	21	38	4	19
9573	15	52	10	154
9581	12	38	6	4
9589	25	72	4	5
9597	9	49	4	7
9605	19	25	4	5
9613	19	37	7	1
9621	22	46	6	4
9629	8	52	7	1
9637	12	49	4	85
9645	20	66	4	47
9653	28	47	4	5
9661	18	27	4	6
9669	28	5	12	171
9677	9	43	3	232
9685	22	20	6	4
9693	27	15	4	5
9701	25	35	6	4
9709	27	66	4	7
9717	4	22	5	3
9725	2	43	3	232
9733	4	21	9	228
9741	28	52	9	228
9749	13	18	4	66
9757	25	17	4	5
9765	14	20	6	4
9773	6	65	7	1
9781	2	57	7	2
9789	25	15	5	3
9797	19	61	7	2
9805	4	24	4	112
9813	4	18	6	4
9821	23	56	12	208
9829	10	63	4	6
9837	7	35	5	3
9845	13	21	4	168
9853	4	46	4	227
9861	18	15	4	25
9869	27	28	12	194
9877	6	43	9	228
9885	22	51	4	6
9893	16	53	4	198
9901	3	60	7	1
9909	20	17	7	2
9917	2	5	3	84
9925	23	27	12	191
9933	18	2	4	6
9941	2	70	7	1
9949	10	14	4	7
9957	12	39	5	3
9965	5	23	7	1
9973	20	71	4	56
9981	23	49	9	228
9989	20	71	6	4
9997	17	12	5	3
10005	3	45	4	211
10013	17	46	7	2
10021	17	71	6	4
10029	4	6	4	7
10037	28	65	3	125
10045	3	32	4	7
10053	20	17	6	4
10061	20	5	12	84
10069	2	24	4	6
10077	14	33	3	105
10085	13	45	12	216
10093	15	16	9	228
10101	7	41	7	1
10109	13	46	3	201
10117	28	49	9	228
10125	27	57	9	228
10133	15	37	4	6
10141	14	52	10	154
10149	22	49	5	3
10157	2	61	7	1
10165	9	73	4	5
10173	13	30	3	68
10181	9	65	4	5
10189	7	33	7	1
10197	2	44	7	2
10205	16	41	7	1
10213	19	19	4	6
10221	10	74	3	100
10229	11	53	4	176
10237	11	16	4	7
10245	8	12	4	5
10253	6	12	4	6
10261	16	1	8	88
10269	6	41	13	109
10277	7	46	3	226
10285	26	24	6	4
10293	25	14	3	57
10301	14	55	4	6
10309	23	22	7	1
10317	28	39	4	5
10325	8	1	8	88
10333	7	1	4	7
10341	13	13	7	2
10349	7	16	6	4
10357	15	25	7	1
10365	3	46	4	6
10373	2	64	6	4
10381	26	23	7	1
10389	19	44	3	130
10397	2	63	4	5
10405	9	7	9	228
10413	23	63	4	7
10421	12	6	7	2
10429	20	39	5	3
10437	4	58	6	4
10445	20	46	9	228
10453	24	27	3	53
10461	22	52	3	154
10469	14	2	4	7
10477	8	7	3	155
8803	14	72	4	5
8811	2	9	4	5
8819	9	39	4	7
8827	21	21	4	142
8835	2	33	6	4
8843	26	64	9	228
8851	27	56	3	174
8859	20	65	3	150
8867	20	59	7	1
8875	8	68	4	7
8883	22	61	4	5
8891	20	46	3	232
8899	18	41	4	5
8907	28	64	5	3
8915	25	29	5	3
8923	5	5	12	84
8931	14	61	4	5
8939	26	3	12	189
8947	26	58	5	3
8955	11	45	3	222
8963	15	28	6	4
8971	14	64	5	3
8979	4	53	5	3
8987	10	17	6	4
8995	7	56	12	174
9003	26	52	7	2
9011	18	5	3	177
9019	15	5	4	199
9027	10	19	4	6
9035	23	73	3	34
9043	26	5	3	143
9051	2	72	6	4
9059	9	43	4	59
9067	17	61	6	4
9075	13	7	6	4
9083	8	47	4	38
9091	21	13	9	228
9099	25	49	4	7
9107	17	19	4	6
9115	12	18	4	180
9123	6	24	7	2
9131	28	18	4	66
9139	7	10	6	4
9147	10	62	6	4
9155	15	66	9	228
9163	15	45	6	4
9171	11	20	7	2
9179	20	44	4	6
9187	13	72	3	118
9195	27	1	8	88
9203	20	14	9	228
9211	25	21	4	7
9219	27	62	7	1
9227	15	25	4	5
9235	8	50	3	197
9243	12	72	9	228
9251	27	1	8	148
9259	23	1	4	6
9267	20	44	3	130
9275	7	35	6	4
9283	22	22	4	6
9291	26	9	12	70
9299	23	33	4	6
9307	5	74	7	1
9315	12	13	4	115
9323	4	40	9	228
9331	4	26	6	4
9339	10	7	6	4
9347	22	31	6	207
9355	12	56	3	208
9363	12	55	7	1
9371	7	46	6	4
9379	11	64	7	2
9387	17	9	4	5
9395	20	27	4	6
9403	26	65	4	5
9411	25	44	3	130
9419	14	6	5	3
9427	7	40	4	5
9435	8	47	4	7
9443	23	24	7	2
9451	26	24	4	181
9459	24	24	4	112
9467	8	41	5	3
9475	27	53	6	4
9483	11	24	4	112
9491	21	60	7	2
9499	18	43	3	232
9507	26	14	6	4
9515	23	73	4	6
9523	5	61	4	7
9531	2	39	9	228
9539	14	34	7	2
9547	15	44	3	179
9555	22	21	9	228
9563	24	17	4	193
9571	5	25	6	4
9579	9	44	4	156
9587	8	28	3	162
9595	4	42	7	2
9603	8	56	12	82
9611	3	53	4	7
9619	23	45	3	232
9627	14	41	4	7
9635	5	11	4	5
9643	6	3	4	5
9651	6	23	4	6
9659	18	2	4	7
9667	5	47	9	228
9675	12	8	7	1
9683	19	74	3	100
9691	26	53	5	3
9699	3	35	3	166
9707	21	67	4	62
9715	24	61	9	228
9723	3	4	4	5
9731	10	42	4	7
9739	14	30	3	162
9747	25	21	5	3
9755	9	72	4	5
9763	19	3	12	189
9771	13	10	3	210
9779	19	39	7	2
9787	6	14	4	7
9795	13	1	8	88
9803	17	32	7	2
9811	5	50	4	7
9819	11	14	4	7
9827	15	63	7	2
9835	18	23	4	112
9843	12	17	7	2
9851	24	32	4	7
9859	21	17	4	7
9867	19	68	6	4
9875	20	6	9	228
9883	18	18	6	4
9891	3	47	6	4
9899	7	51	7	1
9907	17	33	5	3
9915	20	53	7	2
9923	11	11	9	228
9931	21	21	5	3
9939	28	14	4	5
9947	25	16	7	1
9955	8	70	7	1
9963	8	7	7	2
9971	5	56	4	46
9979	11	63	4	6
9987	5	29	6	4
9995	5	43	3	232
10003	28	61	5	3
10011	25	11	7	2
10019	22	16	7	2
10027	16	22	4	5
10035	17	33	4	5
10043	18	46	3	229
10051	24	1	3	13
8804	28	22	7	1
8812	22	58	4	114
8820	23	9	6	129
8828	23	45	3	226
8836	21	61	5	3
8844	27	19	7	1
8852	4	21	4	7
8860	7	5	3	171
8868	23	22	3	8
8876	14	62	4	6
8884	22	50	4	5
8892	7	1	8	88
8900	25	73	4	5
8908	18	22	4	5
8916	20	21	5	3
8924	8	40	7	2
8932	16	15	6	4
8940	27	59	4	6
8948	5	52	4	6
8956	26	34	7	1
8964	11	46	3	229
8972	17	72	7	2
8980	10	59	4	6
8988	2	11	3	158
8996	17	21	5	3
9004	18	56	3	174
9012	20	14	3	57
9020	24	54	9	228
9028	3	17	4	133
9036	18	53	6	4
9044	27	57	4	5
9052	8	61	3	9
9060	10	67	9	228
9068	21	70	7	1
9076	17	62	7	2
9084	27	71	4	7
9092	16	22	4	7
9100	10	53	6	4
9108	2	16	7	1
9116	6	33	4	6
9124	14	18	4	6
9132	4	42	12	108
9140	8	67	7	2
9148	15	46	7	2
9156	23	59	4	7
9164	26	74	3	100
9172	17	57	7	2
9180	8	45	4	6
9188	5	43	9	228
9196	26	53	4	7
9204	23	17	6	4
9212	27	67	4	7
9220	19	53	10	203
9228	16	40	4	7
9236	10	21	7	2
9244	22	60	4	7
9252	14	69	4	6
9260	11	12	3	87
9268	7	59	4	6
9276	7	48	7	1
9284	28	43	4	5
9292	20	55	7	1
9300	28	1	7	1
9308	16	36	7	2
9316	22	57	9	228
9324	9	12	3	15
9332	21	17	7	2
9340	6	17	4	193
9348	12	6	9	228
9356	15	70	6	4
9364	23	5	3	143
9372	10	32	4	7
9380	17	60	4	6
9388	26	21	5	3
9396	12	43	6	4
9404	28	69	7	1
9412	14	9	6	129
9420	14	25	5	3
9428	8	59	4	5
9436	6	61	9	228
9444	26	32	5	3
9452	25	46	4	7
9460	26	48	4	6
9468	17	10	4	6
9476	17	14	3	57
9484	27	18	4	5
9492	12	35	4	30
9500	25	70	4	98
9508	6	1	3	13
9516	28	43	3	21
9524	9	14	3	57
9532	8	1	4	5
9540	8	15	4	25
9548	17	69	9	228
9556	13	23	7	2
9564	16	21	4	6
9572	16	42	4	6
9580	27	23	7	2
9588	9	7	4	102
9596	27	2	5	3
9604	17	11	9	228
9612	2	61	4	7
9620	25	25	4	5
9628	26	49	4	45
9636	2	39	3	74
9644	3	54	6	4
9652	14	7	2	186
9660	11	59	7	1
9668	10	29	5	3
9676	17	13	7	1
9684	11	3	12	189
9692	11	42	4	7
9700	2	23	4	5
9708	5	3	5	3
9716	20	49	4	85
9724	3	55	4	5
9732	5	10	6	4
9740	22	9	6	4
9748	8	49	4	7
9756	20	33	4	35
9764	13	71	9	228
9772	12	66	4	7
9780	21	67	5	3
9788	4	62	5	3
9796	2	65	4	7
9804	21	5	3	171
9812	23	69	4	6
9820	6	6	9	228
9828	15	23	12	137
9836	19	74	4	6
9844	7	56	3	174
9852	17	40	4	7
9860	15	31	9	228
9868	17	31	4	6
9876	12	56	4	172
9884	24	41	4	11
9892	19	68	5	3
9900	7	61	5	3
9908	15	2	4	7
9916	23	2	7	2
9924	7	26	4	5
9932	9	26	9	228
9940	27	59	7	1
9948	25	40	4	39
9956	26	28	3	17
9964	8	70	4	43
9972	12	61	9	228
9980	12	5	7	1
9988	15	10	9	228
9996	5	45	3	222
10004	24	60	7	1
10012	9	38	4	167
10020	18	57	7	2
10028	2	39	4	7
10036	27	2	7	2
10044	24	18	5	3
10052	3	6	3	63
8802	28	62	4	6
8810	12	32	4	36
8818	7	23	3	137
8826	24	72	7	2
8834	26	3	9	228
8842	14	14	4	25
8850	7	71	5	3
8858	10	62	4	5
8866	21	51	4	6
8874	5	32	4	36
8882	15	9	6	129
8890	4	35	3	166
8898	26	18	5	3
8906	24	49	3	151
8914	3	12	4	5
8922	22	67	5	3
8930	7	28	12	194
8938	25	11	3	158
8946	26	5	4	6
8954	22	9	6	129
8962	12	45	7	1
8970	7	38	4	7
8978	6	4	7	1
8986	27	5	3	40
8994	18	69	7	1
9002	19	33	4	6
9010	27	39	9	228
9018	23	45	9	228
9026	2	62	7	2
9034	10	22	6	4
9042	16	50	6	4
9050	7	60	5	3
9058	3	5	7	1
9066	18	62	9	228
9074	26	39	4	7
9082	6	64	4	5
9090	18	28	7	2
9098	12	33	3	105
9106	21	66	4	47
9114	9	23	3	164
9122	6	44	4	6
9130	27	17	4	5
9138	24	20	4	113
9146	28	66	4	47
9154	3	15	3	57
9162	28	11	4	6
9170	4	57	6	4
9178	16	25	4	7
9186	10	61	7	2
9194	5	5	3	119
9202	18	10	4	6
9210	14	14	4	5
9218	27	43	5	3
9226	27	70	4	7
9234	23	10	7	2
9242	5	58	5	3
9250	16	57	4	6
9258	26	61	3	9
9266	16	15	9	228
9274	15	23	4	7
9282	10	43	4	7
9290	5	5	7	1
9298	8	58	7	2
9306	19	64	7	2
9314	22	16	3	57
9322	20	30	3	162
9330	21	66	4	6
9338	12	5	4	6
9346	8	1	5	3
9354	17	29	6	207
9362	11	7	4	102
9370	12	7	4	131
9378	21	29	3	161
9386	28	20	7	2
9394	26	17	7	2
9402	16	17	7	1
9410	23	10	9	228
9418	18	8	5	3
9426	20	29	5	3
9434	2	7	4	7
9442	3	72	3	37
9450	22	44	3	179
9458	28	70	3	152
9466	14	51	7	1
9474	25	56	12	196
9482	10	63	7	1
9490	15	14	4	5
9498	7	70	7	2
9506	7	17	4	7
9514	21	43	4	59
9522	5	21	7	2
9530	9	72	6	4
9538	14	64	4	5
9546	9	14	9	228
9554	10	17	7	2
9562	17	65	5	3
9570	21	27	7	1
9578	5	3	4	7
9586	24	17	7	2
9594	22	1	4	7
9602	3	6	4	49
9610	24	56	7	2
9618	8	39	3	74
9626	25	19	4	6
9634	23	38	4	7
9642	28	46	6	4
9650	26	51	4	6
9658	19	34	7	2
9666	20	53	5	3
9674	13	12	4	6
9682	18	52	3	154
9690	9	53	3	203
9698	21	43	3	21
9706	25	55	3	159
9714	5	7	6	4
9722	9	1	8	88
9730	7	58	4	6
9738	22	4	7	1
9746	27	72	4	6
9754	26	69	4	6
9762	18	3	6	4
9770	24	57	5	3
9778	4	7	7	2
9786	23	19	4	7
9794	7	37	7	1
9802	17	40	13	78
9810	18	46	4	227
9818	12	46	9	228
9826	25	14	6	4
9834	9	32	7	2
9842	20	66	4	6
9850	15	28	9	228
9858	20	25	4	7
9866	8	65	3	89
9874	2	8	4	93
9882	10	18	6	4
9890	9	7	6	4
9898	24	25	4	104
9906	3	18	4	133
9914	20	18	5	3
9922	5	11	9	228
9930	2	57	4	6
9938	26	71	4	56
9946	21	46	4	222
9954	5	38	4	64
9962	5	73	4	5
9970	4	43	3	232
9978	12	55	4	6
9986	16	73	6	4
9994	13	46	9	228
10002	3	56	4	6
10010	17	64	7	2
10018	3	61	4	52
10026	12	68	9	228
10034	14	74	7	2
10042	9	71	4	7
10050	12	64	5	3
9593	19	68	4	42
9601	26	7	4	102
9609	23	49	10	170
9617	25	14	7	2
9625	26	67	9	228
9633	4	27	7	1
9641	14	20	5	3
9649	11	39	4	7
9657	5	39	7	2
9665	7	9	4	7
9673	9	43	7	2
9681	22	45	3	226
9689	10	14	3	57
9697	6	57	3	18
9705	10	27	4	6
9713	28	12	4	141
9721	10	31	7	1
9729	26	24	5	3
9737	14	35	4	134
9745	16	49	4	7
9753	21	71	9	228
9761	6	34	7	2
9769	28	48	5	3
9777	7	28	3	138
9785	22	27	4	7
9793	21	72	3	118
9801	16	65	9	228
9809	5	72	6	4
9817	21	56	3	174
9825	19	46	7	2
9833	8	70	4	6
9841	11	55	4	6
9849	16	18	7	2
9857	15	71	4	5
9865	3	40	13	78
9873	20	5	4	6
9881	25	15	4	5
9889	8	53	4	198
9897	18	25	4	104
9905	27	58	4	5
9913	14	70	7	2
9921	17	12	3	15
9929	4	5	3	119
9937	17	40	7	2
9945	15	4	4	6
9953	28	1	8	88
9961	6	45	4	6
9969	5	4	4	5
9977	8	17	7	1
9985	12	25	7	2
9993	19	21	7	2
10001	15	5	3	171
10009	14	38	5	3
10017	22	65	4	6
10025	18	65	4	5
10033	8	46	4	227
10041	19	36	9	228
10049	28	56	4	7
10057	9	56	12	196
10065	13	39	4	140
10073	12	44	4	5
10081	27	13	4	115
10089	25	17	4	193
10097	12	29	9	228
10105	17	42	7	1
10113	8	63	7	1
10121	23	42	9	228
10129	21	39	4	140
10137	18	36	9	228
10145	11	32	5	3
10153	14	61	3	9
10161	14	24	7	2
10169	10	46	3	229
10177	6	13	4	6
10185	3	50	4	7
10193	17	28	7	1
10201	2	17	4	193
10209	10	43	9	228
10217	11	19	4	6
10225	26	34	6	4
10233	19	14	3	57
10241	14	28	3	161
10249	28	46	9	228
10257	4	38	4	6
10265	4	56	12	174
10273	8	72	4	5
10281	23	23	3	137
10289	27	72	7	1
10297	16	51	4	5
10305	12	15	4	5
10313	24	15	5	3
10321	13	11	3	24
10329	13	16	9	228
10337	17	39	3	74
10345	17	43	9	228
10353	27	34	5	3
10361	8	20	7	1
10369	23	62	7	1
10377	24	22	4	5
10385	17	19	3	76
10393	21	45	4	230
10401	16	22	9	228
10409	16	26	4	7
10417	9	55	4	80
10425	25	35	4	7
10433	4	46	4	230
10441	6	16	7	1
10449	21	25	9	228
10457	16	58	4	7
10465	16	53	7	1
10473	21	10	4	7
10481	26	39	4	5
10489	4	72	3	72
10497	7	5	7	1
10505	18	4	5	3
10513	11	60	7	1
10521	12	70	7	2
10529	28	64	4	5
10537	7	50	4	5
10545	28	17	5	3
10553	3	12	5	3
10561	23	38	4	128
10569	13	11	3	158
10577	23	55	4	10
10585	19	7	2	186
10593	22	35	9	228
10601	16	28	3	99
10609	7	68	5	3
10617	4	71	4	56
10625	14	70	5	3
10633	11	24	3	137
10641	27	35	4	30
10649	12	25	6	4
10657	27	17	6	4
10665	6	1	7	1
10673	18	56	12	196
10681	20	39	3	107
10689	6	14	4	5
10697	11	17	4	133
10705	3	38	4	64
10713	17	37	5	3
10721	18	74	7	1
10729	13	45	3	225
10737	12	53	10	203
10745	13	57	5	3
10753	16	4	7	2
10761	14	49	2	217
10769	14	54	7	1
10777	9	56	3	208
10785	22	15	4	6
10793	19	17	7	2
10801	14	31	9	228
10809	23	70	5	3
10817	28	64	4	6
10825	4	53	4	7
10833	26	15	4	25
10841	28	5	3	40
10058	12	22	4	6
10066	11	6	6	4
10074	4	16	7	1
10082	13	62	7	1
10090	18	39	5	3
10098	23	65	7	1
10106	8	46	4	230
10114	3	46	3	229
10122	22	27	7	1
10130	23	20	4	7
10138	4	1	3	13
10146	8	2	4	6
10154	23	31	5	3
10162	8	37	6	4
10170	22	57	5	3
10178	23	74	7	2
10186	19	25	9	228
10194	5	20	4	6
10202	5	43	5	3
10210	4	68	4	42
10218	3	54	9	228
10226	27	40	7	1
10234	19	21	5	3
10242	9	70	4	60
10250	15	10	3	153
10258	23	12	4	141
10266	16	68	6	4
10274	21	23	4	6
10282	12	3	12	189
10290	27	45	4	227
10298	27	74	5	3
10306	22	28	3	184
10314	7	66	3	86
10322	2	14	4	6
10330	10	49	9	228
10338	13	4	4	6
10346	13	60	9	228
10354	25	10	5	3
10362	11	3	5	3
10370	14	35	4	5
10378	27	22	3	73
10386	26	46	3	226
10394	27	16	5	3
10402	3	11	3	158
10410	17	11	4	7
10418	12	3	6	4
10426	28	3	4	5
10434	8	15	6	4
10442	8	56	3	196
10450	5	42	7	1
10458	24	40	4	39
10466	9	69	9	228
10474	15	34	4	7
10482	4	46	3	229
10490	22	37	7	1
10498	7	54	4	6
10506	10	20	7	1
10514	25	68	7	2
10522	25	36	6	4
10530	4	25	4	7
10538	28	56	12	214
10546	3	15	4	25
10554	28	21	6	4
10562	15	10	3	178
10570	14	18	4	160
10578	4	59	4	5
10586	28	16	7	2
10594	28	65	3	188
10602	14	23	7	2
10610	24	44	5	3
10618	21	22	4	6
10626	11	23	4	164
10634	14	65	7	1
10642	27	45	3	225
10650	11	5	12	84
10658	2	4	7	2
10666	23	28	4	7
10674	12	3	4	7
10682	5	25	4	33
10690	17	40	6	4
10698	5	18	4	5
10706	12	21	7	2
10714	9	63	7	1
10722	20	11	3	132
10730	21	14	4	25
10738	13	46	4	211
10746	21	68	4	42
10754	16	54	4	5
10762	10	56	7	1
10770	24	68	4	7
10778	23	63	9	228
10786	17	58	6	4
10794	8	40	9	228
10802	2	41	4	5
10810	10	69	5	3
10818	23	5	7	2
10826	14	72	7	1
10834	24	21	6	4
10842	4	38	7	1
10850	10	44	3	130
10858	26	26	7	1
10866	21	66	7	2
10874	11	7	3	155
10882	19	39	4	7
10890	26	42	5	3
10898	2	29	4	7
10906	15	45	7	2
10914	15	45	3	232
10922	22	14	5	3
10930	28	67	4	62
10938	14	23	12	137
10946	27	45	3	231
10954	4	20	7	1
10962	4	39	5	3
10970	16	13	4	5
10978	22	34	4	7
10986	19	6	9	228
10994	6	45	3	225
11002	28	37	3	205
11010	18	34	4	29
11018	3	36	4	110
11026	7	51	2	212
11034	14	45	12	216
11042	24	29	7	2
11050	7	4	4	5
11058	16	73	4	5
11066	24	72	5	3
11074	22	53	4	176
11082	16	12	6	4
11090	16	71	4	7
11098	27	41	4	6
11106	20	72	4	5
11114	12	41	7	1
11122	17	67	4	6
11130	15	33	4	35
11138	27	38	7	1
11146	21	5	6	4
11154	25	46	12	216
11162	26	68	4	6
11170	16	48	4	7
11178	22	8	6	4
11186	7	30	3	161
11194	2	65	4	6
11202	23	18	4	7
11210	8	3	5	3
11218	14	31	7	1
11226	25	25	4	6
11234	17	26	2	187
11242	20	46	12	216
11250	24	74	3	135
11258	16	20	7	2
11266	19	66	9	228
11274	23	26	5	3
11282	24	8	4	55
11290	9	10	4	5
11298	3	39	7	1
11306	5	32	4	6
10056	9	59	4	5
10064	17	32	6	4
10072	28	68	4	5
10080	26	13	4	6
10088	11	68	7	2
10096	26	49	7	2
10104	21	30	3	68
10112	16	32	7	2
10120	26	1	8	88
10128	28	59	4	6
10136	11	26	4	31
10144	7	18	4	160
10152	14	37	3	205
10160	17	73	4	5
10168	12	9	4	6
10176	10	22	3	73
10184	17	44	4	156
10192	17	7	4	65
10200	12	6	5	3
10208	13	46	3	232
10216	21	48	4	7
10224	14	49	10	170
10232	8	11	9	228
10240	20	15	4	5
10248	15	46	5	3
10256	7	30	3	162
10264	27	49	10	224
10272	4	33	3	105
10280	24	62	4	5
10288	8	51	4	5
10296	2	64	5	3
10304	23	10	3	219
10312	22	30	7	1
10320	23	7	2	186
10328	25	6	3	120
10336	26	60	7	2
10344	12	67	6	4
10352	16	61	7	2
10360	24	61	6	4
10368	27	56	6	4
10376	7	18	7	1
10384	2	66	7	1
10392	9	44	4	5
10400	27	58	7	1
10408	17	58	7	2
10416	10	56	3	122
10424	8	38	4	6
10432	25	58	9	228
10440	9	20	4	6
10448	19	63	4	6
10456	14	52	3	154
10464	14	3	6	4
10472	8	71	7	2
10480	14	65	3	125
10488	7	29	5	3
10496	13	11	6	4
10504	6	13	7	1
10512	23	35	5	3
10520	26	31	6	207
10528	5	57	7	2
10536	19	9	12	70
10544	4	64	9	228
10552	12	40	4	5
10560	18	28	7	1
10568	7	27	7	1
10576	6	17	9	228
10584	2	58	7	2
10592	17	25	4	104
10600	12	49	7	2
10608	4	56	4	6
10616	4	32	5	3
10624	7	38	5	3
10632	22	65	7	1
10640	27	35	3	166
10648	19	72	3	118
10656	15	16	7	2
10664	9	40	9	228
10672	2	33	4	5
10680	23	43	5	3
10688	27	31	6	207
10696	16	14	4	7
10704	16	53	4	6
10712	23	56	7	2
10720	22	24	7	2
10728	14	73	4	6
10736	15	56	3	146
10744	27	45	12	216
10752	24	38	4	7
10760	24	25	4	33
10768	5	4	5	3
10776	4	8	4	28
10784	10	10	3	220
10792	18	25	7	2
10800	14	24	9	228
10808	22	28	12	194
10816	22	7	4	131
10824	27	32	4	6
10832	25	37	4	6
10840	2	25	6	4
10848	26	6	3	120
10856	6	2	6	4
10864	23	30	7	1
10872	24	56	3	223
10880	4	47	7	2
10888	24	56	12	214
10896	12	74	3	69
10904	11	56	4	7
10912	7	71	6	4
10920	27	13	4	7
10928	12	34	4	7
10936	7	62	4	6
10944	27	57	5	3
10952	5	44	5	3
10960	14	2	7	2
10968	9	50	9	228
10976	27	33	7	1
10984	7	61	4	7
10992	18	25	4	7
11000	26	38	6	4
11008	20	43	7	2
11016	7	19	3	76
11024	28	61	3	9
11032	27	57	6	4
11040	13	35	3	166
11048	24	48	7	1
11056	6	31	4	7
11064	28	70	5	3
11072	9	40	4	39
11080	9	44	6	4
11088	15	26	7	1
11096	5	24	3	137
11104	23	3	12	189
11112	18	26	4	5
11120	6	71	4	5
11128	25	17	4	133
11136	14	46	4	5
11144	13	47	4	7
11152	16	21	4	142
11160	7	43	7	1
11168	25	13	9	228
11176	16	74	4	7
11184	26	10	3	219
11192	6	54	7	2
11200	21	52	5	3
11208	22	29	6	206
11216	26	9	5	3
11224	17	45	4	227
11232	20	9	5	3
11240	28	69	4	50
11248	14	15	9	228
11256	3	23	5	3
11264	24	3	4	157
11272	25	46	7	1
11280	13	33	9	228
11288	15	47	9	228
11296	12	20	5	3
11304	14	37	3	195
10054	16	58	6	4
10062	12	31	7	2
10070	28	21	5	3
10078	17	63	4	6
10086	21	53	4	7
10094	18	72	6	4
10102	12	42	12	108
10110	11	25	9	228
10118	9	7	4	65
10126	27	54	4	209
10134	4	51	5	3
10142	25	40	4	5
10150	27	63	4	7
10158	22	52	10	154
10166	9	42	7	1
10174	6	39	3	107
10182	16	40	6	4
10190	8	39	6	4
10198	6	62	7	1
10206	18	53	4	176
10214	5	48	4	81
10222	4	35	4	7
10230	16	69	4	5
10238	19	53	6	4
10246	12	2	9	228
10254	16	46	3	231
10262	10	35	4	30
10270	8	70	4	60
10278	15	46	12	229
10286	28	66	5	3
10294	19	26	7	1
10302	22	28	3	161
10310	4	28	12	194
10318	19	10	9	228
10326	21	47	4	5
10334	12	20	7	2
10342	3	50	4	5
10350	25	8	4	6
10358	19	57	4	5
10366	3	1	4	6
10374	27	9	7	2
10382	13	36	3	182
10390	23	70	4	7
10398	28	25	3	139
10406	18	43	7	2
10414	23	28	3	138
10422	24	25	4	67
10430	27	40	4	5
10438	19	7	4	65
10446	28	46	3	201
10454	3	32	6	4
10462	27	56	3	223
10470	10	1	3	13
10478	16	55	3	159
10486	2	59	5	3
10494	15	55	4	116
10502	19	43	4	7
10510	18	56	4	172
10518	14	45	4	6
10526	4	17	7	2
10534	12	58	4	114
10542	24	58	5	3
10550	8	18	9	228
10558	20	52	4	6
10566	17	69	5	3
10574	16	59	5	3
10582	5	25	9	228
10590	9	25	4	104
10598	2	46	4	230
10606	5	68	7	2
10614	9	36	4	110
10622	10	68	7	2
10630	19	24	3	137
10638	18	36	4	7
10646	23	65	3	188
10654	24	56	12	196
10662	9	16	7	1
10670	7	17	5	3
10678	4	68	7	2
10686	28	8	7	1
10694	19	17	4	133
10702	4	44	6	4
10710	9	46	4	230
10718	24	16	4	6
10726	28	29	3	161
10734	9	39	5	3
10742	2	26	5	3
10750	5	3	7	2
10758	18	7	4	65
10766	22	54	7	1
10774	2	32	4	7
10782	21	33	4	6
10790	16	10	7	1
10798	5	60	4	6
10806	8	62	4	5
10814	26	40	4	6
10822	27	20	9	228
10830	25	24	6	4
10838	13	6	4	7
10846	6	20	4	7
10854	4	54	6	4
10862	26	34	4	7
10870	17	11	3	158
10878	23	28	3	161
10886	20	71	7	2
10894	12	10	3	178
10902	19	61	5	3
10910	17	3	9	228
10918	22	45	4	230
10926	25	46	4	227
10934	13	57	4	79
10942	15	21	5	3
10950	5	26	4	31
10958	11	20	4	6
10966	22	15	7	1
10974	9	23	4	112
10982	2	10	4	6
10990	4	58	5	3
10998	6	1	4	6
11006	4	51	4	5
11014	14	21	4	142
11022	23	3	5	3
11030	23	23	12	137
11038	2	54	10	221
11046	10	19	4	5
11054	10	12	3	15
11062	7	3	6	4
11070	15	3	5	3
11078	10	36	6	4
11086	8	14	4	7
11094	25	23	4	164
11102	28	57	3	18
11110	15	9	12	111
11118	25	27	3	53
11126	11	7	4	131
11134	10	20	4	6
11142	8	34	7	2
11150	26	46	7	1
11158	16	4	4	83
11166	14	19	6	4
11174	25	6	4	6
11182	16	68	4	5
11190	9	26	2	187
11198	17	38	4	94
11206	14	17	4	32
11214	20	45	3	232
11222	9	66	3	86
11230	11	2	12	175
11238	19	1	4	7
11246	17	55	4	10
11254	2	31	5	3
11262	6	16	4	25
11270	21	51	7	2
11278	16	3	5	3
11286	26	41	5	3
11294	22	31	7	1
11302	23	2	7	1
10055	5	1	8	148
10063	14	11	4	5
10071	28	19	4	6
10079	17	14	7	2
10087	7	12	3	87
10095	14	10	6	4
10103	17	28	3	162
10111	2	42	7	1
10119	20	45	3	225
10127	28	53	4	176
10135	21	54	4	6
10143	16	42	7	1
10151	22	37	3	205
10159	13	71	4	5
10167	3	28	3	162
10175	17	46	3	229
10183	4	14	6	4
10191	20	38	6	4
10199	18	32	5	3
10207	27	32	7	1
10215	27	18	7	1
10223	11	21	5	3
10231	14	33	4	7
10239	22	18	4	32
10247	27	9	4	27
10255	20	10	3	204
10263	8	11	6	4
10271	6	6	3	120
10279	20	3	12	189
10287	22	64	7	1
10295	25	26	7	1
10303	10	43	4	59
10311	16	72	3	118
10319	6	23	7	1
10327	7	39	5	3
10335	25	28	4	7
10343	11	57	4	5
10351	13	45	4	227
10359	18	61	6	4
10367	23	45	3	229
10375	23	39	3	107
10383	27	46	3	232
10391	2	25	9	228
10399	19	35	6	4
10407	22	14	4	5
10415	5	40	6	4
10423	28	56	12	122
10431	8	44	9	228
10439	21	19	4	6
10447	24	46	3	200
10455	13	5	7	1
10463	8	58	4	7
10471	17	71	9	228
10479	25	36	9	228
10487	23	59	4	6
10495	3	23	4	112
10503	15	19	4	6
10511	3	58	6	4
10519	18	28	4	6
10527	18	46	4	7
10535	27	42	7	2
10543	3	32	9	228
10551	19	32	12	106
10559	9	61	4	52
10567	9	12	5	3
10575	9	63	4	6
10583	21	49	9	228
10591	20	70	4	7
10599	5	6	9	228
10607	13	29	6	4
10615	5	27	3	53
10623	10	16	4	6
10631	8	2	7	1
10639	26	5	3	119
10647	28	54	4	6
10655	28	70	9	228
10663	25	24	3	137
10671	24	72	9	228
10679	12	22	7	1
10687	28	18	4	103
10695	21	35	4	30
10703	15	31	5	3
10711	20	17	9	228
10719	8	31	4	6
10727	26	51	2	212
10735	27	10	7	2
10743	9	15	4	5
10751	13	54	7	1
10759	24	7	4	65
10767	26	35	3	166
10775	26	31	4	7
10783	9	58	6	4
10791	9	2	7	1
10799	17	74	7	1
10807	3	53	7	1
10815	10	43	6	4
10823	3	41	4	6
10831	5	33	3	105
10839	4	48	4	81
10847	2	22	9	228
10855	5	28	12	194
10863	10	30	4	5
10871	7	71	4	56
10879	28	41	7	2
10887	3	44	4	5
10895	12	53	5	3
10903	19	24	6	4
10911	26	47	5	3
10919	7	23	4	6
10927	18	18	4	160
10935	21	68	5	3
10943	6	5	3	119
10951	22	67	7	2
10959	19	20	4	6
10967	5	7	2	186
10975	12	11	9	228
10983	14	29	3	161
10991	10	51	4	5
10999	2	39	6	4
11007	10	36	4	30
11015	23	67	6	4
11023	24	56	4	6
11031	20	7	2	186
11039	28	53	6	4
11047	13	45	4	6
11055	6	26	4	31
11063	19	40	12	92
11071	23	60	7	2
11079	22	35	6	4
11087	21	16	3	57
11095	14	15	7	1
11103	7	2	4	7
11111	23	2	9	228
11119	27	46	3	201
11127	13	5	4	6
11135	21	74	3	100
11143	16	34	7	2
11151	8	7	4	6
11159	26	70	4	60
11167	20	59	4	7
11175	14	12	7	2
11183	26	29	3	162
11191	6	25	4	6
11199	14	21	7	1
11207	28	18	4	133
11215	25	5	4	7
11223	23	33	4	5
11231	20	33	7	2
11239	16	65	4	6
11247	17	31	4	5
11255	17	74	3	69
11263	8	33	4	35
11271	17	9	4	27
11279	26	70	4	43
11287	28	8	4	93
11295	4	50	10	202
11303	12	5	4	199
10060	22	5	3	171
10068	25	45	3	216
10076	21	53	10	203
10084	3	56	4	46
10092	20	9	12	70
10100	24	71	6	4
10108	11	3	4	7
10116	2	28	3	162
10124	9	36	4	7
10132	10	36	9	228
10140	9	40	6	4
10148	8	8	9	228
10156	20	57	6	4
10164	25	6	9	228
10172	11	30	4	6
10180	15	28	4	7
10188	9	24	4	112
10196	28	35	4	30
10204	20	55	3	159
10212	10	47	4	7
10220	7	3	4	5
10228	22	48	5	3
10236	19	7	9	228
10244	2	9	4	6
10252	15	19	4	7
10260	5	31	4	6
10268	2	24	3	137
10276	9	52	4	95
10284	21	20	6	4
10292	4	28	3	17
10300	24	52	10	154
10308	12	42	9	228
10316	9	56	12	122
10324	9	43	6	4
10332	27	5	3	177
10340	22	66	9	228
10348	27	56	5	3
10356	27	38	4	167
10364	22	42	4	5
10372	15	22	7	1
10380	11	10	9	228
10388	10	51	2	212
10396	21	8	4	55
10404	12	51	4	6
10412	6	14	6	4
10420	13	28	4	7
10428	28	40	12	92
10436	10	52	7	1
10444	20	45	4	6
10452	12	52	10	154
10460	7	49	6	4
10468	9	28	3	99
10476	13	10	4	7
10484	27	25	5	3
10492	24	28	4	6
10500	26	3	7	2
10508	15	60	4	7
10516	13	3	9	228
10524	4	36	4	110
10532	5	17	4	193
10540	21	70	9	228
10548	10	6	4	7
10556	7	49	9	228
10564	21	11	6	4
10572	19	55	12	159
10580	17	36	4	30
10588	27	24	7	2
10596	3	18	6	4
10604	6	42	12	108
10612	26	14	4	5
10620	14	57	3	18
10628	17	44	4	7
10636	9	18	5	3
10644	6	50	4	5
10652	14	38	4	128
10660	23	56	3	215
10668	13	53	7	2
10676	21	54	7	1
10684	13	33	3	105
10692	25	66	4	6
10700	16	23	7	1
10708	17	34	7	1
10716	18	56	4	6
10724	13	61	9	228
10732	6	32	4	5
10740	24	28	7	1
10748	21	38	5	3
10756	28	63	11	90
10764	12	45	3	222
10772	7	46	5	3
10780	17	56	3	208
10788	2	45	5	3
10796	14	73	7	1
10804	14	67	4	7
10812	15	11	3	24
10820	22	2	4	5
10828	5	56	12	174
10836	25	57	4	5
10844	11	55	3	159
10852	18	47	7	2
10860	3	42	12	108
10868	26	54	4	5
10876	7	4	7	1
10884	23	51	10	54
10892	2	32	5	3
10900	10	25	4	5
10908	28	74	3	135
10916	2	21	4	7
10924	26	31	6	206
10932	4	39	7	2
10940	15	23	9	228
10948	10	17	4	7
10956	28	28	4	7
10964	4	56	12	196
10972	7	53	4	7
10980	15	16	4	7
10988	23	16	4	7
10996	27	31	6	4
11004	18	32	9	228
11012	26	56	3	223
11020	4	55	7	1
11028	14	53	4	7
11036	22	45	12	216
11044	14	13	4	115
11052	10	32	9	228
11060	6	12	4	5
11068	3	46	4	7
11076	3	63	11	126
11084	25	68	6	4
11092	15	19	7	1
11100	5	48	4	6
11108	15	24	6	4
11116	16	58	7	2
11124	18	50	9	228
11132	16	51	6	4
11140	23	24	4	6
11148	14	54	3	221
11156	16	38	4	128
11164	11	27	4	7
11172	3	42	6	4
11180	17	55	9	228
11188	3	26	7	1
11196	8	11	3	24
11204	10	53	4	5
11212	22	12	7	2
11220	3	70	4	5
11228	27	5	4	199
11236	13	31	3	162
11244	28	64	3	14
11252	24	63	4	5
11260	12	67	4	5
11268	11	30	5	3
11276	17	47	4	6
11284	5	73	4	7
11292	17	66	3	86
11300	5	13	4	7
11308	8	65	4	6
10059	7	46	4	211
10067	15	29	4	5
10075	17	56	4	172
10083	15	38	4	5
10091	17	47	5	3
10099	18	58	5	3
10107	11	70	7	2
10115	11	29	4	7
10123	17	15	4	25
10131	9	67	4	6
10139	20	56	12	208
10147	27	49	9	228
10155	20	68	9	228
10163	20	46	6	4
10171	21	71	4	5
10179	8	32	7	2
10187	3	24	4	112
10195	4	22	3	73
10203	18	5	7	1
10211	3	11	3	132
10219	22	44	4	6
10227	8	12	3	87
10235	13	56	3	215
10243	21	40	7	1
10251	13	17	4	160
10259	16	54	4	7
10267	16	25	5	3
10275	28	23	4	164
10283	15	23	3	137
10291	11	18	4	103
10299	23	27	4	7
10307	27	16	6	4
10315	17	17	9	228
10323	8	66	4	6
10331	10	18	4	160
10339	15	52	3	95
10347	20	10	3	178
10355	6	33	3	71
10363	18	43	4	59
10371	23	6	5	3
10379	2	30	6	4
10387	4	51	2	212
10395	19	59	4	6
10403	28	5	3	143
10411	9	31	4	6
10419	14	1	4	6
10427	12	38	4	7
10435	4	52	7	1
10443	24	72	4	7
10451	18	47	6	4
10459	24	44	9	228
10467	24	57	7	2
10475	21	44	3	130
10483	9	53	4	198
10491	3	19	4	5
10499	13	29	5	3
10507	26	29	6	207
10515	18	7	4	131
10523	16	58	9	228
10531	16	39	9	228
10539	4	74	4	6
10547	11	38	7	2
10555	11	43	4	7
10563	15	21	4	142
10571	18	20	7	1
10579	25	14	5	3
10587	26	25	5	3
10595	16	72	4	7
10603	16	50	4	7
10611	14	46	4	211
10619	25	7	4	131
10627	13	22	4	6
10635	8	69	6	4
10643	28	2	7	2
10651	14	33	4	6
10659	11	48	4	6
10667	17	65	4	5
10675	14	10	9	228
10683	21	35	4	7
10691	19	26	4	31
10699	16	40	13	78
10707	17	25	4	7
10715	9	37	5	3
10723	8	55	4	80
10731	27	1	4	6
10739	11	68	4	7
10747	3	12	6	4
10755	7	61	6	4
10763	4	8	4	5
10771	5	23	3	137
10779	12	61	4	7
10787	7	16	3	57
10795	11	50	5	3
10803	18	14	9	228
10811	7	43	9	228
10819	20	51	4	6
10827	12	18	4	103
10835	9	52	7	1
10843	14	12	4	141
10851	19	34	4	7
10859	16	53	3	203
10867	20	74	7	2
10875	2	17	4	133
10883	17	10	4	7
10891	15	73	4	7
10899	24	13	4	115
10907	20	49	4	5
10915	2	53	3	203
10923	17	56	12	122
10931	22	67	4	62
10939	14	5	7	1
10947	19	52	7	1
10955	3	44	6	4
10963	6	10	4	7
10971	28	74	3	100
10979	14	21	6	4
10987	27	72	4	5
10995	12	46	4	222
11003	2	72	4	7
11011	25	11	4	7
11019	15	7	4	23
11027	21	18	4	160
11035	26	11	3	132
11043	23	9	12	111
11051	27	67	4	41
11059	8	7	9	228
11067	9	40	5	3
11075	10	60	4	6
11083	13	6	4	5
11091	20	23	3	137
11099	16	4	3	20
11107	18	19	4	5
11115	11	29	6	207
11123	25	26	4	31
11131	28	31	5	3
11139	5	66	6	4
11147	7	54	9	228
11155	4	32	4	6
11163	17	74	9	228
11171	9	56	3	215
11179	28	54	5	3
11187	26	62	6	4
11195	14	58	4	7
11203	19	20	5	3
11211	21	5	4	199
11219	26	57	7	1
11227	4	41	4	7
11235	9	38	4	94
11243	5	22	9	228
11251	14	10	7	1
11259	25	55	4	5
11267	26	27	3	149
11275	19	25	7	1
11283	20	17	7	1
11291	17	39	3	22
11299	4	34	5	3
11307	27	33	6	4
10485	22	43	9	228
10493	2	2	4	6
10501	4	28	7	1
10509	21	19	3	76
10517	3	69	9	228
10525	9	68	4	61
10533	22	21	6	4
10541	4	25	7	2
10549	22	65	3	188
10557	3	59	4	5
10565	17	68	4	61
10573	25	55	12	159
10581	15	57	4	5
10589	15	8	7	1
10597	27	73	4	6
10605	3	34	7	1
10613	14	18	4	103
10621	26	56	12	122
10629	16	2	7	1
10637	16	69	6	4
10645	16	8	6	4
10653	24	59	4	5
10661	17	36	7	2
10669	6	61	7	2
10677	7	45	4	6
10685	6	43	7	2
10693	24	6	7	2
10701	22	22	3	8
10709	8	6	3	120
10717	22	61	3	9
10725	24	25	7	2
10733	9	36	7	2
10741	6	41	7	1
10749	27	11	5	3
10757	7	35	4	7
10765	8	7	4	102
10773	2	17	4	32
10781	27	52	4	95
10789	4	69	5	3
10797	28	63	7	2
10805	9	69	6	4
10813	27	67	4	62
10821	23	27	7	2
10829	9	13	4	6
10837	20	46	3	229
10845	26	56	9	228
10853	11	19	7	1
10861	11	70	4	6
10869	25	62	4	5
10877	27	69	7	1
10885	25	52	10	154
10893	7	12	7	1
10901	16	40	4	5
10909	8	13	7	1
10917	25	29	3	161
10925	25	31	7	1
10933	21	6	4	7
10941	17	12	6	4
10949	27	56	12	214
10957	12	4	4	5
10965	2	32	7	2
10973	3	56	4	172
10981	14	54	4	6
10989	27	41	7	1
10997	28	15	7	1
11005	8	8	5	3
11013	18	44	5	3
11021	18	11	7	2
11029	23	47	7	1
11037	11	53	3	203
11045	17	2	4	6
11053	3	40	9	228
11061	22	70	9	228
11069	9	58	9	228
11077	9	63	11	126
11085	15	20	7	2
11093	10	60	11	169
11101	4	16	4	6
11109	5	7	4	131
11117	20	25	5	3
11125	21	35	7	2
11133	14	67	7	2
11141	22	39	4	7
11149	3	60	4	7
11157	14	31	3	162
11165	3	3	4	5
11173	5	62	7	2
11181	15	33	4	5
11189	5	34	5	3
11197	25	5	3	143
11205	10	47	4	38
11213	28	31	6	206
11221	5	35	4	5
11229	26	45	7	2
11237	4	39	4	6
11245	16	55	4	7
11253	7	19	4	7
11261	23	7	9	228
11269	16	67	6	4
11277	5	48	9	228
11285	10	34	6	4
11293	3	63	5	3
11301	22	10	7	1
11309	5	50	4	6
11317	13	54	9	228
11325	13	37	4	30
11333	27	27	12	163
11341	9	34	9	228
11349	24	57	4	7
11357	16	31	6	206
11365	18	71	5	3
11373	6	1	8	148
11381	17	71	4	7
11389	20	39	4	5
11397	25	38	4	7
11405	24	44	6	4
11413	22	10	9	228
11421	28	59	7	1
11429	8	24	4	181
11437	3	14	7	1
11445	7	54	10	221
11453	21	70	4	6
11461	26	15	5	3
11469	14	16	9	228
11477	2	34	7	1
11485	26	3	4	157
11493	17	64	9	228
11501	17	54	4	7
11509	22	12	4	141
11517	9	5	7	1
11525	22	59	4	7
11533	2	39	3	22
11541	25	12	7	1
11549	13	53	4	176
11557	26	1	7	1
11565	4	14	9	228
11573	24	26	4	5
11581	22	23	7	2
11589	26	35	4	7
11597	22	38	4	19
11605	22	18	4	160
11613	11	23	3	137
11621	9	64	7	2
11629	19	29	7	2
11637	23	68	4	5
11645	13	31	4	7
11653	8	61	4	52
11661	4	38	7	2
11669	23	28	7	2
11677	25	25	4	33
11685	4	60	7	1
11693	15	74	5	3
11701	11	20	4	7
11709	3	34	4	6
11717	15	56	6	4
11725	21	45	3	229
11733	27	41	13	109
10849	20	49	4	45
10857	24	5	3	171
10865	5	42	7	2
10873	11	28	7	2
10881	25	34	4	7
10889	23	67	4	5
10897	26	20	4	7
10905	21	21	4	5
10913	21	20	9	228
10921	10	47	7	2
10929	25	65	3	125
10937	2	49	3	151
10945	10	37	4	5
10953	14	63	11	90
10961	15	35	5	3
10969	24	37	4	5
10977	2	69	9	228
10985	18	34	4	6
10993	6	56	12	122
11001	24	47	4	5
11009	23	69	7	1
11017	13	19	3	76
11025	13	4	4	5
11033	26	1	8	148
11041	4	36	4	7
11049	28	44	3	130
11057	22	36	4	5
11065	13	21	6	4
11073	6	11	6	4
11081	17	25	4	67
11089	23	19	7	1
11097	21	23	4	7
11105	5	50	5	3
11113	28	65	7	1
11121	24	53	4	198
11129	17	63	11	126
11137	25	1	8	148
11145	14	52	4	5
11153	8	38	4	128
11161	23	51	6	4
11169	12	65	4	7
11177	4	28	3	161
11185	3	69	4	6
11193	16	49	4	85
11201	4	17	4	180
11209	14	19	3	12
11217	4	47	4	38
11225	25	64	7	1
11233	27	4	4	121
11241	25	45	3	226
11249	9	2	6	4
11257	12	1	9	228
11265	24	14	7	1
11273	8	33	3	71
11281	10	58	4	6
11289	18	63	4	5
11297	25	63	4	48
11305	12	33	7	2
11313	15	74	3	16
11321	28	51	4	7
11329	26	22	5	3
11337	24	21	4	5
11345	12	5	12	84
11353	27	53	4	176
11361	11	8	4	28
11369	16	41	4	5
11377	20	58	4	5
11385	27	38	4	19
11393	23	56	12	174
11401	8	42	4	6
11409	4	25	4	67
11417	5	64	5	3
11425	7	14	4	7
11433	4	25	5	3
11441	10	25	9	228
11449	21	18	4	103
11457	17	10	3	220
11465	27	54	4	5
11473	23	69	7	2
11481	22	27	3	149
11489	2	44	4	5
11497	25	16	3	57
11505	20	56	12	174
11513	18	6	4	6
11521	7	41	13	109
11529	13	66	4	47
11537	14	68	4	6
11545	22	15	4	25
11553	13	2	4	7
11561	9	45	4	5
11569	19	66	4	6
11577	10	50	6	4
11585	19	29	6	207
11593	15	28	7	2
11601	7	63	7	2
11609	25	29	6	207
11617	21	36	4	5
11625	28	15	4	6
11633	10	7	4	131
11641	2	69	4	50
11649	3	33	4	5
11657	14	3	12	189
11665	7	24	4	7
11673	19	30	7	1
11681	9	6	4	7
11689	7	36	4	5
11697	19	11	3	24
11705	24	28	6	4
11713	15	49	10	224
11721	10	46	7	1
11729	17	58	4	5
11737	16	74	7	1
11745	24	61	5	3
11753	22	41	4	5
11761	11	53	4	5
11769	4	1	4	7
11777	15	41	4	11
11785	10	66	9	228
11793	2	28	4	7
11801	16	69	7	1
11809	22	51	7	2
11817	3	63	6	4
11825	14	14	3	57
11833	23	74	3	16
11841	6	55	4	5
11849	12	48	4	5
11857	7	11	7	1
11865	17	48	7	2
11873	17	60	7	2
11881	5	66	5	3
11889	21	43	7	2
11897	22	5	3	119
11905	26	27	3	53
11913	25	12	3	15
11921	15	48	7	1
11929	16	19	6	4
11937	17	23	4	164
11945	27	40	13	78
11953	22	51	2	212
11961	23	19	9	228
11969	26	18	4	160
11977	2	53	4	7
11985	11	2	4	7
11993	14	59	4	7
12001	5	21	4	5
12009	2	45	7	1
12017	12	7	9	228
12025	17	24	3	137
12033	22	51	4	44
12041	7	51	10	54
12049	19	52	7	2
12057	3	72	3	118
12065	9	17	7	2
12073	2	44	3	130
12081	23	5	9	228
12089	9	62	9	228
12097	28	52	4	145
11310	18	48	9	228
11318	7	63	3	90
11326	11	13	6	4
11334	11	52	6	4
11342	19	72	5	3
11350	12	21	4	7
11358	15	30	7	2
11366	5	32	3	75
11374	28	28	12	194
11382	16	31	4	6
11390	13	1	7	1
11398	15	70	5	3
11406	21	51	2	212
11414	9	16	4	6
11422	6	29	6	207
11430	18	66	4	6
11438	16	32	9	228
11446	15	30	3	162
11454	10	17	4	133
11462	17	61	3	9
11470	17	28	7	2
11478	20	15	9	228
11486	27	9	12	111
11494	13	24	9	228
11502	14	56	3	215
11510	2	56	4	46
11518	15	48	9	228
11526	3	10	3	220
11534	17	53	4	176
11542	13	52	6	4
11550	23	61	5	3
11558	10	44	6	4
11566	23	10	3	178
11574	23	34	7	2
11582	8	45	4	211
11590	14	3	5	3
11598	3	45	4	5
11606	18	29	7	2
11614	16	35	4	6
11622	12	23	3	137
11630	25	72	5	3
11638	24	55	12	159
11646	6	6	6	4
11654	10	64	4	7
11662	9	14	4	7
11670	15	35	6	4
11678	19	23	3	137
11686	25	52	4	6
11694	15	37	4	30
11702	20	49	5	3
11710	5	56	12	122
11718	3	25	4	33
11726	28	56	9	228
11734	25	13	7	2
11742	22	18	7	1
11750	25	45	7	2
11758	3	2	6	4
11766	28	37	3	195
11774	13	60	4	5
11782	16	8	7	1
11790	9	44	3	179
11798	21	65	7	2
11806	16	21	5	3
11814	18	62	4	7
11822	8	74	7	2
11830	5	55	5	3
11838	5	27	3	123
11846	25	40	4	78
11854	3	43	4	5
11862	11	28	3	138
11870	26	6	7	1
11878	11	35	4	134
11886	23	50	4	7
11894	23	44	4	5
11902	12	45	3	216
11910	21	2	7	1
11918	12	19	4	5
11926	22	40	5	3
11934	14	55	4	10
11942	25	36	4	30
11950	25	1	8	124
11958	14	34	9	228
11966	20	47	7	2
11974	4	6	4	49
11982	10	57	9	228
11990	10	20	4	7
11998	2	32	6	4
12006	17	72	3	118
12014	19	63	3	90
12022	5	24	4	7
12030	16	70	4	5
12038	3	30	6	4
12046	23	37	3	195
12054	2	4	4	5
12062	14	58	4	6
12070	16	22	7	2
12078	5	67	5	3
12086	15	5	9	228
12094	26	47	4	7
12102	22	34	6	4
12110	16	5	7	1
12118	28	8	4	55
12126	17	11	4	5
12134	7	27	3	149
12142	22	74	9	228
12150	28	50	3	202
12158	21	41	13	109
12166	13	23	7	1
12174	3	50	6	4
12182	13	31	7	1
12190	23	13	5	3
12198	24	29	4	5
12206	5	63	3	90
12214	24	60	7	2
12222	20	24	7	2
12230	25	45	4	230
12238	24	57	9	228
12246	3	5	3	171
12254	19	22	5	3
12262	12	54	10	221
12270	5	49	7	2
12278	8	53	4	7
12286	9	65	3	150
12294	8	10	3	220
12302	26	10	9	228
12310	9	62	4	7
12318	14	7	4	65
12326	5	69	7	1
12334	14	49	4	45
12342	5	67	6	4
12350	5	45	3	200
12358	23	70	4	98
12366	16	7	4	5
12374	25	46	3	201
12382	22	42	7	1
12390	10	74	4	5
12398	2	29	4	6
12406	24	22	7	1
12414	23	45	3	225
12422	21	53	3	203
12430	14	24	4	112
12438	28	35	4	7
12446	16	71	9	228
12454	2	74	9	228
12462	9	38	4	7
12470	7	23	12	137
12478	20	4	5	3
12486	6	8	4	7
12494	13	42	7	1
12502	10	25	7	1
12510	24	23	4	164
12518	8	74	3	135
12526	21	31	3	161
12534	8	3	7	1
12542	5	28	3	99
12550	3	1	4	7
12558	16	24	5	3
11741	20	27	3	123
11749	8	51	2	212
11757	8	54	4	218
11765	2	65	3	188
11773	25	5	12	177
11781	18	73	3	34
11789	14	59	6	4
11797	11	28	3	161
11805	3	20	4	7
11813	19	49	10	170
11821	2	52	10	154
11829	4	50	3	185
11837	7	3	7	1
11845	25	49	10	170
11853	20	52	4	145
11861	9	8	4	55
11869	9	39	3	22
11877	23	28	3	99
11885	26	1	6	4
11893	8	47	4	5
11901	9	51	4	7
11909	2	19	4	7
11917	28	53	7	2
11925	4	31	4	7
11933	3	10	3	190
11941	7	8	5	3
11949	10	7	2	186
11957	26	31	3	162
11965	22	63	4	6
11973	15	39	5	3
11981	8	62	4	127
11989	13	74	4	7
11997	27	28	3	184
12005	20	67	5	3
12013	12	5	3	40
12021	18	22	9	228
12029	10	55	4	5
12037	2	56	7	1
12045	17	50	5	3
12053	9	68	4	5
12061	8	13	4	115
12069	12	39	7	2
12077	23	68	4	6
12085	8	30	4	7
12093	12	47	9	228
12101	9	3	12	189
12109	6	56	3	223
12117	13	10	3	178
12125	2	62	4	127
12133	8	62	7	2
12141	24	15	4	7
12149	14	39	6	4
12157	23	45	4	222
12165	20	27	7	2
12173	19	56	12	82
12181	22	23	7	1
12189	17	34	4	29
12197	2	38	4	94
12205	23	12	7	2
12213	14	45	6	4
12221	6	27	3	123
12229	3	32	12	106
12237	26	7	9	228
12245	24	55	4	5
12253	28	63	4	6
12261	24	46	4	6
12269	18	58	4	5
12277	12	28	5	3
12285	11	21	4	5
12293	19	73	7	1
12301	13	55	3	159
12309	4	52	10	154
12317	11	22	5	3
12325	6	7	9	228
12333	18	17	4	7
12341	19	21	4	5
12349	18	57	6	4
12357	17	59	7	1
12365	2	19	9	228
12373	3	37	6	4
12381	28	18	5	3
12389	6	18	4	7
12397	27	8	9	228
12405	18	22	7	1
12413	16	37	4	7
12421	8	59	4	136
12429	22	35	3	166
12437	27	65	5	3
12445	26	73	5	3
12453	20	15	4	6
12461	3	17	4	103
12469	2	23	4	112
12477	26	8	9	228
12485	3	55	4	6
12493	7	63	11	90
12501	19	73	6	4
12509	7	21	7	2
12517	20	1	4	5
12525	25	63	7	2
12533	6	29	4	7
12541	18	42	4	5
12549	10	33	4	7
12557	17	16	5	3
12565	21	52	7	1
12573	11	27	12	191
12581	5	61	4	5
12589	10	37	7	1
12597	9	25	9	228
12605	28	2	9	228
12613	23	66	3	86
12621	3	26	4	31
12629	21	52	6	4
12637	3	32	5	3
12645	22	48	7	2
12653	17	29	5	3
12661	22	73	3	34
12669	24	1	8	88
12677	13	63	11	126
12685	28	6	3	63
12693	14	9	4	7
12701	21	5	4	7
12709	2	5	7	1
12717	26	57	4	5
12725	6	51	7	1
12733	28	56	5	3
12741	19	42	4	7
12749	4	56	3	223
12757	12	21	4	5
12765	26	5	3	177
12773	15	50	3	202
12781	28	14	4	7
12789	15	65	12	188
12797	8	19	3	76
12805	11	24	7	2
12813	9	8	4	5
12821	2	68	5	3
12829	13	22	4	5
12837	7	65	3	125
12845	23	46	7	2
12853	24	59	4	6
12861	4	57	4	7
12869	25	18	4	180
12877	15	50	3	185
12885	10	49	4	7
12893	16	27	4	6
12901	16	34	4	29
12909	4	46	3	231
12917	23	29	7	1
12925	15	3	4	6
12933	2	40	4	39
12941	23	50	10	202
12949	21	63	11	126
12957	23	32	7	1
12965	21	54	10	221
12973	19	64	4	5
12981	22	46	3	216
12989	15	56	3	208
11312	3	2	5	3
11320	6	41	9	228
11328	20	62	5	3
11336	4	74	5	3
11344	21	24	4	7
11352	8	4	7	2
11360	4	15	4	5
11368	14	22	3	8
11376	20	14	4	25
11384	10	17	4	193
11392	9	74	7	1
11400	10	46	7	2
11408	2	47	9	228
11416	17	27	4	5
11424	19	21	4	168
11432	21	53	4	5
11440	3	63	4	5
11448	7	10	5	3
11456	24	41	7	1
11464	27	7	9	228
11472	19	60	4	7
11480	8	61	6	4
11488	23	24	4	5
11496	7	45	3	229
11504	9	24	3	137
11512	7	62	4	5
11520	3	24	4	181
11528	17	35	6	4
11536	8	52	3	154
11544	12	67	5	3
11552	26	46	12	229
11560	15	65	3	125
11568	13	13	7	1
11576	6	11	3	132
11584	13	3	6	4
11592	4	57	7	2
11600	7	48	4	81
11608	7	14	4	25
11616	10	32	3	75
11624	4	10	3	220
11632	16	37	5	3
11640	9	23	4	6
11648	27	32	4	5
11656	17	56	3	122
11664	6	35	3	166
11672	28	67	4	7
11680	2	25	3	183
11688	24	36	6	4
11696	11	57	5	3
11704	23	37	4	7
11712	26	67	4	62
11720	20	52	4	7
11728	15	6	3	63
11736	5	20	4	7
11744	3	13	4	115
11752	4	28	3	138
11760	11	13	9	228
11768	2	65	7	1
11776	11	33	4	7
11784	24	46	3	222
11792	25	28	3	184
11800	25	63	4	5
11808	4	45	3	200
11816	12	62	9	228
11824	20	45	3	229
11832	16	66	7	2
11840	8	66	7	2
11848	8	43	5	3
11856	7	52	4	145
11864	5	36	7	1
11872	18	45	3	200
11880	25	30	6	4
11888	13	43	7	2
11896	16	17	4	160
11904	13	26	5	3
11912	28	43	4	7
11920	10	46	12	229
11928	25	45	4	5
11936	18	2	12	175
11944	8	74	9	228
11952	25	44	6	4
11960	8	55	6	4
11968	8	39	7	1
11976	9	66	4	6
11984	17	5	7	1
11992	15	29	4	6
12000	20	5	12	171
12008	5	35	5	3
12016	23	12	4	7
12024	5	22	5	3
12032	10	24	3	137
12040	11	69	7	1
12048	17	48	4	6
12056	11	67	6	4
12064	6	60	6	4
12072	26	20	9	228
12080	4	15	7	2
12088	24	46	3	231
12096	4	57	9	228
12104	19	27	12	191
12112	9	37	7	1
12120	27	74	4	7
12128	15	12	4	7
12136	10	39	3	74
12144	22	14	4	7
12152	21	39	9	228
12160	26	18	4	103
12168	27	42	9	228
12176	25	38	7	1
12184	28	18	4	6
12192	28	6	4	7
12200	3	35	9	228
12208	24	25	6	4
12216	2	55	9	228
12224	24	35	5	3
12232	7	2	9	228
12240	14	14	7	2
12248	28	23	7	1
12256	16	38	4	94
12264	27	57	3	18
12272	14	49	10	224
12280	2	45	3	231
12288	23	42	5	3
12296	28	13	6	4
12304	28	54	4	5
12312	15	40	4	6
12320	22	35	4	77
12328	4	37	4	6
12336	28	9	7	2
12344	27	56	4	7
12352	27	39	6	4
12360	12	44	4	192
12368	7	38	4	128
12376	15	26	4	5
12384	21	44	5	3
12392	23	56	4	6
12400	26	63	3	126
12408	9	46	3	232
12416	6	73	9	228
12424	15	31	4	5
12432	21	26	6	4
12440	10	56	4	5
12448	24	12	6	4
12456	7	18	7	2
12464	16	10	3	210
12472	26	54	7	1
12480	3	61	4	6
12488	15	28	3	17
12496	28	2	7	1
12504	16	40	7	1
12512	15	32	5	3
12520	13	40	6	4
12528	19	42	4	51
12536	23	45	7	1
12544	6	8	6	4
12552	28	52	4	6
12560	27	36	6	4
11315	23	44	7	2
11323	13	59	6	4
11331	4	62	4	7
11339	5	9	9	228
11347	18	7	4	5
11355	8	63	11	126
11363	12	50	4	5
11371	16	6	3	120
11379	23	23	6	4
11387	14	63	7	2
11395	12	10	7	2
11403	5	72	5	3
11411	14	56	3	146
11419	18	45	3	216
11427	26	46	3	200
11435	16	23	3	164
11443	16	55	5	3
11451	7	45	7	2
11459	4	46	7	1
11467	18	28	9	228
11475	9	36	4	5
11483	16	21	6	4
11491	22	6	4	7
11499	16	61	9	228
11507	8	29	3	161
11515	26	28	3	138
11523	12	5	12	171
11531	6	33	7	1
11539	2	24	4	112
11547	24	56	3	82
11555	18	56	7	1
11563	2	40	13	78
11571	15	34	7	2
11579	9	32	9	228
11587	18	12	5	3
11595	25	69	4	5
11603	8	59	5	3
11611	4	19	4	5
11619	7	27	4	6
11627	2	63	11	126
11635	14	55	7	2
11643	24	56	7	1
11651	11	57	4	7
11659	27	73	7	1
11667	3	18	5	3
11675	12	54	4	209
11683	9	18	9	228
11691	21	54	4	5
11699	18	9	4	6
11707	13	7	5	3
11715	23	40	4	6
11723	8	28	3	17
11731	11	17	5	3
11739	13	65	3	188
11747	23	74	3	135
11755	9	43	3	21
11763	18	10	3	190
11771	9	12	4	6
11779	9	24	5	3
11787	22	59	6	4
11795	9	48	7	2
11803	6	46	4	6
11811	12	13	6	4
11819	28	40	7	2
11827	10	55	6	4
11835	10	9	4	7
11843	28	1	4	5
11851	10	24	4	5
11859	26	19	4	7
11867	6	45	4	7
11875	15	68	4	61
11883	21	27	9	228
11891	20	46	4	211
11899	26	73	6	4
11907	8	6	3	63
11915	28	24	4	6
11923	3	14	9	228
11931	20	60	11	169
11939	24	6	6	4
11947	14	74	3	16
11955	7	8	4	6
11963	23	69	4	50
11971	7	46	4	227
11979	22	41	13	109
11987	9	35	6	4
11995	2	19	3	76
12003	16	13	4	115
12011	24	43	4	5
12019	6	15	5	3
12027	20	10	9	228
12035	13	70	4	6
12043	17	52	10	154
12051	18	20	4	7
12059	12	4	4	6
12067	10	53	5	3
12075	15	68	4	6
12083	16	30	4	7
12091	10	35	6	4
12099	21	29	3	162
12107	28	33	4	35
12115	27	16	4	7
12123	22	23	4	112
12131	6	31	4	6
12139	14	74	9	228
12147	17	62	4	7
12155	17	66	4	6
12163	20	54	5	3
12171	11	62	5	3
12179	18	55	4	5
12187	28	5	4	199
12195	15	19	6	4
12203	15	72	7	1
12211	4	20	7	2
12219	4	49	4	7
12227	21	67	4	5
12235	24	30	5	3
12243	22	46	3	229
12251	13	65	3	125
12259	28	14	7	2
12267	26	56	3	146
12275	11	1	7	1
12283	26	5	3	40
12291	20	47	6	4
12299	10	35	5	3
12307	26	39	7	2
12315	28	45	9	228
12323	3	53	9	228
12331	9	61	3	9
12339	5	43	4	5
12347	27	56	12	174
12355	3	47	4	38
12363	22	29	6	4
12371	9	69	4	7
12379	6	10	7	1
12387	20	60	4	6
12395	9	14	5	3
12403	12	46	4	5
12411	27	18	4	133
12419	27	7	7	1
12427	23	62	4	127
12435	19	1	5	3
12443	17	3	7	1
12451	9	55	12	159
12459	16	58	7	1
12467	9	17	4	160
12475	9	10	3	210
12483	25	4	9	228
12491	2	17	4	160
12499	4	4	7	2
12507	17	56	5	3
12515	24	41	9	228
12523	13	55	4	7
12531	19	53	4	198
12539	12	20	7	1
12547	21	1	4	5
12555	15	19	3	76
12563	27	32	4	7
11314	3	30	4	7
11322	12	27	9	228
11330	12	19	7	2
11338	5	33	4	7
11346	20	22	4	6
11354	22	56	3	146
11362	7	9	6	129
11370	27	22	4	6
11378	11	71	5	3
11386	2	10	7	1
11394	25	23	3	137
11402	24	71	5	3
11410	3	28	4	6
11418	24	45	3	216
11426	5	62	5	3
11434	13	53	4	5
11442	3	29	3	161
11450	23	27	12	163
11458	28	50	10	202
11466	11	52	7	2
11474	28	19	4	7
11482	14	37	7	2
11490	15	51	7	2
11498	24	60	3	169
11506	22	23	4	6
11514	4	68	4	5
11522	17	36	4	5
11530	10	68	4	5
11538	13	56	7	2
11546	3	23	4	6
11554	22	61	6	4
11562	6	53	3	203
11570	24	56	4	46
11578	17	39	6	4
11586	5	43	7	2
11594	19	69	4	5
11602	13	27	4	6
11610	6	45	3	222
11618	16	19	5	3
11626	15	46	3	216
11634	5	64	9	228
11642	28	61	6	4
11650	4	50	6	4
11658	9	28	4	6
11666	20	53	3	203
11674	7	53	4	176
11682	11	21	7	2
11690	13	46	4	5
11698	25	41	4	6
11706	14	45	4	7
11714	22	63	7	1
11722	12	22	4	5
11730	5	30	4	5
11738	12	28	3	161
11746	17	72	3	72
11754	12	70	4	60
11762	20	52	3	95
11770	12	17	4	103
11778	5	15	7	2
11786	18	4	4	6
11794	25	51	10	54
11802	25	18	4	32
11810	21	59	7	2
11818	19	35	4	134
11826	12	52	3	95
11834	6	35	4	77
11842	4	73	3	34
11850	6	17	4	103
11858	24	5	12	171
11866	8	35	5	3
11874	22	39	7	2
11882	12	25	7	1
11890	13	63	11	90
11898	26	70	5	3
11906	26	64	3	14
11914	21	51	4	5
11922	2	41	4	7
11930	13	25	3	183
11938	7	5	12	84
11946	3	48	9	228
11954	3	56	3	174
11962	15	69	4	50
11970	3	28	12	194
11978	13	52	9	228
11986	4	21	4	142
11994	7	67	4	5
12002	21	5	12	177
12010	28	60	4	5
12018	6	45	4	230
12026	14	5	4	199
12034	14	56	9	228
12042	13	51	10	54
12050	15	69	7	2
12058	8	35	7	2
12066	6	44	7	1
12074	11	42	12	108
12082	25	60	3	169
12090	14	48	4	7
12098	18	37	4	6
12106	11	51	4	6
12114	3	57	7	2
12122	10	56	3	174
12130	17	45	4	6
12138	12	20	9	228
12146	21	71	7	2
12154	11	56	12	208
12162	9	72	3	72
12170	25	11	3	24
12178	14	47	5	3
12186	19	58	4	114
12194	19	16	3	57
12202	25	58	4	114
12210	20	73	7	1
12218	21	10	5	3
12226	16	45	3	231
12234	22	16	6	4
12242	25	15	9	228
12250	6	67	4	62
12258	6	13	4	7
12266	14	13	6	4
12274	28	58	4	6
12282	23	11	7	1
12290	15	42	5	3
12298	25	42	12	108
12306	7	35	4	134
12314	16	19	3	76
12322	21	65	3	125
12330	12	56	7	2
12338	24	41	4	6
12346	3	17	7	2
12354	8	14	4	6
12362	16	20	4	5
12370	26	57	4	6
12378	24	59	5	3
12386	2	59	4	7
12394	27	12	3	87
12402	23	24	4	181
12410	22	55	4	10
12418	22	11	3	132
12426	27	63	9	228
12434	26	12	3	15
12442	22	11	6	4
12450	21	45	3	216
12458	12	1	4	5
12466	17	14	6	4
12474	21	65	5	3
12482	12	8	4	93
12490	4	10	3	153
12498	11	28	4	6
12506	17	18	4	32
12514	17	40	4	78
12522	28	39	4	6
12530	21	23	12	137
12538	18	61	4	52
12546	28	25	3	183
12554	25	46	12	229
12562	14	25	7	2
11311	24	13	7	2
11319	23	63	7	1
11327	9	3	4	5
11335	23	47	9	228
11343	15	57	3	18
11351	28	3	12	189
11359	24	56	4	172
11367	5	69	4	5
11375	2	8	6	4
11383	22	49	6	4
11391	24	8	4	5
11399	21	53	7	2
11407	20	21	4	7
11415	25	56	3	174
11423	14	45	4	222
11431	14	63	11	126
11439	9	74	4	6
11447	18	25	9	228
11455	23	34	9	228
11463	6	56	12	174
11471	2	43	6	4
11479	7	31	6	206
11487	26	13	4	7
11495	20	56	4	7
11503	8	71	7	1
11511	10	67	6	4
11519	24	72	4	5
11527	15	59	9	228
11535	2	52	3	154
11543	17	67	7	2
11551	21	53	4	176
11559	18	44	6	4
11567	15	37	7	1
11575	2	31	4	6
11583	27	9	6	129
11591	10	26	4	5
11599	12	53	3	203
11607	10	8	4	5
11615	19	51	4	5
11623	25	30	7	1
11631	20	1	7	1
11639	6	57	9	228
11647	15	55	4	7
11655	3	6	3	120
11663	23	54	4	218
11671	15	49	2	217
11679	2	18	4	133
11687	24	38	4	64
11695	13	54	4	5
11703	10	63	4	48
11711	15	46	3	232
11719	27	65	4	6
11727	9	9	7	1
11735	27	56	3	146
11743	21	26	7	1
11751	13	59	9	228
11759	18	21	4	5
11767	22	37	3	195
11775	24	20	6	4
11783	5	5	12	171
11791	17	50	3	202
11799	19	47	4	38
11807	6	22	6	4
11815	7	22	5	3
11823	16	57	4	5
11831	11	55	5	3
11839	26	8	7	2
11847	23	19	3	12
11855	5	67	4	5
11863	19	28	3	161
11871	17	66	4	47
11879	6	48	5	3
11887	25	52	9	228
11895	6	17	4	6
11903	23	61	6	4
11911	14	24	4	6
11919	28	36	5	3
11927	20	41	4	5
11935	18	6	5	3
11943	12	15	7	1
11951	3	69	7	2
11959	13	28	3	184
11967	2	74	3	16
11975	10	51	4	6
11983	3	58	5	3
11991	9	32	12	106
11999	4	9	7	1
12007	7	16	7	2
12015	19	28	9	228
12023	17	56	3	174
12031	3	28	7	2
12039	12	10	9	228
12047	13	65	4	6
12055	24	9	7	1
12063	9	57	4	7
12071	5	54	6	4
12079	7	45	3	226
12087	3	8	4	28
12095	12	5	3	143
12103	5	18	4	180
12111	13	56	12	174
12119	22	66	7	2
12127	5	15	6	4
12135	23	37	7	2
12143	7	46	4	230
12151	9	35	9	228
12159	17	14	7	1
12167	24	62	9	228
12175	14	6	3	120
12183	18	60	3	169
12191	12	52	4	7
12199	19	4	4	83
12207	7	28	3	184
12215	23	60	4	5
12223	26	24	7	2
12231	9	46	7	1
12239	25	69	7	1
12247	27	47	6	4
12255	24	28	9	228
12263	13	27	7	2
12271	4	62	9	228
12279	6	52	7	2
12287	11	25	5	3
12295	7	34	7	2
12303	17	53	9	228
12311	14	23	7	1
12319	4	5	3	177
12327	22	13	6	4
12335	14	70	4	98
12343	2	35	7	2
12351	22	74	6	4
12359	2	72	3	72
12367	26	28	7	1
12375	10	10	3	219
12383	16	50	10	202
12391	10	4	4	7
12399	23	58	5	3
12407	21	64	3	14
12415	4	56	3	147
12423	26	40	7	2
12431	19	19	4	5
12439	3	1	7	2
12447	3	19	3	12
12455	12	22	3	8
12463	3	66	9	228
12471	4	7	2	186
12479	5	65	7	2
12487	8	38	4	64
12495	15	40	5	3
12503	14	29	6	4
12511	25	17	4	6
12519	27	29	7	2
12527	16	66	9	228
12535	24	45	4	211
12543	14	50	4	7
12551	26	28	4	6
12559	22	32	6	4
11316	21	45	6	4
11324	18	20	6	4
11332	19	9	5	3
11340	23	4	7	2
11348	18	8	4	28
11356	18	68	4	7
11364	12	62	4	6
11372	8	18	4	7
11380	14	49	6	4
11388	24	30	3	162
11396	20	1	8	148
11404	23	57	3	18
11412	28	3	5	3
11420	8	31	6	206
11428	5	17	5	3
11436	22	26	4	6
11444	23	74	9	228
11452	17	34	4	6
11460	10	26	4	31
11468	11	41	4	6
11476	17	66	7	1
11484	3	53	4	176
11492	23	37	9	228
11500	11	47	4	7
11508	20	45	4	227
11516	13	13	9	228
11524	4	67	6	4
11532	12	73	4	6
11540	9	37	4	6
11548	5	30	3	162
11556	25	29	7	2
11564	21	13	7	1
11572	7	35	4	30
11580	4	18	5	3
11588	24	10	3	220
11596	16	18	9	228
11604	11	60	4	6
11612	4	45	3	216
11620	7	33	4	6
11628	3	16	4	6
11636	18	60	11	169
11644	15	21	4	168
11652	24	46	3	232
11660	27	22	3	8
11668	11	69	4	5
11676	19	60	4	6
11684	28	8	4	6
11692	23	59	6	4
11700	26	65	7	1
11708	28	42	6	4
11716	5	47	4	7
11724	27	45	3	229
11732	18	70	4	60
11740	14	4	4	121
11748	27	45	7	2
11756	5	14	4	6
11764	18	45	4	227
11772	17	51	7	1
11780	3	33	3	71
11788	20	56	3	147
11796	7	17	4	6
11804	11	73	4	7
11812	8	10	3	178
11820	9	66	7	2
11828	2	41	13	109
11836	4	9	9	228
11844	5	64	4	6
11852	5	28	3	138
11860	14	30	4	5
11868	16	33	3	71
11876	26	56	4	5
11884	12	45	3	229
11892	27	10	4	6
11900	24	13	4	5
11908	13	45	3	222
11916	26	29	7	2
11924	13	2	7	1
11932	10	23	3	137
11940	3	71	5	3
11948	21	47	7	1
11956	7	45	3	232
11964	18	17	9	228
11972	14	63	4	6
11980	18	66	7	1
11988	15	37	3	195
11996	20	5	3	40
12004	17	57	4	7
12012	17	29	3	161
12020	6	56	7	2
12028	9	5	3	171
12036	12	49	6	4
12044	23	29	4	6
12052	6	49	6	4
12060	2	13	4	115
12068	12	24	4	7
12076	28	71	4	7
12084	20	39	7	2
12092	27	39	4	7
12100	22	52	6	4
12108	11	42	7	2
12116	18	49	7	2
12124	23	51	4	44
12132	22	51	10	54
12140	4	22	6	4
12148	8	70	4	5
12156	14	33	3	71
12164	12	27	7	2
12172	13	71	4	7
12180	4	15	4	7
12188	20	54	10	221
12196	28	26	4	6
12204	21	8	4	6
12212	28	29	4	6
12220	17	65	3	150
12228	12	25	4	5
12236	14	40	4	6
12244	5	28	9	228
12252	11	58	4	114
12260	7	74	4	7
12268	9	1	3	13
12276	13	8	4	6
12284	10	9	7	1
12292	10	25	6	4
12300	18	12	7	1
12308	21	46	4	227
12316	25	52	7	2
12324	15	3	7	1
12332	8	67	4	7
12340	20	56	3	223
12348	14	66	4	47
12356	15	70	4	98
12364	12	70	9	228
12372	11	54	7	1
12380	16	56	6	4
12388	12	73	5	3
12396	18	11	4	58
12404	21	68	4	7
12412	27	25	3	183
12420	21	7	7	1
12428	14	11	6	4
12436	23	3	6	4
12444	23	52	3	154
12452	11	41	5	3
12460	21	55	4	7
12468	5	42	4	51
12476	13	65	5	3
12484	27	49	4	6
12492	21	73	5	3
12500	12	49	7	1
12508	6	68	4	7
12516	4	38	9	228
12524	22	7	7	1
12532	6	4	9	228
12540	26	4	6	4
12548	28	25	7	2
12556	13	1	4	5
12564	5	53	4	6
12105	8	11	3	158
12113	24	40	4	5
12121	10	60	4	7
12129	12	35	4	134
12137	5	55	4	5
12145	11	7	7	2
12153	25	45	3	200
12161	18	25	6	4
12169	7	33	4	35
12177	16	35	4	30
12185	6	31	3	162
12193	10	32	4	5
12201	4	21	5	3
12209	14	42	5	3
12217	15	20	4	5
12225	11	7	4	7
12233	8	45	3	231
12241	22	14	7	2
12249	3	44	3	130
12257	22	7	4	65
12265	18	30	5	3
12273	13	10	5	3
12281	21	24	6	4
12289	5	52	7	2
12297	18	1	8	148
12305	7	7	3	155
12313	28	2	6	4
12321	28	37	4	30
12329	2	25	4	67
12337	8	56	7	1
12345	3	57	4	7
12353	3	11	4	5
12361	7	28	4	5
12369	28	53	10	203
12377	26	11	4	7
12385	21	11	9	228
12393	22	40	6	4
12401	27	60	7	1
12409	5	4	9	228
12417	25	38	6	4
12425	5	31	4	7
12433	22	24	4	112
12441	23	36	4	5
12449	18	64	7	1
12457	4	11	4	58
12465	10	30	7	1
12473	25	62	7	1
12481	17	4	3	20
12489	7	50	4	7
12497	19	8	4	93
12505	22	13	7	1
12513	7	55	4	7
12521	23	30	9	228
12529	16	25	3	139
12537	6	18	7	2
12545	16	3	7	1
12553	7	40	4	7
12561	3	56	12	146
12569	3	71	4	26
12577	3	9	4	6
12585	22	48	4	7
12593	28	15	4	5
12601	19	54	9	228
12609	8	63	5	3
12617	21	8	7	1
12625	11	69	4	6
12633	21	27	4	7
12641	7	20	5	3
12649	11	31	3	162
12657	3	25	9	228
12665	16	71	7	1
12673	2	35	4	30
12681	8	43	9	228
12689	9	64	6	4
12697	17	3	12	189
12705	19	51	4	6
12713	5	2	6	4
12721	5	34	7	2
12729	9	11	9	228
12737	23	44	12	179
12745	16	4	4	5
12753	27	46	3	229
12761	9	46	3	231
12769	6	34	9	228
12777	9	21	9	228
12785	9	22	4	7
12793	6	70	4	6
12801	23	26	2	187
12809	25	67	6	4
12817	18	10	7	2
12825	20	44	7	1
12833	17	43	5	3
12841	26	55	4	80
12849	3	22	4	7
12857	16	40	4	39
12865	26	48	4	81
12873	28	19	7	2
12881	8	39	3	22
12889	18	29	4	5
12897	22	24	5	3
12905	8	34	4	29
12913	21	27	3	149
12921	24	40	12	92
12929	23	9	4	27
12937	23	45	6	4
12945	19	61	4	5
12953	23	27	6	4
12961	18	3	4	5
12969	27	12	4	141
12977	13	36	5	3
12985	15	30	9	228
12993	23	62	7	2
13001	25	46	5	3
13009	28	26	5	3
13017	23	5	7	1
13025	24	64	7	1
13033	9	56	5	3
13041	18	51	5	3
13049	13	63	6	4
13057	22	47	7	1
13065	15	56	7	1
13073	27	11	9	228
13081	12	63	11	90
13089	11	50	3	197
13097	15	53	4	7
13105	23	63	5	3
13113	7	20	4	6
13121	24	67	4	6
13129	19	36	4	7
13137	12	64	3	14
13145	8	29	6	206
13153	20	23	4	7
13161	18	43	7	1
13169	18	63	7	2
13177	20	49	3	151
13185	20	44	3	179
13193	27	10	4	5
13201	8	40	4	5
13209	13	24	5	3
13217	2	17	9	228
13225	28	74	5	3
13233	3	61	4	7
13241	22	2	12	175
13249	12	33	4	35
13257	22	45	3	229
13265	20	71	4	7
13273	13	55	4	6
13281	17	57	9	228
13289	27	28	3	138
13297	26	71	4	7
13305	21	60	9	228
13313	20	4	4	83
13321	26	2	5	3
13329	14	5	7	2
13337	24	67	7	2
13345	13	66	9	228
13353	4	50	4	5
12568	18	50	5	3
12576	21	74	4	7
12584	15	50	4	6
12592	7	27	4	7
12600	14	6	3	63
12608	10	15	4	7
12616	14	23	4	6
12624	7	24	9	228
12632	18	72	3	118
12640	11	57	4	79
12648	6	7	6	4
12656	6	61	4	5
12664	24	66	4	6
12672	11	33	3	105
12680	19	53	5	3
12688	9	66	7	1
12696	6	36	3	182
12704	12	13	7	2
12712	6	39	6	4
12720	10	19	3	76
12728	8	49	7	2
12736	3	13	7	1
12744	5	42	9	228
12752	26	17	4	5
12760	20	66	7	2
12768	6	53	9	228
12776	12	7	4	7
12784	15	11	12	96
12792	12	2	4	7
12800	23	27	5	3
12808	12	57	4	79
12816	17	68	4	5
12824	25	12	4	6
12832	9	32	3	75
12840	23	66	4	7
12848	4	54	7	2
12856	15	29	7	1
12864	26	56	12	174
12872	25	56	3	223
12880	23	11	4	6
12888	20	36	3	182
12896	27	13	9	228
12904	25	70	4	43
12912	14	10	3	204
12920	17	9	4	6
12928	24	11	3	24
12936	14	46	7	2
12944	10	4	4	83
12952	3	17	4	7
12960	28	55	7	1
12968	14	9	12	111
12976	28	68	5	3
12984	13	58	4	7
12992	16	66	4	7
13000	24	28	3	99
13008	4	73	7	2
13016	18	45	4	211
13024	11	46	12	229
13032	15	39	3	22
13040	25	68	4	61
13048	3	38	7	2
13056	2	6	4	7
13064	19	46	4	211
13072	18	9	5	3
13080	5	36	4	7
13088	21	38	4	5
13096	15	8	4	28
13104	2	66	7	2
13112	27	50	7	2
13120	25	44	4	156
13128	21	72	7	2
13136	23	32	6	4
13144	5	73	9	228
13152	4	1	9	228
13160	19	23	6	4
13168	8	2	4	5
13176	5	44	4	7
13184	8	50	5	3
13192	15	16	4	5
13200	25	67	7	2
13208	28	5	4	7
13216	8	62	9	228
13224	12	66	7	2
13232	23	56	4	5
13240	26	55	3	159
13248	14	49	4	117
13256	21	28	6	4
13264	7	39	6	4
13272	8	54	4	7
13280	19	52	3	154
13288	3	19	3	76
13296	27	27	3	123
13304	3	64	5	3
13312	15	36	4	6
13320	10	45	4	6
13328	13	23	4	112
13336	5	74	7	2
13344	26	15	4	5
13352	3	5	12	84
13360	3	70	4	43
13368	23	2	12	175
13376	9	63	3	90
13384	24	37	7	1
13392	18	55	3	144
13400	2	30	4	7
13408	16	36	4	5
13416	2	43	9	228
13424	23	40	7	1
13432	21	20	5	3
13440	19	72	4	5
13448	20	5	3	177
13456	15	62	4	6
13464	26	18	4	66
13472	13	17	4	180
13480	15	12	4	141
13488	14	67	4	5
13496	5	25	4	5
13504	14	46	9	228
13512	15	28	3	184
13520	22	50	10	202
13528	14	73	7	2
13536	14	46	6	4
13544	10	21	9	228
13552	22	66	6	4
13560	10	22	5	3
13568	27	55	4	6
13576	27	67	5	3
13584	18	18	4	180
13592	19	59	5	3
13600	4	11	12	96
13608	19	69	4	50
13616	4	40	7	2
13624	25	59	6	4
13632	6	55	4	7
13640	5	59	9	228
13648	3	45	3	232
13656	15	22	6	4
13664	18	40	13	78
13672	19	37	6	4
13680	20	40	6	4
13688	6	41	4	11
13696	12	31	5	3
13704	14	56	3	174
13712	6	19	5	3
13720	4	52	4	145
13728	3	68	4	6
13736	25	12	9	228
13744	27	62	4	7
13752	16	38	6	4
13760	10	15	7	1
13768	21	70	4	5
13776	28	36	4	30
13784	21	65	4	5
13792	15	1	6	4
13800	5	28	4	7
13808	19	70	7	1
13816	14	74	5	3
12571	9	24	4	181
12579	27	31	6	206
12587	10	69	7	1
12595	3	29	5	3
12603	13	55	4	80
12611	18	21	4	168
12619	24	70	4	60
12627	25	41	7	1
12635	25	5	3	177
12643	17	64	6	4
12651	2	3	6	4
12659	25	54	9	228
12667	24	46	7	1
12675	3	52	3	154
12683	15	17	4	160
12691	8	34	4	6
12699	3	27	4	6
12707	6	57	5	3
12715	24	43	9	228
12723	8	57	4	7
12731	27	38	4	64
12739	28	73	7	2
12747	12	18	4	66
12755	21	50	3	202
12763	22	36	7	1
12771	4	5	3	171
12779	4	56	3	174
12787	5	67	9	228
12795	21	25	4	5
12803	19	49	4	7
12811	15	5	5	3
12819	20	56	12	214
12827	21	34	4	7
12835	24	44	3	179
12843	26	60	9	228
12851	23	9	9	228
12859	4	17	9	228
12867	15	26	2	187
12875	16	11	3	158
12883	25	42	7	2
12891	16	21	9	228
12899	6	7	7	2
12907	4	56	12	122
12915	18	59	7	1
12923	27	74	7	2
12931	2	67	7	2
12939	10	32	12	106
12947	15	69	4	7
12955	9	30	5	3
12963	27	55	4	80
12971	27	23	4	6
12979	17	19	5	3
12987	16	11	12	96
12995	24	14	5	3
13003	17	32	7	1
13011	17	30	4	6
13019	26	58	7	2
13027	16	21	7	1
13035	17	2	4	5
13043	23	56	3	208
13051	5	12	9	228
13059	2	58	4	6
13067	11	46	4	211
13075	19	8	7	2
13083	9	9	6	4
13091	23	45	12	216
13099	13	24	4	6
13107	6	54	4	6
13115	25	54	4	6
13123	20	51	4	5
13131	13	7	4	23
13139	19	63	3	126
13147	19	5	3	84
13155	2	45	9	228
13163	24	27	6	4
13171	27	56	4	172
13179	28	25	3	165
13187	18	47	4	7
13195	6	18	4	66
13203	12	48	4	7
13211	15	52	5	3
13219	13	26	2	187
13227	6	43	4	5
13235	9	35	3	166
13243	6	47	6	4
13251	25	53	4	176
13259	8	60	7	1
13267	25	46	4	230
13275	19	2	9	228
13283	12	12	4	6
13291	28	6	6	4
13299	26	38	4	167
13307	18	74	3	100
13315	17	29	6	4
13323	26	10	3	204
13331	7	69	4	6
13339	19	2	4	7
13347	16	64	9	228
13355	17	47	4	7
13363	28	72	4	6
13371	2	72	3	118
13379	20	40	7	1
13387	15	7	4	5
13395	6	39	4	7
13403	28	13	9	228
13411	2	34	4	6
13419	21	43	12	101
13427	18	11	4	5
13435	26	18	4	180
13443	16	55	3	144
13451	13	10	3	204
13459	27	50	3	202
13467	23	5	3	40
13475	8	9	12	70
13483	20	23	4	112
13491	17	11	5	3
13499	9	15	6	4
13507	25	74	7	2
13515	23	28	3	184
13523	13	56	12	146
13531	3	52	7	1
13539	26	43	3	101
13547	16	18	4	5
13555	7	49	4	45
13563	3	56	12	82
13571	10	61	9	228
13579	9	21	7	2
13587	11	59	9	228
13595	16	2	4	5
13603	9	11	7	1
13611	17	60	4	5
13619	23	43	3	232
13627	20	5	3	84
13635	4	26	4	7
13643	3	37	4	30
13651	5	39	4	140
13659	2	42	4	51
13667	18	49	4	6
13675	5	61	7	1
13683	28	60	4	6
13691	22	51	4	5
13699	25	19	5	3
13707	8	46	6	4
13715	20	65	5	3
13723	13	25	7	2
13731	21	32	6	4
13739	25	55	7	2
13747	6	36	7	2
13755	13	72	9	228
13763	15	11	6	4
13771	24	72	3	37
13779	7	12	3	15
13787	18	69	7	2
13795	23	25	4	6
13803	23	23	4	164
13811	7	10	3	210
13819	4	53	4	176
12570	26	44	4	192
12578	17	28	4	7
12586	4	69	7	1
12594	24	39	3	74
12602	9	61	6	4
12610	25	74	3	100
12618	18	22	6	4
12626	17	30	9	228
12634	11	45	4	227
12642	7	36	4	6
12650	8	39	4	6
12658	15	34	6	4
12666	23	23	4	112
12674	15	37	6	4
12682	20	47	9	228
12690	9	52	3	154
12698	14	59	7	2
12706	27	5	3	143
12714	26	74	6	4
12722	5	56	12	214
12730	11	10	3	178
12738	27	41	7	2
12746	24	74	3	100
12754	4	19	3	76
12762	27	26	2	187
12770	4	56	12	82
12778	18	53	9	228
12786	15	46	3	229
12794	22	17	4	5
12802	23	3	7	1
12810	28	33	3	71
12818	6	48	4	81
12826	10	9	12	70
12834	13	28	4	5
12842	2	55	6	4
12850	25	1	7	1
12858	11	15	6	4
12866	7	34	4	7
12874	7	45	4	7
12882	15	56	12	146
12890	15	58	7	1
12898	14	24	5	3
12906	27	54	10	221
12914	20	53	4	5
12922	5	53	5	3
12930	4	53	6	4
12938	21	17	4	5
12946	3	23	3	164
12954	13	26	4	6
12962	24	38	7	1
12970	26	47	9	228
12978	26	44	6	4
12986	8	43	7	1
12994	14	5	12	84
13002	24	62	4	6
13010	22	72	9	228
13018	14	8	5	3
13026	24	4	7	2
13034	26	69	4	5
13042	18	62	4	6
13050	20	31	6	4
13058	26	26	9	228
13066	15	25	4	67
13074	20	33	5	3
13082	9	72	7	1
13090	26	70	6	4
13098	14	16	4	6
13106	14	31	5	3
13114	17	24	4	5
13122	23	56	4	46
13130	13	44	5	3
13138	18	5	4	5
13146	28	12	3	87
13154	4	46	4	222
13162	12	64	7	2
13170	24	58	7	2
13178	7	46	7	2
13186	27	42	5	3
13194	2	5	3	119
13202	24	5	4	6
13210	5	41	13	109
13218	8	17	9	228
13226	19	71	7	2
13234	10	36	4	5
13242	27	27	12	191
13250	28	13	7	2
13258	14	53	4	5
13266	11	43	5	3
13274	18	51	2	212
13282	13	74	9	228
13290	21	45	4	227
13298	6	48	7	2
13306	6	55	4	80
13314	5	16	4	7
13322	17	72	4	5
13330	20	11	3	24
13338	6	60	3	169
13346	28	14	6	4
13354	20	34	7	2
13362	7	11	3	24
13370	18	67	7	2
13378	13	71	4	56
13386	11	64	4	5
13394	20	16	3	57
13402	18	46	12	216
13410	5	46	3	231
13418	10	55	3	144
13426	24	9	12	70
13434	25	51	4	6
13442	15	29	3	162
13450	28	41	4	7
13458	6	20	4	113
13466	5	24	6	4
13474	2	9	12	70
13482	24	52	4	95
13490	13	46	7	2
13498	20	43	4	5
13506	24	7	9	228
13514	20	16	6	4
13522	11	56	7	2
13530	10	24	4	7
13538	15	56	2	223
13546	18	27	7	1
13554	20	43	3	101
13562	13	6	7	2
13570	2	12	3	87
13578	13	52	4	7
13586	12	51	9	228
13594	16	49	4	117
13602	22	17	4	193
13610	21	28	7	1
13618	2	24	4	5
13626	24	11	4	6
13634	14	71	4	26
13642	17	31	7	2
13650	6	55	4	116
13658	3	70	4	7
13666	4	29	4	6
13674	10	19	9	228
13682	2	59	7	2
13690	2	51	10	54
13698	23	17	9	228
13706	9	23	7	2
13714	20	2	4	6
13722	14	17	7	2
13730	25	61	7	1
13738	5	12	4	7
13746	17	25	7	1
13754	9	71	4	5
13762	9	59	4	7
13770	24	33	9	228
13778	15	17	4	133
13786	21	36	4	110
13794	19	67	7	2
13802	5	22	4	5
13810	2	66	4	6
13818	8	6	4	6
12572	18	57	9	228
12580	6	56	12	214
12588	2	25	7	2
12596	20	16	4	7
12604	9	14	4	6
12612	7	31	4	6
12620	5	3	4	5
12628	27	8	7	1
12636	5	17	6	4
12644	9	67	7	2
12652	20	13	7	2
12660	15	37	7	2
12668	18	39	3	74
12676	4	51	7	1
12684	9	30	9	228
12692	14	33	4	35
12700	27	5	4	7
12708	2	71	4	26
12716	22	46	4	7
12724	17	68	5	3
12732	3	43	3	232
12740	15	44	12	179
12748	24	21	9	228
12756	13	13	4	7
12764	13	14	6	4
12772	22	52	4	145
12780	27	7	3	155
12788	4	17	4	7
12796	2	50	6	4
12804	12	74	3	100
12812	22	49	4	45
12820	26	56	12	214
12828	19	9	6	129
12836	16	46	3	222
12844	17	28	12	194
12852	28	51	10	54
12860	18	44	3	179
12868	15	21	7	1
12876	21	2	6	4
12884	15	27	6	4
12892	26	10	6	4
12900	9	17	4	133
12908	28	23	4	112
12916	15	72	4	6
12924	17	40	4	5
12932	6	74	3	100
12940	16	14	7	1
12948	16	72	6	4
12956	2	32	9	228
12964	14	71	4	7
12972	10	56	12	82
12980	17	6	6	4
12988	17	7	4	5
12996	7	36	9	228
13004	28	29	9	228
13012	6	54	4	218
13020	14	43	3	232
13028	14	13	7	1
13036	24	51	5	3
13044	6	23	7	2
13052	9	37	9	228
13060	28	61	7	2
13068	4	33	7	2
13076	26	20	4	6
13084	19	57	4	6
13092	5	65	4	7
13100	9	69	7	2
13108	13	55	4	10
13116	28	35	7	2
13124	23	34	7	1
13132	5	36	4	110
13140	22	58	6	4
13148	9	19	5	3
13156	25	50	3	197
13164	9	56	4	5
13172	9	30	3	68
13180	16	54	7	2
13188	7	48	9	228
13196	23	36	4	6
13204	28	20	6	4
13212	25	47	6	4
13220	17	16	3	57
13228	23	14	5	3
13236	17	35	3	166
13244	22	23	3	137
13252	7	56	3	215
13260	19	17	4	5
13268	26	7	5	3
13276	8	46	3	231
13284	10	5	7	1
13292	12	24	5	3
13300	12	6	3	63
13308	15	13	6	4
13316	3	62	9	228
13324	4	15	6	4
13332	26	20	4	113
13340	7	74	9	228
13348	7	45	3	200
13356	18	16	3	57
13364	3	22	5	3
13372	13	20	6	4
13380	27	53	5	3
13388	11	45	3	200
13396	22	45	3	232
13404	17	40	12	92
13412	12	47	4	7
13420	18	65	3	150
13428	18	32	12	106
13436	12	57	5	3
13444	20	37	4	6
13452	18	3	9	228
13460	14	25	3	165
13468	25	56	12	174
13476	7	67	4	62
13484	12	39	6	4
13492	19	5	3	171
13500	13	49	4	45
13508	24	42	4	7
13516	22	52	7	2
13524	17	18	4	180
13532	13	60	3	169
13540	22	67	4	5
13548	15	28	4	5
13556	14	47	4	5
13564	15	64	7	1
13572	21	18	7	1
13580	10	18	4	180
13588	15	23	4	5
13596	19	6	4	5
13604	24	45	4	222
13612	26	45	4	211
13620	2	60	5	3
13628	5	6	4	5
13636	27	72	3	72
13644	23	36	9	228
13652	22	54	7	2
13660	12	30	7	2
13668	16	5	3	40
13676	19	32	7	2
13684	28	40	4	5
13692	21	59	4	5
13700	19	58	7	2
13708	3	54	4	209
13716	20	63	6	4
13724	17	51	4	44
13732	23	21	4	7
13740	28	34	4	6
13748	15	13	7	1
13756	15	46	4	6
13764	25	55	4	10
13772	26	72	4	7
13780	26	5	4	5
13788	10	64	3	14
13796	20	9	4	7
13804	20	7	5	3
13812	15	73	7	2
13820	27	48	9	228
12566	21	34	7	2
12574	14	18	4	66
12582	17	37	7	1
12590	25	46	3	231
12598	10	17	9	228
12606	17	71	4	6
12614	9	62	7	2
12622	4	3	12	189
12630	5	56	3	223
12638	16	3	6	4
12646	12	20	6	4
12654	15	38	7	2
12662	8	37	3	205
12670	16	23	5	3
12678	20	33	4	6
12686	23	43	7	1
12694	8	3	6	4
12702	18	69	4	6
12710	8	5	7	1
12718	28	60	9	228
12726	9	68	5	3
12734	28	16	5	3
12742	21	24	5	3
12750	25	37	3	205
12758	24	7	4	7
12766	28	50	3	185
12774	11	67	9	228
12782	24	30	3	161
12790	4	32	12	106
12798	14	38	4	167
12806	14	68	7	1
12814	5	51	4	6
12822	16	29	5	3
12830	26	45	3	226
12838	19	46	3	231
12846	10	30	3	161
12854	23	61	7	1
12862	20	28	5	3
12870	5	5	3	177
12878	11	61	4	5
12886	26	64	4	5
12894	8	16	7	1
12902	4	43	3	101
12910	28	74	9	228
12918	24	55	3	144
12926	8	53	4	176
12934	26	36	3	182
12942	8	40	5	3
12950	27	56	7	2
12958	21	6	3	120
12966	13	6	3	120
12974	17	61	7	1
12982	9	59	5	3
12990	16	27	5	3
12998	21	63	6	4
13006	3	41	4	7
13014	2	50	3	202
13022	17	49	4	117
13030	6	63	11	90
13038	26	63	7	2
13046	8	10	3	210
13054	11	14	4	5
13062	28	16	4	6
13070	21	60	7	1
13078	19	51	5	3
13086	18	41	6	4
13094	11	63	3	126
13102	5	14	4	5
13110	23	29	3	161
13118	27	3	4	7
13126	15	34	7	1
13134	13	41	4	5
13142	10	70	4	7
13150	6	17	4	32
13158	25	22	7	1
13166	14	18	5	3
13174	23	23	4	5
13182	3	68	9	228
13190	4	24	7	2
13198	17	43	3	232
13206	6	23	4	112
13214	10	7	4	7
13222	6	7	4	102
13230	3	11	5	3
13238	9	15	7	2
13246	24	53	7	2
13254	22	53	4	5
13262	17	54	9	228
13270	9	39	3	74
13278	5	71	7	2
13286	25	54	10	221
13294	19	61	6	4
13302	7	60	4	7
13310	22	49	10	170
13318	9	54	9	228
13326	3	21	7	2
13334	21	10	3	210
13342	8	43	7	2
13350	5	70	7	1
13358	15	6	9	228
13366	25	7	5	3
13374	20	28	6	4
13382	11	18	4	160
13390	28	46	4	230
13398	28	63	7	1
13406	20	74	3	100
13414	18	46	7	1
13422	22	38	4	167
13430	15	41	7	2
13438	24	4	4	83
13446	6	53	5	3
13454	20	17	4	5
13462	10	16	7	2
13470	12	9	7	2
13478	20	7	4	102
13486	23	38	6	4
13494	23	70	7	2
13502	28	1	4	7
13510	27	18	4	32
13518	6	40	4	6
13526	21	48	6	4
13534	8	11	3	132
13542	27	43	3	21
13550	12	23	4	112
13558	16	15	7	2
13566	21	48	9	228
13574	5	43	4	59
13582	21	52	4	7
13590	21	22	7	2
13598	10	14	4	5
13606	9	56	2	223
13614	12	31	3	161
13622	28	32	3	75
13630	13	62	7	2
13638	23	4	4	5
13646	7	73	4	5
13654	12	69	9	228
13662	20	24	4	112
13670	9	51	4	44
13678	7	56	4	6
13686	28	17	7	2
13694	5	46	4	5
13702	17	46	5	3
13710	4	41	5	3
13718	17	48	4	5
13726	21	56	4	6
13734	13	36	7	2
13742	20	32	7	2
13750	21	72	9	228
13758	19	7	4	6
13766	25	26	9	228
13774	12	63	6	4
13782	21	24	4	112
13790	2	69	4	5
13798	15	5	7	2
13806	21	34	6	4
13814	17	10	7	2
12567	23	7	4	131
12575	3	1	8	148
12583	21	36	4	6
12591	26	14	3	57
12599	19	30	3	161
12607	23	55	4	6
12615	14	50	3	202
12623	11	53	5	3
12631	28	20	4	5
12639	15	51	4	7
12647	9	71	7	1
12655	28	66	4	7
12663	2	24	4	181
12671	13	71	7	2
12679	3	43	4	59
12687	3	32	4	36
12695	12	42	4	7
12703	24	69	4	6
12711	20	38	4	167
12719	16	57	4	7
12727	27	24	5	3
12735	11	37	7	1
12743	15	33	4	7
12751	26	6	7	2
12759	18	14	3	57
12767	24	7	6	4
12775	18	43	4	5
12783	27	46	4	227
12791	6	14	3	57
12799	27	48	7	2
12807	27	49	5	3
12815	23	41	7	2
12823	21	36	7	1
12831	25	73	4	6
12839	9	11	4	5
12847	9	28	12	194
12855	24	42	12	108
12863	4	19	4	6
12871	14	55	3	159
12879	16	16	7	1
12887	22	68	7	1
12895	24	56	3	174
12903	2	39	4	6
12911	28	45	3	232
12919	2	34	4	29
12927	18	11	3	24
12935	23	10	4	5
12943	28	59	7	2
12951	28	68	4	6
12959	6	49	9	228
12967	25	53	5	3
12975	9	1	4	7
12983	2	7	4	131
12991	14	30	7	2
12999	8	5	9	228
13007	20	7	4	23
13015	9	4	3	20
13023	22	33	4	5
13031	26	26	6	4
13039	15	30	6	4
13047	8	6	4	7
13055	11	46	3	201
13063	14	44	4	5
13071	3	21	4	6
13079	23	25	7	2
13087	23	43	6	4
13095	26	31	9	228
13103	25	31	7	2
13111	15	44	3	130
13119	6	39	4	140
13127	19	46	12	229
13135	27	11	4	7
13143	25	26	7	2
13151	3	19	9	228
13159	22	60	7	1
13167	20	51	9	228
13175	6	36	4	7
13183	10	2	4	7
13191	2	11	3	132
13199	24	64	4	5
13207	6	42	6	4
13215	2	62	9	228
13223	3	10	7	2
13231	14	45	3	229
13239	6	16	9	228
13247	26	20	7	2
13255	16	60	7	1
13263	27	52	4	7
13271	21	25	3	139
13279	9	45	3	222
13287	21	53	5	3
13295	12	51	7	1
13303	22	36	3	182
13311	7	4	4	83
13319	15	27	4	7
13327	8	4	4	5
13335	3	30	3	161
13343	15	7	2	186
13351	14	38	4	7
13359	23	6	9	228
13367	17	52	4	95
13375	26	58	7	1
13383	18	56	12	82
13391	10	40	12	92
13399	15	25	3	139
13407	25	28	6	4
13415	28	10	5	3
13423	19	28	6	4
13431	27	44	12	179
13439	23	74	5	3
13447	13	28	5	3
13455	19	45	4	6
13463	10	3	9	228
13471	5	2	4	7
13479	7	48	4	7
13487	19	37	3	205
13495	3	35	4	7
13503	7	26	2	187
13511	27	45	4	230
13519	18	48	4	81
13527	13	27	12	191
13535	6	49	2	217
13543	13	70	4	98
13551	13	46	3	229
13559	17	9	6	129
13567	23	1	6	4
13575	24	27	7	1
13583	17	21	7	2
13591	15	67	4	41
13599	26	55	6	4
13607	22	57	7	2
13615	8	41	6	4
13623	28	9	12	70
13631	8	52	9	228
13639	21	50	6	4
13647	14	12	4	5
13655	17	51	10	54
13663	12	65	5	3
13671	3	56	4	5
13679	5	11	12	96
13687	28	56	12	196
13695	22	55	5	3
13703	8	14	5	3
13711	21	39	7	1
13719	18	69	4	50
13727	9	57	4	6
13735	6	44	7	2
13743	9	51	10	54
13751	22	58	5	3
13759	22	24	3	137
13767	9	66	4	5
13775	2	55	12	159
13783	15	29	4	7
13791	11	37	4	6
13799	19	46	4	230
13807	18	37	3	205
13815	12	16	9	228
13361	6	65	3	188
13369	17	30	4	5
13377	23	46	12	229
13385	13	47	5	3
13393	27	31	4	6
13401	8	35	4	30
13409	22	46	4	230
13417	12	27	12	191
13425	20	10	6	4
13433	16	67	4	41
13441	12	37	4	6
13449	24	48	4	81
13457	12	17	4	5
13465	5	74	3	100
13473	23	2	4	5
13481	28	60	5	3
13489	3	9	6	129
13497	28	20	5	3
13505	20	53	6	4
13513	17	32	4	5
13521	23	5	12	177
13529	10	64	4	5
13537	16	29	6	207
13545	8	56	3	174
13553	26	63	4	6
13561	19	28	12	194
13569	3	39	3	74
13577	16	27	3	53
13585	10	61	3	9
13593	16	22	4	6
13601	25	37	9	228
13609	8	42	4	5
13617	19	21	4	6
13625	20	64	7	2
13633	24	63	7	2
13641	18	54	4	218
13649	15	50	5	3
13657	8	62	4	6
13665	19	33	5	3
13673	12	33	4	5
13681	24	49	4	6
13689	11	15	7	1
13697	14	55	5	3
13705	4	27	6	4
13713	28	50	9	228
13721	6	55	7	2
13729	9	68	4	6
13737	27	38	4	94
13745	2	6	5	3
13753	24	29	6	206
13761	19	50	7	2
13769	24	26	4	7
13777	21	5	3	84
13785	10	69	4	50
13793	28	10	3	153
13801	24	68	4	42
13809	15	34	4	5
13817	10	27	7	1
13825	10	9	6	129
13833	14	22	3	73
13841	21	66	3	86
13849	21	7	4	65
13857	3	49	4	7
13865	16	43	3	232
13873	13	72	4	6
13881	3	52	4	6
13889	18	10	6	4
13897	16	68	9	228
13905	19	44	3	179
13913	4	37	3	205
13921	21	3	4	5
13929	5	31	6	206
13937	8	17	4	133
13945	19	61	3	9
13953	5	13	4	115
13961	27	21	4	5
13969	28	17	4	103
13977	15	1	9	228
13985	6	15	4	5
13993	6	47	5	3
14001	7	58	5	3
14009	18	56	3	196
14017	13	62	4	7
14025	27	72	9	228
14033	27	51	5	3
14041	26	40	4	39
14049	26	35	7	1
14057	9	41	5	3
14065	2	27	7	2
14073	5	15	7	1
14081	11	18	4	133
14089	15	24	3	137
14097	6	74	3	16
14105	18	46	4	211
14113	12	72	7	2
14121	20	19	3	12
14129	9	1	5	3
14137	9	5	9	228
14145	6	38	4	5
14153	9	8	4	7
14161	26	61	4	52
14169	24	5	5	3
14177	8	34	4	5
14185	22	32	12	106
14193	15	12	4	5
14201	12	69	4	6
14209	20	60	3	169
14217	17	41	7	1
14225	28	52	4	7
14233	6	42	5	3
14241	11	67	4	7
14249	21	9	7	2
14257	24	49	9	228
14265	26	24	9	228
14273	5	55	3	159
14281	9	25	5	3
14289	25	68	4	5
14297	3	25	5	3
14305	19	41	13	109
14313	25	56	12	214
14321	20	23	4	6
14329	11	57	3	18
14337	27	71	6	4
14345	24	73	4	6
14353	25	10	3	178
14361	6	26	2	187
14369	17	61	7	2
14377	23	31	7	2
14385	9	22	5	3
14393	9	59	4	136
14401	20	40	9	228
14409	3	27	9	228
14417	2	10	3	153
14425	26	12	6	4
14433	26	25	4	33
14441	5	65	4	5
14449	26	34	4	29
14457	19	18	9	228
14465	25	61	4	7
14473	21	1	8	88
14481	22	60	7	2
14489	11	35	7	2
14497	15	70	3	152
14505	6	47	4	5
14513	23	31	6	207
14521	6	35	6	4
14529	5	55	7	1
14537	10	68	6	4
14545	3	68	4	7
14553	19	32	9	228
14561	14	26	4	31
14569	4	7	4	102
14577	5	15	4	25
14585	27	30	7	1
14593	15	74	3	100
14601	10	36	5	3
14609	18	18	9	228
12997	27	63	6	4
13005	22	31	5	3
13013	15	27	7	1
13021	9	13	4	5
13029	6	9	4	5
13037	6	65	9	228
13045	22	30	7	2
13053	28	3	9	228
13061	3	71	6	4
13069	22	52	7	1
13077	14	26	5	3
13085	17	59	6	4
13093	25	31	6	207
13101	6	26	7	2
13109	15	52	4	95
13117	20	36	4	30
13125	10	65	4	7
13133	15	32	6	4
13141	19	74	4	5
13149	26	72	3	37
13157	25	62	4	6
13165	3	16	4	5
13173	14	65	4	5
13181	21	38	4	64
13189	5	19	7	1
13197	9	13	7	1
13205	6	7	3	155
13213	9	11	6	4
13221	28	20	9	228
13229	16	56	12	122
13237	22	71	4	56
13245	10	68	4	42
13253	7	28	6	4
13261	28	3	4	157
13269	13	15	4	5
13277	9	57	9	228
13285	17	45	3	222
13293	20	12	4	6
13301	26	56	6	4
13309	11	8	7	1
13317	10	3	6	4
13325	14	60	5	3
13333	14	36	3	182
13341	13	67	5	3
13349	23	42	4	5
13357	24	16	3	57
13365	14	10	3	190
13373	10	22	4	5
13381	12	60	7	2
13389	19	62	5	3
13397	10	46	12	216
13405	6	2	7	2
13413	23	72	4	6
13421	11	67	5	3
13429	15	71	9	228
13437	26	4	7	1
13445	23	29	3	162
13453	21	4	7	1
13461	2	36	5	3
13469	24	24	4	7
13477	6	71	7	2
13485	25	7	3	155
13493	8	15	7	2
13501	12	45	3	200
13509	21	49	4	5
13517	8	72	5	3
13525	15	5	12	177
13533	25	71	7	2
13541	21	17	4	180
13549	15	52	9	228
13557	9	38	4	6
13565	14	5	12	171
13573	13	28	3	138
13581	4	43	9	228
13589	8	49	4	117
13597	25	58	4	7
13605	13	56	3	208
13613	6	51	9	228
13621	7	72	6	4
13629	22	34	7	1
13637	3	70	7	2
13645	24	3	4	6
13653	25	45	3	201
13661	27	4	6	4
13669	15	49	7	2
13677	2	44	12	179
13685	22	57	4	7
13693	6	39	7	1
13701	25	18	4	193
13709	2	62	7	1
13717	25	38	4	128
13725	18	40	4	7
13733	8	30	3	68
13741	4	29	7	1
13749	5	4	4	7
13757	20	69	9	228
13765	15	21	4	7
13773	19	4	4	7
13781	10	5	6	4
13789	17	46	12	229
13797	26	9	4	7
13805	20	48	7	2
13813	23	28	4	5
13821	11	22	4	5
13829	19	15	5	3
13837	27	46	4	7
13845	9	33	7	1
13853	26	2	9	228
13861	12	60	3	169
13869	10	33	4	6
13877	17	3	7	2
13885	25	44	3	179
13893	26	11	4	5
13901	6	9	12	111
13909	10	15	6	4
13917	12	7	5	3
13925	16	26	4	31
13933	20	55	4	80
13941	28	66	9	228
13949	11	61	3	9
13957	22	14	9	228
13965	14	28	3	138
13973	9	53	10	203
13981	27	74	9	228
13989	14	9	9	228
13997	20	23	5	3
14005	16	46	12	229
14013	20	36	4	110
14021	11	31	5	3
14029	9	65	4	173
14037	24	73	9	228
14045	7	56	4	46
14053	4	59	9	228
14061	13	16	4	6
14069	3	45	6	4
14077	7	74	7	1
14085	2	23	3	137
14093	8	30	7	1
14101	20	26	5	3
14109	9	38	5	3
14117	9	45	4	222
14125	3	57	7	1
14133	16	39	4	5
14141	5	58	4	7
14149	19	56	3	196
14157	16	1	6	4
14165	25	4	3	20
14173	6	53	4	6
14181	5	61	4	6
14189	23	72	3	118
14197	8	27	4	7
14205	22	52	9	228
14213	14	46	3	232
14221	28	28	5	3
14229	24	35	4	7
14237	27	61	4	5
14245	17	41	4	6
14253	24	54	6	4
14261	14	71	5	3
14269	11	8	4	6
14277	12	26	7	1
14285	21	50	3	185
14293	7	60	7	2
14301	28	30	3	162
14309	23	71	5	3
14317	28	56	12	146
14325	20	54	4	5
14333	20	49	10	224
14341	4	57	4	79
14349	7	20	9	228
14357	28	14	9	228
14365	9	29	9	228
14373	25	21	4	142
14381	22	46	4	222
14389	5	54	3	221
14397	4	3	4	6
14405	22	50	6	4
14413	13	64	7	2
14421	19	51	9	228
14429	6	4	7	2
14437	11	53	7	2
14445	4	43	7	2
14453	18	21	7	2
14461	25	22	3	73
14469	25	28	3	17
14477	26	45	3	231
14485	18	3	4	7
14493	8	73	9	228
14501	9	29	6	207
14509	25	68	4	42
14517	13	60	7	2
14525	5	3	9	228
14533	9	18	4	133
14541	12	32	6	4
14549	20	25	7	2
14557	10	69	4	5
14565	5	45	3	225
14573	9	70	4	6
14581	4	63	11	126
14589	20	32	12	106
14597	3	1	4	5
14605	9	36	6	4
14613	19	56	3	122
14621	14	38	9	228
14629	17	49	4	6
14637	8	47	7	2
14645	3	73	5	3
14653	22	5	3	177
14661	6	26	4	5
14669	10	47	9	228
14677	16	12	3	15
14685	13	49	7	2
14693	10	58	6	4
14701	26	8	4	5
14709	19	6	7	2
14717	4	63	4	6
14725	21	32	12	106
14733	27	35	5	3
14741	10	23	4	6
14749	5	14	6	4
14757	7	44	3	179
14765	15	42	12	108
14773	18	63	4	6
14781	16	70	4	43
14789	11	13	4	6
14797	13	50	5	3
14805	18	65	5	3
14813	24	45	3	222
14821	3	33	5	3
14829	5	70	4	98
14837	3	72	7	2
14845	21	7	2	186
14853	21	57	7	2
14861	26	52	10	154
14869	22	57	4	79
14877	18	61	4	7
14885	2	4	6	4
14893	16	68	7	2
14901	14	70	3	152
14909	12	56	12	196
14917	11	74	4	6
14925	5	72	9	228
14933	10	10	4	6
14941	25	32	5	3
14949	18	1	3	13
14957	7	2	7	2
14965	22	3	12	189
14973	28	25	4	5
14981	23	35	6	4
14989	9	37	4	5
14997	10	28	4	6
15005	28	21	9	228
15013	24	4	9	228
15021	21	31	4	7
15029	7	11	3	158
15037	27	14	4	5
15045	6	68	9	228
15053	11	40	4	5
15061	12	70	4	7
15069	24	46	3	229
15077	13	52	4	95
15085	18	4	6	4
15093	26	40	12	92
15101	24	20	4	6
15109	7	42	7	2
15117	17	50	9	228
15125	23	21	5	3
15133	22	35	4	30
15141	7	30	3	68
15149	24	68	7	2
15157	14	24	6	4
15165	3	46	4	230
15173	11	64	9	228
15181	4	74	7	1
15189	3	44	4	7
15197	4	38	4	7
15205	5	45	3	216
15213	21	57	9	228
15221	12	14	4	5
15229	19	58	4	5
15237	17	56	3	82
15245	7	45	3	225
15253	2	65	6	4
15261	26	3	4	7
15269	21	45	4	6
15277	2	23	7	1
15285	16	45	12	229
15293	9	4	6	4
15301	3	42	4	6
15309	26	14	4	25
15317	26	68	6	4
15325	2	7	6	4
15333	13	15	7	1
15341	7	70	3	152
15349	23	49	2	217
15357	6	23	4	164
15365	28	18	4	160
15373	11	29	7	2
15381	8	39	9	228
15389	15	74	4	7
15397	18	12	3	15
15405	27	29	9	228
15413	26	23	4	164
15421	11	11	3	24
15429	28	66	3	86
15437	15	37	4	7
15445	18	56	12	208
15453	9	34	4	29
15461	3	52	10	154
15469	9	54	4	7
15477	19	33	7	1
15485	23	20	4	5
15493	16	55	9	228
15501	24	12	4	6
13826	28	7	2	186
13834	25	2	9	228
13842	25	56	3	146
13850	14	60	9	228
13858	2	52	7	1
13866	27	50	4	6
13874	2	11	9	228
13882	15	23	4	164
13890	26	3	4	5
13898	9	24	7	2
13906	13	25	3	139
13914	22	22	3	73
13922	5	57	4	5
13930	12	55	4	80
13938	23	9	6	4
13946	7	22	3	73
13954	24	53	4	7
13962	11	33	3	71
13970	21	16	6	4
13978	13	49	10	224
13986	17	51	2	212
13994	16	30	3	68
14002	5	38	4	5
14010	27	11	7	2
14018	19	31	5	3
14026	20	42	7	1
14034	26	59	5	3
14042	22	56	4	6
14050	11	53	4	6
14058	21	36	4	7
14066	27	56	3	82
14074	21	58	5	3
14082	26	27	4	5
14090	19	38	4	5
14098	24	29	7	1
14106	27	12	5	3
14114	19	72	4	7
14122	8	64	7	1
14130	13	56	4	6
14138	28	66	4	6
14146	5	47	7	1
14154	12	47	4	6
14162	4	70	3	152
14170	28	45	3	216
14178	22	23	3	164
14186	8	45	4	7
14194	14	54	7	2
14202	19	57	3	18
14210	12	63	11	126
14218	3	43	4	7
14226	21	50	7	1
14234	11	10	5	3
14242	26	66	3	86
14250	25	43	5	3
14258	17	38	7	1
14266	2	30	3	161
14274	25	45	3	231
14282	28	44	7	1
14290	6	8	7	1
14298	26	41	13	109
14306	12	66	3	86
14314	6	51	4	6
14322	10	38	7	1
14330	12	31	6	206
14338	2	58	4	5
14346	18	35	7	2
14354	12	49	4	5
14362	26	12	7	1
14370	12	24	6	4
14378	20	47	5	3
14386	23	49	4	117
14394	28	71	4	6
14402	6	4	3	20
14410	8	1	6	4
14418	20	2	7	1
14426	12	44	4	7
14434	13	48	4	6
14442	4	73	4	5
14450	26	9	7	1
14458	19	23	4	6
14466	20	32	6	4
14474	18	29	9	228
14482	6	28	3	17
14490	14	57	4	79
14498	11	15	4	25
14506	26	30	7	1
14514	25	56	7	1
14522	25	7	4	5
14530	26	55	4	6
14538	13	24	3	137
14546	13	57	7	2
14554	6	53	4	7
14562	20	21	6	4
14570	2	36	4	110
14578	12	46	7	2
14586	12	32	3	75
14594	7	3	5	3
14602	5	47	5	3
14610	14	20	7	2
14618	10	40	9	228
14626	2	12	3	15
14634	13	17	7	2
14642	23	52	7	2
14650	6	38	7	2
14658	24	11	6	4
14666	21	49	4	7
14674	3	69	4	5
14682	11	71	4	56
14690	5	68	5	3
14698	14	30	3	68
14706	26	59	7	1
14714	20	3	9	228
14722	5	34	4	6
14730	3	9	4	5
14738	26	53	7	2
14746	26	6	4	7
14754	16	39	7	2
14762	18	58	9	228
14770	7	57	7	2
14778	12	66	4	6
14786	8	66	4	5
14794	22	28	9	228
14802	25	53	4	7
14810	18	11	9	228
14818	11	23	4	112
14826	27	29	4	5
14834	2	22	5	3
14842	11	39	6	4
14850	25	23	4	112
14858	11	29	6	4
14866	14	60	7	2
14874	6	5	7	1
14882	4	71	4	7
14890	3	54	10	221
14898	6	24	4	181
14906	14	10	4	7
14914	12	46	4	7
14922	19	18	6	4
14930	19	23	7	1
14938	3	49	3	151
14946	28	61	9	228
14954	23	34	4	7
14962	21	72	4	5
14970	26	68	9	228
14978	2	23	4	6
14986	14	21	5	3
14994	13	61	3	9
15002	28	5	3	171
15010	14	63	4	7
15018	21	57	4	79
15026	13	13	4	6
15034	19	32	3	75
15042	6	44	4	5
15050	18	32	4	36
15058	18	53	4	198
15066	28	52	10	154
15074	8	41	4	11
13824	25	70	7	1
13832	2	54	4	7
13840	28	4	7	1
13848	24	36	4	5
13856	6	46	4	230
13864	7	71	9	228
13872	22	40	4	78
13880	13	74	5	3
13888	23	34	4	5
13896	19	29	4	5
13904	17	35	4	7
13912	2	55	3	144
13920	4	54	3	221
13928	16	11	6	4
13936	5	21	4	142
13944	7	56	5	3
13952	8	1	7	1
13960	6	70	4	98
13968	12	8	4	6
13976	27	30	3	162
13984	20	41	13	109
13992	24	35	4	30
14000	13	56	4	46
14008	26	7	4	6
14016	4	33	9	228
14024	19	7	7	1
14032	13	32	9	228
14040	23	17	4	133
14048	25	31	9	228
14056	2	25	7	1
14064	26	72	7	2
14072	24	12	7	2
14080	15	48	4	6
14088	21	56	12	196
14096	9	62	7	1
14104	8	74	4	5
14112	27	59	4	5
14120	6	69	6	4
14128	9	37	7	2
14136	13	34	4	6
14144	16	6	6	4
14152	14	64	6	4
14160	21	25	4	7
14168	10	12	4	7
14176	28	36	6	4
14184	16	5	4	7
14192	6	35	4	6
14200	8	55	4	5
14208	27	44	4	6
14216	2	68	6	4
14224	2	70	4	60
14232	5	26	7	1
14240	23	40	4	78
14248	3	35	7	2
14256	24	21	4	142
14264	15	25	3	165
14272	8	58	4	5
14280	3	36	5	3
14288	14	2	4	5
14296	21	1	4	7
14304	12	20	4	7
14312	24	47	7	2
14320	25	57	3	18
14328	7	28	9	228
14336	18	53	4	7
14344	5	68	4	5
14352	23	64	4	6
14360	9	32	4	5
14368	6	74	3	69
14376	20	12	7	1
14384	25	54	5	3
14392	27	64	7	2
14400	25	18	7	2
14408	23	22	6	4
14416	25	25	4	104
14424	27	28	4	6
14432	22	56	12	122
14440	6	48	7	1
14448	5	16	7	1
14456	28	4	4	83
14464	18	68	6	4
14472	25	71	4	56
14480	27	11	4	5
14488	12	68	5	3
14496	16	51	5	3
14504	26	40	4	5
14512	8	65	4	173
14520	2	30	4	5
14528	24	5	3	119
14536	6	43	6	4
14544	3	15	6	4
14552	20	61	3	9
14560	12	72	3	72
14568	5	13	4	6
14576	6	56	7	1
14584	9	54	5	3
14592	18	39	9	228
14600	23	2	4	7
14608	4	31	7	1
14616	28	46	12	229
14624	17	56	3	196
14632	25	32	4	36
14640	4	53	3	203
14648	23	70	3	152
14656	24	67	4	41
14664	16	33	6	4
14672	9	18	7	2
14680	10	15	4	25
14688	17	47	6	4
14696	20	6	4	7
14704	4	4	4	5
14712	15	23	7	2
14720	20	21	9	228
14728	8	4	9	228
14736	15	48	4	81
14744	5	11	3	158
14752	13	59	4	6
14760	12	28	4	7
14768	8	65	6	4
14776	10	72	7	2
14784	13	61	5	3
14792	21	37	4	6
14800	9	47	9	228
14808	12	17	4	7
14816	23	42	4	7
14824	8	67	7	1
14832	15	54	4	6
14840	12	61	3	9
14848	6	68	4	42
14856	12	45	4	6
14864	23	70	9	228
14872	24	19	3	76
14880	9	70	7	1
14888	12	7	4	65
14896	2	59	4	5
14904	10	13	4	6
14912	28	70	4	7
14920	6	56	4	6
14928	4	11	9	228
14936	21	66	7	1
14944	6	70	7	2
14952	27	13	4	6
14960	17	53	4	198
14968	14	23	4	7
14976	6	43	3	232
14984	7	11	5	3
14992	16	32	4	7
15000	11	38	4	7
15008	14	68	4	42
15016	2	7	3	155
15024	27	18	4	180
15032	14	45	7	1
15040	3	46	7	2
15048	24	11	4	7
15056	8	72	4	7
15064	23	57	4	5
15072	22	28	3	17
13822	20	42	6	4
13830	15	6	6	4
13838	28	48	9	228
13846	21	49	4	45
13854	3	24	7	2
13862	27	20	6	4
13870	11	65	7	1
13878	14	56	5	3
13886	21	50	10	202
13894	14	48	5	3
13902	12	9	12	111
13910	21	28	3	138
13918	18	58	4	114
13926	9	43	4	7
13934	9	17	5	3
13942	8	65	3	150
13950	12	18	7	1
13958	26	4	4	83
13966	19	67	4	7
13974	15	6	5	3
13982	22	71	5	3
13990	21	55	7	1
13998	16	6	5	3
14006	17	1	6	4
14014	21	62	4	7
14022	21	42	4	6
14030	28	37	4	5
14038	20	7	4	6
14046	7	71	4	26
14054	23	26	4	31
14062	16	22	7	1
14070	28	60	11	169
14078	2	46	12	229
14086	20	63	5	3
14094	15	55	4	5
14102	13	63	5	3
14110	3	45	9	228
14118	13	58	5	3
14126	9	57	7	1
14134	15	11	3	132
14142	10	22	3	8
14150	9	6	5	3
14158	13	18	5	3
14166	12	18	6	4
14174	24	63	11	90
14182	17	17	4	6
14190	5	63	4	7
14198	27	66	7	2
14206	7	50	3	185
14214	14	3	4	157
14222	3	1	7	1
14230	16	11	4	7
14238	15	5	4	7
14246	12	6	3	120
14254	28	28	3	138
14262	15	16	4	25
14270	22	5	12	171
14278	16	58	4	5
14286	3	40	12	92
14294	2	40	4	5
14302	6	65	3	125
14310	18	11	5	3
14318	6	31	6	206
14326	7	34	9	228
14334	2	51	4	5
14342	20	63	11	126
14350	5	42	6	4
14358	21	56	12	146
14366	27	74	6	4
14374	24	42	7	2
14382	26	2	6	4
14390	26	34	9	228
14398	22	12	4	5
14406	10	54	7	1
14414	19	49	4	6
14422	15	68	9	228
14430	8	23	4	164
14438	3	70	7	1
14446	26	14	5	3
14454	27	6	5	3
14462	3	10	7	1
14470	18	7	6	4
14478	19	2	4	6
14486	6	53	4	176
14494	16	38	4	6
14502	6	71	5	3
14510	5	39	5	3
14518	21	70	4	7
14526	3	64	3	14
14534	9	49	7	1
14542	9	8	9	228
14550	12	64	9	228
14558	21	46	9	228
14566	11	56	12	196
14574	9	40	7	2
14582	26	56	4	172
14590	25	40	5	3
14598	25	52	4	95
14606	26	5	3	171
14614	17	18	7	2
14622	20	64	9	228
14630	13	67	9	228
14638	6	57	7	2
14646	11	29	9	228
14654	4	25	3	183
14662	21	57	4	7
14670	6	55	7	1
14678	16	69	5	3
14686	9	47	6	4
14694	2	28	7	1
14702	3	31	4	6
14710	15	5	3	143
14718	14	69	7	1
14726	23	38	4	19
14734	5	46	7	2
14742	9	18	4	193
14750	3	4	5	3
14758	27	14	5	3
14766	7	19	7	1
14774	5	7	5	3
14782	17	29	4	7
14790	6	45	7	1
14798	24	50	7	2
14806	9	71	7	2
14814	15	67	4	62
14822	8	28	4	6
14830	5	19	3	76
14838	22	10	4	7
14846	17	49	7	1
14854	6	39	5	3
14862	19	72	9	228
14870	26	25	4	7
14878	10	72	4	7
14886	4	2	4	6
14894	5	32	6	4
14902	7	26	4	31
14910	6	27	7	1
14918	27	43	3	101
14926	20	43	9	228
14934	24	55	3	159
14942	22	27	4	6
14950	23	43	4	59
14958	27	50	4	5
14966	18	6	4	7
14974	17	8	5	3
14982	25	20	4	6
14990	14	68	4	5
14998	6	22	4	6
15006	6	31	7	2
15014	2	18	9	228
15022	7	38	4	19
15030	4	72	6	4
15038	26	72	4	5
15046	26	6	5	3
15054	11	7	2	186
15062	9	36	4	30
15070	2	55	4	80
13827	3	46	7	1
13835	2	46	3	231
13843	12	53	6	4
13851	20	20	4	113
13859	12	10	5	3
13867	19	65	7	1
13875	2	4	5	3
13883	24	33	4	6
13891	11	70	7	1
13899	23	73	7	2
13907	24	53	4	176
13915	23	30	4	6
13923	2	64	9	228
13931	17	62	5	3
13939	22	10	3	190
13947	20	18	7	1
13955	7	50	10	202
13963	3	56	12	122
13971	27	23	4	112
13979	12	26	4	6
13987	11	54	10	221
13995	2	9	5	3
14003	25	27	5	3
14011	12	36	4	110
14019	13	42	4	6
14027	24	13	5	3
14035	21	34	7	1
14043	11	12	4	7
14051	25	56	12	147
14059	2	5	7	2
14067	5	45	3	201
14075	14	10	3	220
14083	17	45	9	228
14091	12	40	9	228
14099	10	73	6	4
14107	10	51	4	7
14115	2	52	3	95
14123	16	5	7	2
14131	10	73	5	3
14139	19	31	6	4
14147	11	40	13	78
14155	6	63	5	3
14163	21	64	7	2
14171	14	9	4	6
14179	27	37	4	5
14187	8	5	7	2
14195	16	19	4	7
14203	26	40	7	1
14211	24	43	4	59
14219	16	45	3	222
14227	8	69	4	5
14235	25	47	9	228
14243	10	33	7	1
14251	21	15	4	25
14259	13	55	7	1
14267	14	41	7	2
14275	23	66	5	3
14283	11	41	13	109
14291	11	16	7	2
14299	26	23	4	6
14307	13	9	7	2
14315	5	39	4	7
14323	17	55	3	144
14331	20	31	6	206
14339	5	21	6	4
14347	15	56	12	215
14355	4	25	4	5
14363	15	2	4	5
14371	27	8	4	55
14379	24	70	4	6
14387	19	46	4	227
14395	12	11	4	58
14403	9	22	4	6
14411	10	6	4	5
14419	23	72	5	3
14427	9	17	4	6
14435	25	56	4	46
14443	19	39	5	3
14451	3	62	4	5
14459	27	39	3	107
14467	13	25	9	228
14475	18	69	4	5
14483	5	36	5	3
14491	12	32	9	228
14499	5	22	3	73
14507	26	32	4	36
14515	23	25	4	5
14523	3	8	9	228
14531	12	67	7	2
14539	21	38	7	2
14547	12	30	3	162
14555	13	6	9	228
14563	5	52	7	1
14571	21	71	5	3
14579	22	31	4	7
14587	12	32	12	106
14595	8	33	6	4
14603	10	52	4	6
14611	16	66	4	5
14619	17	58	4	7
14627	9	69	4	5
14635	15	24	4	7
14643	22	23	4	164
14651	18	64	7	2
14659	6	61	6	4
14667	16	67	4	6
14675	27	57	4	7
14683	10	46	4	227
14691	19	25	3	183
14699	21	32	3	75
14707	13	43	4	59
14715	20	8	4	5
14723	4	42	4	6
14731	23	31	4	7
14739	28	72	4	5
14747	11	34	4	6
14755	3	8	6	4
14763	2	53	4	198
14771	5	35	4	30
14779	5	54	4	5
14787	5	56	12	196
14795	5	38	4	167
14803	26	38	4	7
14811	19	56	12	196
14819	2	8	7	2
14827	8	4	6	4
14835	24	4	4	5
14843	11	50	9	228
14851	5	7	4	65
14859	26	71	6	4
14867	6	48	4	6
14875	28	62	7	1
14883	17	55	4	80
14891	11	30	3	162
14899	3	22	4	5
14907	19	50	9	228
14915	2	56	3	196
14923	6	46	3	229
14931	19	29	6	4
14939	26	30	3	68
14947	14	52	4	95
14955	28	38	5	3
14963	16	50	7	2
14971	10	65	3	150
14979	23	53	5	3
14987	22	10	3	178
14995	23	74	4	7
15003	26	52	4	6
15011	17	23	4	112
15019	10	71	6	4
15027	2	22	4	5
15035	26	5	12	84
15043	14	28	4	7
15051	13	49	9	228
15059	14	35	9	228
15067	23	66	4	47
15075	28	46	4	211
13823	23	39	4	5
13831	24	51	2	212
13839	2	27	3	53
13847	22	17	4	180
13855	9	30	3	161
13863	15	46	9	228
13871	16	12	4	5
13879	18	24	4	7
13887	24	9	6	129
13895	6	71	4	7
13903	26	56	3	215
13911	13	5	12	171
13919	16	14	4	6
13927	10	35	4	7
13935	20	11	4	5
13943	27	60	6	4
13951	25	67	4	7
13959	13	34	5	3
13967	12	23	7	1
13975	14	27	12	191
13983	9	70	4	43
13991	5	31	7	1
13999	14	66	7	1
14007	8	6	5	3
14015	13	24	4	181
14023	27	58	6	4
14031	26	23	9	228
14039	11	69	9	228
14047	28	25	4	33
14055	3	17	7	1
14063	20	24	4	6
14071	20	11	4	58
14079	25	8	5	3
14087	12	47	7	1
14095	21	58	6	4
14103	6	70	4	5
14111	19	69	9	228
14119	18	51	7	2
14127	14	68	7	2
14135	23	11	3	132
14143	2	22	7	1
14151	21	71	7	1
14159	20	33	4	5
14167	12	23	6	4
14175	16	25	4	6
14183	6	37	5	3
14191	20	30	4	7
14199	21	56	9	228
14207	14	25	3	139
14215	10	45	3	231
14223	19	31	6	206
14231	2	49	4	7
14239	18	54	6	4
14247	25	70	4	6
14255	20	26	4	6
14263	5	71	4	7
14271	11	65	4	6
14279	13	44	4	192
14287	5	65	3	188
14295	23	30	3	68
14303	24	33	3	105
14311	16	13	7	1
14319	14	66	6	4
14327	24	45	7	1
14335	21	35	4	5
14343	12	16	6	4
14351	9	28	3	17
14359	19	56	12	174
14367	3	53	7	2
14375	3	15	4	7
14383	12	41	13	109
14391	26	32	4	7
14399	12	63	5	3
14407	26	39	4	6
14415	21	23	5	3
14423	16	34	4	5
14431	3	45	3	216
14439	7	24	3	137
14447	23	5	12	171
14455	25	35	3	166
14463	4	45	3	222
14471	12	53	9	228
14479	21	6	9	228
14487	2	62	5	3
14495	4	65	5	3
14503	4	29	6	4
14511	9	3	7	2
14519	6	32	5	3
14527	2	66	4	5
14535	7	18	4	5
14543	15	49	9	228
14551	26	53	9	228
14559	28	46	5	3
14567	28	16	3	57
14575	7	9	4	6
14583	6	11	5	3
14591	19	6	4	7
14599	17	18	4	133
14607	6	10	3	220
14615	25	21	9	228
14623	20	34	7	1
14631	13	37	7	1
14639	14	10	7	2
14647	28	61	4	5
14655	14	5	3	177
14663	26	67	4	7
14671	12	61	6	4
14679	23	31	9	228
14687	24	13	7	1
14695	26	21	9	228
14703	10	14	7	2
14711	27	52	10	154
14719	4	39	6	4
14727	27	9	12	70
14735	23	39	4	140
14743	12	25	9	228
14751	21	70	7	2
14759	4	46	3	226
14767	8	11	4	7
14775	16	7	7	2
14783	12	34	7	1
14791	12	71	6	4
14799	15	10	4	7
14807	9	65	6	4
14815	24	61	4	7
14823	14	67	6	4
14831	7	43	5	3
14839	16	22	5	3
14847	5	15	4	5
14855	24	21	7	2
14863	10	27	3	53
14871	17	18	4	193
14879	18	49	3	151
14887	2	36	4	30
14895	11	53	10	203
14903	25	27	7	1
14911	19	21	6	4
14919	24	43	3	232
14927	21	64	6	4
14935	12	24	3	137
14943	6	38	6	4
14951	28	45	4	6
14959	25	9	12	70
14967	14	42	4	7
14975	21	11	3	158
14983	11	36	5	3
14991	20	49	4	7
14999	27	43	9	228
15007	28	46	4	5
15015	5	36	9	228
15023	16	61	4	52
15031	3	56	12	196
15039	5	24	4	181
15047	28	67	7	2
15055	10	6	7	2
15063	5	64	6	4
15071	15	55	7	2
13828	10	62	5	3
13836	6	21	4	168
13844	26	23	4	112
13852	25	29	4	5
13860	6	3	12	189
13868	14	40	4	78
13876	14	52	9	228
13884	15	41	9	228
13892	24	18	4	180
13900	23	56	3	147
13908	11	6	3	120
13916	24	43	5	3
13924	8	68	6	4
13932	26	74	3	69
13940	16	40	12	92
13948	16	1	7	1
13956	14	14	9	228
13964	13	22	3	73
13972	20	6	3	120
13980	2	3	7	2
13988	17	22	5	3
13996	8	9	5	3
14004	19	22	3	8
14012	24	57	4	6
14020	28	64	9	228
14028	18	8	7	2
14036	26	56	3	122
14044	2	45	3	229
14052	4	63	3	126
14060	10	69	7	2
14068	23	57	7	2
14076	19	18	4	133
14084	27	14	7	1
14092	5	7	7	1
14100	15	5	3	119
14108	15	25	6	4
14116	9	48	4	5
14124	5	59	6	4
14132	26	45	4	5
14140	10	57	7	1
14148	5	23	12	137
14156	5	37	6	4
14164	9	54	7	1
14172	12	2	7	1
14180	8	48	5	3
14188	6	5	3	84
14196	11	40	7	2
14204	3	38	7	1
14212	5	74	4	7
14220	14	72	4	6
14228	14	74	3	135
14236	7	6	3	63
14244	28	27	7	2
14252	21	22	3	73
14260	25	42	9	228
14268	11	53	9	228
14276	8	1	8	148
14284	27	10	3	190
14292	10	17	5	3
14300	13	32	4	6
14308	17	57	6	4
14316	19	14	7	2
14324	5	44	3	130
14332	7	47	4	5
14340	12	49	10	224
14348	13	20	4	7
14356	11	56	12	174
14364	24	43	6	4
14372	21	18	4	6
14380	24	35	6	4
14388	12	54	4	5
14396	21	33	4	5
14404	25	40	13	78
14412	10	8	9	228
14420	4	5	5	3
14428	24	70	9	228
14436	24	12	4	5
14444	5	35	7	2
14452	6	19	4	6
14460	19	5	4	6
14468	25	6	3	63
14476	17	8	9	228
14484	4	33	4	5
14492	25	35	4	30
14500	15	28	3	138
14508	11	55	7	1
14516	19	8	4	5
14524	26	72	5	3
14532	5	63	7	1
14540	11	56	3	122
14548	18	54	10	221
14556	12	74	4	6
14564	25	56	3	122
14572	23	23	4	7
14580	7	55	12	159
14588	26	3	5	3
14596	6	52	3	154
14604	9	60	4	6
14612	20	61	6	4
14620	16	26	7	2
14628	15	3	4	157
14636	19	7	5	3
14644	6	38	4	167
14652	28	5	3	177
14660	18	63	11	126
14668	13	35	6	4
14676	5	33	4	5
14684	25	29	9	228
14692	28	67	9	228
14700	5	6	7	2
14708	3	44	5	3
14716	20	1	3	13
14724	18	52	7	1
14732	27	32	3	75
14740	15	39	4	140
14748	6	40	5	3
14756	7	6	6	4
14764	5	50	6	4
14772	6	8	4	28
14780	11	54	4	5
14788	8	73	6	4
14796	18	50	7	2
14804	9	4	5	3
14812	26	17	4	133
14820	6	36	4	5
14828	5	14	7	2
14836	19	40	4	39
14844	22	38	6	4
14852	7	43	4	59
14860	7	46	9	228
14868	18	53	10	203
14876	26	37	3	205
14884	5	34	7	1
14892	24	8	5	3
14900	8	40	4	7
14908	25	50	9	228
14916	5	74	4	6
14924	6	58	5	3
14932	23	71	4	5
14940	26	58	4	5
14948	3	64	7	2
14956	6	10	7	2
14964	28	23	4	7
14972	18	51	4	5
14980	2	27	4	5
14988	16	5	4	5
14996	14	43	6	4
15004	2	63	4	6
15012	5	38	7	2
15020	28	73	7	1
15028	2	46	4	227
15036	9	64	4	7
15044	26	21	7	2
15052	8	46	3	200
15060	9	39	6	4
15068	10	55	4	6
15076	8	12	9	228
14617	20	50	6	4
14625	15	20	9	228
14633	4	3	7	2
14641	14	51	4	6
14649	23	70	6	4
14657	26	32	3	75
14665	14	53	5	3
14673	23	20	9	228
14681	16	31	3	162
14689	11	52	4	6
14697	11	25	3	183
14705	27	51	7	1
14713	19	11	9	228
14721	11	72	3	72
14729	20	17	4	193
14737	25	38	4	64
14745	7	1	8	148
14753	25	19	3	76
14761	3	32	7	2
14769	27	11	3	24
14777	2	67	7	1
14785	22	49	4	7
14793	25	71	9	228
14801	16	4	6	4
14809	25	53	10	203
14817	16	67	7	1
14825	28	41	7	1
14833	9	56	12	147
14841	22	20	4	113
14849	6	3	6	4
14857	26	1	3	13
14865	9	58	7	2
14873	9	11	4	7
14881	8	8	7	2
14889	10	7	5	3
14897	6	19	7	1
14905	6	50	5	3
14913	23	23	7	2
14921	15	57	4	79
14929	22	56	12	82
14937	2	58	9	228
14945	22	52	4	95
14953	22	5	4	6
14961	19	17	4	7
14969	3	7	4	102
14977	6	17	6	4
14985	22	61	5	3
14993	2	11	4	58
15001	19	46	4	222
15009	26	64	5	3
15017	2	21	4	6
15025	9	12	6	4
15033	26	62	4	6
15041	10	56	4	172
15049	7	22	7	1
15057	22	46	4	5
15065	6	46	6	4
15073	27	61	9	228
15081	24	32	4	36
15089	27	53	10	203
15097	3	36	4	7
15105	26	70	4	7
15113	26	1	4	6
15121	7	23	7	2
15129	10	34	4	6
15137	21	21	6	4
15145	10	59	4	5
15153	14	59	4	6
15161	27	33	3	105
15169	24	38	4	167
15177	25	65	3	150
15185	18	6	3	63
15193	4	32	9	228
15201	19	7	4	131
15209	12	29	6	4
15217	15	40	7	1
15225	19	9	7	1
15233	26	41	7	1
15241	12	31	4	7
15249	7	52	4	95
15257	5	53	3	203
15265	2	31	7	1
15273	7	57	9	228
15281	14	70	9	228
15289	14	53	4	176
15297	17	44	6	4
15305	7	10	7	2
15313	21	43	9	228
15321	3	69	6	4
15329	21	5	3	119
15337	20	3	7	2
15345	17	15	4	5
15353	2	7	4	102
15361	14	8	4	6
15369	10	45	3	216
15377	16	18	4	7
15385	3	24	4	6
15393	2	40	9	228
15401	15	62	3	97
15409	19	20	7	1
15417	23	60	4	7
15425	23	37	4	30
15433	10	66	4	6
15441	27	24	9	228
15449	6	45	4	227
15457	10	60	3	169
15465	10	25	5	3
15473	11	4	4	83
15481	18	50	4	5
15489	23	34	5	3
15497	28	59	4	7
15505	23	43	4	6
15513	12	16	3	57
15521	5	56	12	82
15529	10	30	5	3
15537	8	56	4	46
15545	16	58	5	3
15553	7	5	12	177
15561	26	35	4	134
15569	3	21	6	4
15577	25	9	6	129
15585	3	62	4	7
15593	9	52	10	154
15601	22	37	4	7
15609	27	5	7	2
15617	20	33	7	1
15625	7	49	4	85
15633	22	9	7	2
15641	17	37	3	205
15649	2	58	6	4
15657	19	30	4	5
15665	17	61	9	228
15673	20	57	4	79
15681	9	72	5	3
15689	14	18	7	1
15697	8	15	3	57
15705	20	44	4	192
15713	20	7	6	4
15721	26	56	7	2
15729	22	6	7	2
15737	21	5	12	171
15745	19	70	4	60
15753	8	1	3	13
15761	4	53	9	228
15769	18	62	6	4
15777	10	54	4	7
15785	9	9	4	6
15793	19	1	7	1
15801	28	27	9	228
15809	22	43	12	101
15817	5	1	8	88
15825	23	58	7	1
15833	4	63	3	90
15841	13	65	7	1
15849	14	11	4	6
15857	26	13	7	2
15865	7	5	4	7
15078	19	38	7	2
15086	26	61	4	7
15094	4	44	5	3
15102	24	24	4	181
15110	26	39	3	107
15118	3	25	7	2
15126	3	11	4	58
15134	17	16	7	1
15142	23	19	4	6
15150	24	34	4	29
15158	16	35	7	1
15166	10	11	7	2
15174	12	7	2	186
15182	6	9	4	6
15190	15	2	9	228
15198	14	11	5	3
15206	20	56	12	122
15214	25	21	7	2
15222	7	17	6	4
15230	6	30	4	6
15238	25	29	4	7
15246	3	2	4	6
15254	5	10	3	220
15262	9	2	4	6
15270	19	45	3	216
15278	25	39	4	5
15286	27	15	7	1
15294	27	6	4	5
15302	26	67	4	41
15310	27	5	4	6
15318	6	21	4	7
15326	8	7	6	4
15334	10	71	9	228
15342	13	70	3	152
15350	20	32	4	5
15358	5	56	3	174
15366	25	60	4	6
15374	22	6	4	5
15382	24	12	3	15
15390	6	25	6	4
15398	5	60	11	169
15406	24	65	3	150
15414	23	20	7	2
15422	13	13	6	4
15430	22	74	3	69
15438	21	7	5	3
15446	3	71	7	1
15454	27	2	9	228
15462	22	27	6	4
15470	23	72	7	1
15478	10	11	4	5
15486	28	45	6	4
15494	23	38	4	167
15502	12	65	7	1
15510	24	6	4	6
15518	15	9	4	27
15526	27	10	6	4
15534	9	58	4	5
15542	4	28	7	2
15550	27	13	6	4
15558	14	16	6	4
15566	13	63	7	1
15574	23	29	6	206
15582	22	54	4	5
15590	25	67	4	62
15598	17	35	4	30
15606	23	32	4	6
15614	5	60	7	2
15622	20	60	6	4
15630	23	52	4	145
15638	20	45	3	200
15646	3	61	3	9
15654	22	47	5	3
15662	17	59	4	6
15670	7	29	3	162
15678	2	64	4	7
15686	26	34	7	2
15694	20	31	4	6
15702	5	49	4	7
15710	18	52	10	154
15718	17	22	4	7
15726	4	39	3	74
15734	28	7	4	102
15742	15	11	4	6
15750	19	32	4	5
15758	13	34	4	7
15766	21	45	3	232
15774	27	15	5	3
15782	24	62	6	4
15790	15	27	5	3
15798	23	5	5	3
15806	23	1	7	2
15814	11	41	7	1
15822	3	30	9	228
15830	13	62	4	5
15838	8	40	4	39
15846	20	27	12	191
15854	5	20	4	113
15862	15	13	5	3
15870	27	63	11	126
15878	14	46	3	226
15886	22	46	7	2
15894	3	62	7	2
15902	7	3	4	157
15910	9	40	4	5
15918	28	37	7	2
15926	21	26	4	6
15934	17	7	7	2
15942	14	46	4	222
15950	4	5	7	1
15958	15	5	3	40
15966	21	1	7	2
15974	12	43	3	101
15982	26	73	3	34
15990	18	22	5	3
15998	15	48	5	3
16006	18	70	4	43
16014	19	35	9	228
16022	27	7	4	131
16030	21	73	3	34
16038	12	60	4	7
16046	24	2	4	7
16054	9	11	5	3
16062	17	46	7	1
16070	17	58	4	114
16078	25	3	12	189
16086	19	28	4	7
16094	5	14	3	57
16102	23	41	9	228
16110	13	58	7	1
16118	11	42	9	228
16126	28	38	4	7
16134	21	44	7	1
16142	24	3	6	4
16150	28	53	4	5
16158	28	44	4	6
16166	21	63	4	6
16174	27	66	3	86
16182	19	22	4	5
16190	27	20	4	113
16198	16	65	3	150
16206	6	8	4	6
16214	14	52	4	7
16222	15	40	4	78
16230	5	45	12	216
16238	25	3	5	3
16246	10	54	5	3
16254	13	41	4	7
16262	14	23	4	164
16270	28	71	6	4
16278	26	29	4	5
16286	25	8	7	1
16294	21	58	7	1
16302	20	46	3	226
16310	18	61	9	228
16318	27	4	4	6
16326	10	5	4	6
15083	14	35	4	30
15091	25	30	4	6
15099	22	59	4	6
15107	21	61	3	9
15115	10	40	4	39
15123	6	18	4	5
15131	3	65	5	3
15139	21	64	4	5
15147	27	61	3	9
15155	6	56	12	208
15163	17	51	5	3
15171	21	56	12	82
15179	10	30	3	162
15187	26	53	10	203
15195	21	63	4	7
15203	16	26	9	228
15211	27	35	4	7
15219	10	7	4	65
15227	13	35	4	30
15235	11	40	12	92
15243	9	5	4	5
15251	17	23	4	6
15259	7	5	3	119
15267	2	37	3	195
15275	22	29	5	3
15283	27	14	4	25
15291	5	51	4	5
15299	15	24	5	3
15307	28	56	3	146
15315	17	45	4	5
15323	4	32	6	4
15331	3	26	5	3
15339	27	49	6	4
15347	14	7	4	23
15355	11	55	12	159
15363	13	52	3	154
15371	20	31	4	7
15379	18	56	3	82
15387	7	22	4	6
15395	10	56	3	82
15403	14	38	4	19
15411	14	53	6	4
15419	13	36	4	5
15427	19	20	4	7
15435	12	62	4	5
15443	2	28	12	194
15451	5	17	9	228
15459	26	73	4	6
15467	14	5	4	7
15475	25	1	4	6
15483	28	27	3	149
15491	15	50	7	1
15499	4	41	7	1
15507	24	17	9	228
15515	27	46	4	230
15523	4	25	9	228
15531	6	54	3	221
15539	6	52	4	7
15547	22	29	4	6
15555	12	3	4	157
15563	19	43	3	21
15571	8	52	4	95
15579	24	24	3	137
15587	16	52	4	95
15595	2	3	9	228
15603	28	7	4	65
15611	15	22	3	73
15619	16	10	3	220
15627	27	5	12	177
15635	18	41	4	6
15643	21	23	7	1
15651	18	6	7	1
15659	21	27	7	2
15667	22	49	10	224
15675	22	60	4	5
15683	13	42	6	4
15691	3	17	4	193
15699	15	45	12	229
15707	27	29	3	162
15715	4	3	4	5
15723	23	45	5	3
15731	18	51	7	1
15739	19	49	6	4
15747	26	74	7	2
15755	18	43	3	101
15763	17	32	3	75
15771	19	45	3	200
15779	5	27	12	191
15787	13	25	4	5
15795	16	27	7	1
15803	26	73	7	1
15811	20	64	4	5
15819	12	36	3	182
15827	9	63	4	48
15835	21	46	4	230
15843	13	57	4	5
15851	3	61	6	4
15859	15	48	6	4
15867	21	7	4	102
15875	11	28	6	4
15883	11	52	4	7
15891	6	47	4	7
15899	5	60	4	7
15907	28	46	7	2
15915	25	20	6	4
15923	25	17	6	4
15931	28	2	5	3
15939	13	7	4	131
15947	19	74	7	2
15955	17	24	7	2
15963	13	1	7	2
15971	10	10	6	4
15979	11	29	4	5
15987	14	6	6	4
15995	27	60	3	169
16003	14	7	4	5
16011	19	59	7	1
16019	7	24	5	3
16027	19	63	11	126
16035	17	53	4	7
16043	9	10	7	2
16051	16	6	4	49
16059	24	29	5	3
16067	13	18	7	1
16075	11	56	3	146
16083	7	38	4	64
16091	3	43	7	2
16099	13	38	4	167
16107	21	58	4	6
16115	12	10	3	204
16123	2	1	8	88
16131	8	1	4	6
16139	17	6	4	49
16147	7	10	4	5
16155	2	60	7	1
16163	25	55	4	80
16171	20	56	3	215
16179	14	17	4	103
16187	27	13	7	2
16195	28	35	4	5
16203	26	63	11	126
16211	6	49	4	5
16219	9	21	4	7
16227	18	33	3	105
16235	27	58	4	6
16243	18	70	7	1
16251	27	56	9	228
16259	2	21	7	2
16267	21	20	4	7
16275	8	64	5	3
16283	20	23	7	1
16291	26	16	9	228
16299	10	70	7	1
16307	20	24	9	228
16315	15	33	7	2
16323	12	56	9	228
16331	25	46	3	200
15080	12	56	12	82
15088	12	25	5	3
15096	16	8	5	3
15104	6	4	4	5
15112	17	39	9	228
15120	8	45	3	201
15128	25	26	4	5
15136	17	46	4	7
15144	12	56	12	122
15152	14	10	3	178
15160	8	5	4	5
15168	3	63	7	1
15176	7	21	4	7
15184	2	65	5	3
15192	27	18	4	160
15200	10	50	9	228
15208	15	63	11	90
15216	4	32	3	75
15224	23	26	7	1
15232	11	25	4	33
15240	4	72	9	228
15248	19	34	4	29
15256	3	2	7	1
15264	27	33	4	6
15272	13	61	6	4
15280	3	56	3	208
15288	9	56	7	1
15296	13	54	4	209
15304	19	1	3	13
15312	13	43	9	228
15320	23	37	7	1
15328	2	26	6	4
15336	23	24	6	4
15344	17	56	12	147
15352	23	51	4	6
15360	28	47	7	1
15368	25	64	5	3
15376	6	38	9	228
15384	24	69	5	3
15392	7	41	4	6
15400	4	4	5	3
15408	18	32	3	75
15416	8	12	6	4
15424	7	71	4	7
15432	26	57	3	18
15440	2	62	4	7
15448	7	10	9	228
15456	11	30	4	5
15464	19	36	3	182
15472	15	12	7	2
15480	14	29	4	6
15488	5	44	4	192
15496	27	33	3	71
15504	15	56	5	3
15512	20	39	4	7
15520	26	28	5	3
15528	20	22	4	5
15536	19	3	4	5
15544	2	21	6	4
15552	3	37	4	6
15560	26	70	4	6
15568	8	8	4	5
15576	3	37	3	205
15584	28	47	5	3
15592	10	25	4	33
15600	2	56	3	122
15608	12	45	3	226
15616	3	72	3	72
15624	19	51	7	1
15632	22	58	4	6
15640	8	48	7	1
15648	12	30	4	5
15656	8	28	12	194
15664	6	15	9	228
15672	15	34	5	3
15680	6	5	3	40
15688	17	61	5	3
15696	8	64	4	7
15704	9	59	7	1
15712	11	35	4	5
15720	24	6	4	49
15728	24	58	4	5
15736	23	21	7	1
15744	23	38	4	64
15752	4	40	4	5
15760	15	10	3	210
15768	19	4	7	1
15776	18	6	4	49
15784	4	43	4	5
15792	27	45	3	232
15800	13	24	6	4
15808	2	61	3	9
15816	20	15	6	4
15824	2	29	6	4
15832	17	14	4	6
15840	28	34	6	4
15848	12	31	7	1
15856	18	64	5	3
15864	25	61	4	5
15872	7	5	3	143
15880	9	18	4	5
15888	26	27	4	7
15896	25	62	5	3
15904	16	28	3	17
15912	16	53	4	176
15920	9	15	3	57
15928	8	71	4	26
15936	16	20	4	6
15944	21	28	5	3
15952	25	16	4	7
15960	13	41	7	2
15968	6	49	4	85
15976	8	57	9	228
15984	24	47	9	228
15992	26	66	4	47
16000	12	18	4	6
16008	21	2	5	3
16016	20	46	4	227
16024	3	3	7	2
16032	2	20	4	6
16040	16	57	9	228
16048	16	6	4	6
16056	22	65	12	188
16064	5	61	6	4
16072	24	5	7	1
16080	6	58	7	1
16088	2	61	7	2
16096	3	72	4	5
16104	11	55	4	80
16112	11	24	9	228
16120	16	5	12	84
16128	12	46	3	226
16136	9	22	6	4
16144	2	63	4	48
16152	26	43	3	21
16160	5	6	3	120
16168	28	36	4	6
16176	23	22	4	6
16184	20	42	5	3
16192	15	31	4	7
16200	5	46	3	200
16208	6	20	7	2
16216	25	7	9	228
16224	26	10	3	178
16232	13	15	4	25
16240	28	52	6	4
16248	11	31	7	1
16256	25	10	9	228
16264	26	28	6	4
16272	13	56	6	4
16280	24	15	9	228
16288	6	40	7	1
16296	5	62	4	5
16304	5	15	5	3
16312	8	9	7	1
16320	11	52	10	154
16328	18	49	6	4
15082	13	14	4	5
15090	24	22	3	73
15098	3	58	9	228
15106	22	45	4	6
15114	20	52	7	1
15122	3	63	4	6
15130	6	49	7	2
15138	27	64	4	5
15146	12	13	4	6
15154	14	61	5	3
15162	23	7	4	23
15170	19	3	7	2
15178	4	30	3	162
15186	14	74	4	7
15194	22	55	4	7
15202	18	71	4	56
15210	6	25	9	228
15218	21	46	4	5
15226	12	1	8	88
15234	9	44	9	228
15242	19	27	3	53
15250	27	37	3	205
15258	9	56	3	122
15266	27	38	5	3
15274	21	38	9	228
15282	10	29	7	2
15290	22	63	11	90
15298	9	25	4	67
15306	18	50	6	4
15314	15	63	9	228
15322	28	24	9	228
15330	26	29	9	228
15338	11	45	3	216
15346	24	7	4	5
15354	24	6	3	63
15362	14	19	4	6
15370	8	32	4	7
15378	14	25	4	5
15386	11	9	12	70
15394	23	55	4	7
15402	10	12	5	3
15410	26	46	5	3
15418	6	24	3	137
15426	24	68	4	5
15434	12	49	5	3
15442	8	45	3	225
15450	26	9	6	129
15458	27	27	4	7
15466	12	46	4	227
15474	22	28	4	5
15482	22	59	7	2
15490	22	42	5	3
15498	6	28	3	138
15506	6	16	4	7
15514	5	57	9	228
15522	21	57	4	5
15530	27	34	7	2
15538	8	43	4	59
15546	16	26	4	5
15554	6	3	4	157
15562	3	32	3	75
15570	23	14	9	228
15578	14	46	3	229
15586	3	22	7	2
15594	25	20	9	228
15602	22	52	5	3
15610	6	2	4	7
15618	24	50	4	5
15626	20	25	4	5
15634	19	25	5	3
15642	9	19	7	1
15650	11	43	3	101
15658	15	47	4	5
15666	25	48	4	81
15674	25	60	7	2
15682	13	36	7	1
15690	16	64	4	7
15698	22	13	5	3
15706	27	14	7	2
15714	10	53	9	228
15722	26	45	4	230
15730	28	26	7	1
15738	19	73	4	6
15746	25	2	7	2
15754	24	51	7	1
15762	9	37	3	205
15770	2	22	7	2
15778	8	38	4	94
15786	23	46	3	229
15794	23	2	5	3
15802	20	45	3	226
15810	27	36	4	6
15818	6	42	4	7
15826	28	39	6	4
15834	2	23	5	3
15842	24	64	5	3
15850	5	18	4	160
15858	14	66	4	7
15866	2	64	7	2
15874	2	25	4	7
15882	21	22	4	5
15890	7	12	4	141
15898	3	21	9	228
15906	10	11	3	24
15914	7	8	7	1
15922	22	56	6	4
15930	26	44	4	6
15938	7	72	4	6
15946	3	46	3	231
15954	5	61	5	3
15962	6	9	7	2
15970	28	36	3	182
15978	15	22	4	6
15986	24	59	7	1
15994	16	22	6	4
16002	14	64	4	6
16010	2	57	4	7
16018	26	21	4	5
16026	4	61	3	9
16034	4	29	5	3
16042	12	7	4	102
16050	28	67	4	5
16058	10	24	7	2
16066	26	60	3	169
16074	11	28	4	7
16082	16	25	6	4
16090	6	67	9	228
16098	26	33	4	35
16106	9	17	6	4
16114	9	35	4	7
16122	15	30	4	6
16130	21	6	7	2
16138	22	46	9	228
16146	9	41	7	1
16154	11	63	11	126
16162	10	37	3	205
16170	16	9	12	70
16178	20	3	4	5
16186	22	39	4	5
16194	9	62	5	3
16202	20	46	4	230
16210	22	52	4	7
16218	12	56	3	215
16226	5	53	4	176
16234	6	24	5	3
16242	10	67	7	2
16250	12	47	5	3
16258	6	21	5	3
16266	22	27	3	123
16274	5	37	4	6
16282	4	54	9	228
16290	20	16	9	228
16298	21	49	10	224
16306	13	56	9	228
16314	4	2	4	7
16322	24	28	12	194
16330	22	5	3	40
15084	13	64	4	5
15092	13	35	7	2
15100	22	28	4	7
15108	28	24	6	4
15116	7	45	12	216
15124	20	11	9	228
15132	26	46	3	201
15140	20	56	12	82
15148	10	56	12	196
15156	25	61	7	2
15164	22	28	7	2
15172	15	22	3	137
15180	5	66	7	1
15188	16	65	6	4
15196	26	43	4	7
15204	11	30	7	1
15212	9	46	4	7
15220	18	20	4	6
15228	17	74	3	16
15236	26	22	7	1
15244	15	18	4	103
15252	19	1	8	88
15260	4	64	7	2
15268	8	74	3	16
15276	15	49	4	45
15284	3	39	5	3
15292	14	8	7	1
15300	12	38	9	228
15308	25	25	6	4
15316	25	6	6	4
15324	27	10	9	228
15332	6	39	4	5
15340	25	43	4	7
15348	25	11	3	132
15356	10	72	3	72
15364	25	8	4	28
15372	17	50	7	2
15380	5	32	12	106
15388	20	58	4	114
15396	5	66	4	6
15404	3	14	4	7
15412	18	72	3	72
15420	9	67	7	1
15428	24	22	5	3
15436	26	27	7	2
15444	27	6	3	120
15452	27	35	4	134
15460	16	56	3	82
15468	27	7	5	3
15476	7	57	4	5
15484	24	43	3	21
15492	16	71	4	26
15500	22	40	7	1
15508	10	72	4	5
15516	15	59	4	136
15524	23	56	6	4
15532	23	3	4	6
15540	9	6	7	1
15548	21	31	6	206
15556	13	26	7	1
15564	27	48	4	7
15572	16	56	3	122
15580	25	54	6	4
15588	6	47	7	2
15596	16	25	4	67
15604	13	45	3	232
15612	19	57	6	4
15620	27	60	5	3
15628	15	74	3	69
15636	7	5	12	171
15644	14	49	4	85
15652	17	30	6	4
15660	8	56	3	82
15668	13	27	3	123
15676	28	15	4	25
15684	18	9	7	1
15692	16	15	3	57
15700	14	13	5	3
15708	14	11	7	1
15716	4	35	9	228
15724	26	7	6	4
15732	12	64	4	5
15740	22	29	7	1
15748	24	69	7	1
15756	12	47	6	4
15764	8	32	4	36
15772	2	15	3	57
15780	10	57	4	7
15788	23	52	4	5
15796	6	24	4	7
15804	23	69	4	7
15812	28	68	7	1
15820	7	47	9	228
15828	9	23	4	5
15836	2	50	9	228
15844	25	38	4	6
15852	2	1	3	13
15860	28	17	4	5
15868	18	49	4	7
15876	17	18	4	5
15884	23	10	3	210
15892	6	38	4	6
15900	14	17	4	5
15908	2	22	4	7
15916	26	33	4	6
15924	11	70	4	60
15932	20	4	7	1
15940	5	5	4	6
15948	2	32	12	106
15956	7	17	4	180
15964	7	51	4	6
15972	9	53	4	7
15980	9	15	9	228
15988	21	71	6	4
15996	22	56	12	146
16004	5	45	4	6
16012	13	2	5	3
16020	5	68	4	42
16028	24	52	3	154
16036	14	10	4	5
16044	11	14	7	2
16052	25	28	12	194
16060	6	37	7	1
16068	6	10	5	3
16076	8	27	3	53
16084	27	4	4	83
16092	10	57	5	3
16100	15	45	4	7
16108	22	34	5	3
16116	11	44	3	179
16124	19	6	3	120
16132	6	63	7	1
16140	2	65	3	150
16148	5	67	7	2
16156	12	48	7	2
16164	13	34	6	4
16172	2	56	12	82
16180	9	5	12	84
16188	13	60	4	7
16196	8	40	12	92
16204	6	69	4	6
16212	16	21	7	2
16220	20	24	6	4
16228	17	1	4	6
16236	7	58	7	1
16244	9	38	7	1
16252	10	16	3	57
16260	23	17	4	103
16268	14	27	3	123
16276	27	12	7	1
16284	22	44	12	179
16292	10	33	3	105
16300	8	30	5	3
16308	20	26	7	1
16316	23	33	7	2
16324	26	71	7	2
16332	13	50	3	185
15079	26	57	6	4
15087	17	61	4	52
15095	19	4	5	3
15103	8	35	7	1
15111	27	46	4	211
15119	8	13	4	5
15127	3	23	7	1
15135	25	18	4	5
15143	9	55	4	6
15151	17	45	4	211
15159	2	5	4	5
15167	25	40	12	92
15175	21	73	7	1
15183	7	1	4	6
15191	20	62	7	1
15199	22	53	6	4
15207	17	56	7	1
15215	17	18	9	228
15223	2	26	9	228
15231	3	47	5	3
15239	26	71	4	5
15247	12	17	9	228
15255	4	34	7	1
15263	20	61	7	2
15271	16	49	4	6
15279	28	7	4	23
15287	13	57	9	228
15295	21	6	4	5
15303	20	38	9	228
15311	2	51	9	228
15319	18	25	4	67
15327	15	66	4	47
15335	12	72	4	5
15343	23	21	4	168
15351	23	65	3	125
15359	21	5	4	6
15367	6	56	3	174
15375	13	23	4	7
15383	28	54	7	1
15391	20	9	7	1
15399	18	71	9	228
15407	18	8	4	5
15415	10	60	7	1
15423	4	70	4	60
15431	20	62	4	5
15439	3	54	4	7
15447	9	25	4	33
15455	16	28	12	194
15463	10	28	6	4
15471	23	19	6	4
15479	4	28	4	7
15487	22	45	6	4
15495	9	14	7	1
15503	21	47	5	3
15511	26	70	7	1
15519	25	4	4	83
15527	26	54	5	3
15535	10	70	4	60
15543	24	10	4	7
15551	8	55	9	228
15559	8	45	12	216
15567	4	22	9	228
15575	14	54	4	5
15583	20	18	4	160
15591	3	71	4	6
15599	2	8	4	5
15607	22	40	4	6
15615	28	16	6	4
15623	12	73	7	1
15631	14	9	7	2
15639	17	19	7	1
15647	6	39	7	2
15655	23	59	4	136
15663	7	55	3	159
15671	12	15	5	3
15679	22	57	4	5
15687	22	5	6	4
15695	22	7	4	102
15703	27	63	4	6
15711	13	39	4	7
15719	10	52	10	154
15727	14	10	5	3
15735	14	60	4	5
15743	26	57	5	3
15751	26	4	4	6
15759	10	43	3	101
15767	10	5	3	171
15775	22	52	3	95
15783	17	32	5	3
15791	3	45	4	6
15799	13	17	4	5
15807	20	17	5	3
15815	10	29	4	5
15823	14	55	7	1
15831	9	46	3	225
15839	11	56	3	223
15847	19	6	4	49
15855	19	50	4	5
15863	13	31	6	206
15871	12	24	7	2
15879	26	2	7	2
15887	7	43	12	101
15895	21	65	7	1
15903	19	24	7	2
15911	22	11	4	6
15919	5	52	4	7
15927	22	8	4	6
15935	26	49	2	217
15943	10	56	3	146
15951	6	55	3	159
15959	27	12	4	6
15967	24	27	4	6
15975	7	10	3	204
15983	16	56	3	174
15991	9	54	6	4
15999	12	55	3	159
16007	12	20	4	113
16015	15	54	4	209
16023	19	2	6	4
16031	23	54	4	209
16039	2	3	4	7
16047	17	68	9	228
16055	20	14	4	7
16063	7	56	6	4
16071	17	50	4	5
16079	6	53	6	4
16087	7	53	5	3
16095	4	64	4	5
16103	21	45	3	200
16111	25	39	7	2
16119	19	31	4	6
16127	6	46	3	226
16135	26	11	3	24
16143	20	2	5	3
16151	27	28	6	4
16159	2	43	7	2
16167	17	17	6	4
16175	12	63	7	1
16183	3	43	9	228
16191	26	26	4	6
16199	17	11	3	132
16207	7	52	7	2
16215	5	53	6	4
16223	5	54	10	221
16231	13	63	4	6
16239	15	39	3	107
16247	16	25	9	228
16255	6	10	3	204
16263	24	7	7	2
16271	10	73	7	1
16279	11	53	6	4
16287	28	66	6	4
16295	25	33	3	71
16303	21	39	5	3
16311	9	1	7	1
16319	9	58	4	114
16327	28	44	12	179
15509	19	18	4	160
15517	16	50	9	228
15525	26	28	3	161
15533	9	67	4	7
15541	20	65	7	1
15549	16	56	4	6
15557	13	15	5	3
15565	26	56	4	7
15573	25	22	5	3
15581	13	46	4	230
15589	5	16	3	57
15597	25	24	4	7
15605	23	17	4	180
15613	24	67	6	4
15621	21	60	5	3
15629	28	18	7	1
15637	11	9	6	129
15645	10	12	7	1
15653	9	46	3	222
15661	6	54	6	4
15669	14	26	7	1
15677	15	32	4	6
15685	25	21	4	5
15693	28	73	3	34
15701	15	49	4	5
15709	22	31	6	206
15717	17	8	4	28
15725	6	7	4	7
15733	24	57	6	4
15741	21	42	6	4
15749	23	24	5	3
15757	22	49	4	85
15765	9	71	4	26
15773	2	30	7	2
15781	20	16	7	2
15789	13	14	7	2
15797	23	74	3	69
15805	26	20	6	4
15813	3	67	4	7
15821	17	3	5	3
15829	17	63	4	48
15837	22	7	5	3
15845	15	9	9	228
15853	26	53	4	5
15861	23	59	9	228
15869	16	68	4	42
15877	15	32	7	1
15885	6	62	4	5
15893	25	7	7	2
15901	22	10	5	3
15909	25	30	3	161
15917	16	40	5	3
15925	7	16	4	7
15933	28	36	7	1
15941	14	20	9	228
15949	6	56	6	4
15957	5	52	3	154
15965	22	33	7	2
15973	8	61	4	7
15981	21	70	4	98
15989	9	68	9	228
15997	21	27	12	191
16005	6	60	4	7
16013	22	5	3	143
16021	12	74	6	4
16029	18	64	4	5
16037	9	57	6	4
16045	9	46	12	216
16053	21	46	7	2
16061	8	29	7	2
16069	17	15	7	2
16077	14	9	6	4
16085	3	70	4	60
16093	15	25	4	6
16101	28	18	4	32
16109	2	60	11	169
16117	22	50	4	6
16125	23	25	3	165
16133	13	38	4	64
16141	17	55	4	5
16149	12	2	5	3
16157	19	24	9	228
16165	25	43	4	59
16173	17	70	4	43
16181	18	43	5	3
16189	7	60	9	228
16197	17	6	4	6
16205	13	40	4	6
16213	21	34	5	3
16221	16	6	7	1
16229	2	40	12	92
16237	7	20	6	4
16245	7	7	4	5
16253	4	18	4	160
16261	21	56	6	4
16269	21	20	4	113
16277	13	50	7	1
16285	16	57	7	2
16293	8	3	4	7
16301	20	65	3	188
16309	6	10	3	178
16317	22	41	7	2
16325	13	5	3	177
16333	25	49	2	217
16341	17	56	12	208
16349	11	54	5	3
16357	24	54	3	221
16365	5	59	4	6
16373	10	56	7	2
16381	11	56	12	214
16389	18	45	3	231
16397	17	12	3	87
16405	22	74	3	135
16413	25	19	7	1
16421	6	5	3	177
16429	3	7	4	7
16437	16	70	4	60
16445	14	36	4	6
16453	8	48	4	6
16461	17	3	6	4
16469	25	71	4	7
16477	21	46	3	232
16485	9	43	9	228
16493	10	53	4	7
16501	17	36	5	3
16509	12	74	7	2
16517	25	31	6	206
16525	21	74	3	135
16533	21	11	3	24
16541	3	10	4	7
16549	24	44	3	130
16557	28	55	12	159
16565	26	49	4	5
16573	11	74	4	7
16581	7	47	5	3
16589	19	33	3	105
16597	27	3	4	157
16605	5	65	4	6
16613	10	15	9	228
16621	9	15	4	7
16629	10	52	4	95
16637	8	20	9	228
16645	23	9	4	5
16653	26	42	4	5
16661	4	9	12	111
16669	28	46	12	216
16677	19	48	9	228
16685	2	50	4	5
16693	16	31	9	228
16701	12	41	4	7
16709	28	57	7	1
16717	15	55	3	159
16725	23	55	3	159
16733	23	25	4	104
16741	19	4	4	6
16749	13	14	3	57
16757	8	34	4	7
15873	13	5	3	143
15881	14	20	4	5
15889	27	59	7	2
15897	21	14	3	57
15905	2	42	4	6
15913	27	65	7	1
15921	8	14	7	1
15929	22	58	7	1
15937	8	62	6	4
15945	18	56	3	146
15953	20	61	4	5
15961	7	27	12	191
15969	22	60	5	3
15977	21	69	4	6
15985	16	23	4	5
15993	6	74	4	7
16001	20	63	4	6
16009	3	58	4	114
16017	13	49	4	5
16025	13	48	6	4
16033	13	14	9	228
16041	7	70	4	98
16049	12	23	4	6
16057	26	6	3	63
16065	26	12	4	6
16073	4	3	6	4
16081	19	56	3	146
16089	20	60	4	7
16097	28	33	4	7
16105	20	67	9	228
16113	9	55	4	5
16121	27	45	3	200
16129	27	6	7	2
16137	13	44	7	1
16145	13	20	4	113
16153	9	52	4	6
16161	26	39	6	4
16169	28	1	7	2
16177	15	39	4	5
16185	17	43	4	7
16193	22	32	4	6
16201	25	33	4	35
16209	3	12	3	87
16217	21	30	3	162
16225	13	50	10	202
16233	24	28	7	2
16241	20	63	7	1
16249	23	16	4	25
16257	3	56	3	223
16265	22	3	4	157
16273	9	12	3	87
16281	21	41	4	7
16289	13	16	6	4
16297	8	5	12	84
16305	11	15	5	3
16313	10	73	4	6
16321	4	27	4	6
16329	22	55	7	1
16337	10	68	5	3
16345	3	32	4	5
16353	10	53	7	2
16361	6	57	4	5
16369	4	30	4	5
16377	14	5	3	143
16385	6	37	4	6
16393	9	3	4	7
16401	6	39	9	228
16409	20	20	4	7
16417	15	38	6	4
16425	15	46	6	4
16433	28	17	4	180
16441	20	43	3	21
16449	13	72	7	1
16457	26	46	4	230
16465	17	27	4	6
16473	8	41	7	1
16481	14	66	9	228
16489	5	67	4	7
16497	18	15	9	228
16505	13	21	4	5
16513	24	73	7	1
16521	8	45	3	222
16529	10	54	3	221
16537	21	7	4	5
16545	11	35	6	4
16553	26	28	9	228
16561	20	39	9	228
16569	24	25	4	5
16577	7	18	4	6
16585	28	17	4	160
16593	16	32	4	5
16601	23	41	6	4
16609	14	45	3	226
16617	10	61	6	4
16625	15	36	7	1
16633	17	49	7	2
16641	6	17	4	180
16649	18	38	4	128
16657	8	24	4	7
16665	19	51	4	7
16673	22	1	9	228
16681	7	34	5	3
16689	4	10	5	3
16697	6	1	7	2
16705	9	12	4	141
16713	28	12	5	3
16721	3	61	4	5
16729	3	30	7	2
16737	20	33	4	7
16745	8	16	4	7
16753	2	48	7	2
16761	26	6	4	49
16769	21	10	3	219
16777	17	74	3	135
16785	5	56	12	215
16793	20	42	4	51
16801	6	17	4	66
16809	24	30	6	4
16817	7	57	4	6
16825	17	66	7	2
16833	10	66	3	86
16841	5	45	3	231
16849	25	53	9	228
16857	6	14	7	2
16865	25	16	4	5
16873	10	46	3	222
16881	11	44	12	179
16889	20	36	7	1
16897	27	17	7	1
16905	22	18	4	7
16913	26	47	7	2
16921	17	28	6	4
16929	20	63	4	48
16937	18	14	7	1
16945	9	9	4	27
16953	14	61	4	6
16961	4	1	7	2
16969	23	8	6	4
16977	2	7	7	1
16985	13	43	4	6
16993	12	59	7	2
17001	19	52	6	4
17009	19	5	7	2
17017	24	50	7	1
17025	21	3	4	6
17033	20	60	5	3
17041	18	24	4	5
17049	20	27	3	149
17057	8	48	4	7
17065	7	70	4	43
17073	20	62	9	228
17081	25	9	6	4
17089	25	56	2	223
17097	22	5	5	3
17105	14	1	4	5
17113	10	4	4	6
17121	8	19	7	1
16336	2	44	5	3
16344	19	37	4	6
16352	13	20	9	228
16360	8	63	4	5
16368	6	9	4	27
16376	19	7	3	155
16384	18	42	7	2
16392	19	56	4	7
16400	26	33	3	71
16408	15	17	4	66
16416	21	46	3	226
16424	6	34	4	7
16432	19	18	4	103
16440	21	71	4	56
16448	21	56	5	3
16456	16	43	7	2
16464	27	55	7	1
16472	12	50	3	202
16480	20	20	7	2
16488	13	16	5	3
16496	20	29	4	5
16504	20	70	4	98
16512	12	65	4	6
16520	7	7	4	65
16528	26	9	4	27
16536	27	7	4	5
16544	5	70	4	6
16552	14	2	12	175
16560	15	52	6	4
16568	18	68	5	3
16576	3	62	6	4
16584	26	14	7	2
16592	28	2	4	5
16600	10	45	12	216
16608	8	44	5	3
16616	10	11	3	158
16624	3	51	2	212
16632	19	29	3	161
16640	27	27	4	5
16648	16	48	4	81
16656	12	17	4	180
16664	4	8	4	6
16672	18	37	7	2
16680	9	23	9	228
16688	17	45	3	226
16696	19	38	4	94
16704	2	38	5	3
16712	12	47	4	38
16720	17	67	5	3
16728	4	71	4	6
16736	5	60	5	3
16744	8	51	7	1
16752	18	12	4	6
16760	4	9	4	7
16768	5	62	9	228
16776	22	59	9	228
16784	17	33	3	71
16792	12	52	4	145
16800	8	53	5	3
16808	12	46	3	231
16816	27	45	4	222
16824	13	7	7	2
16832	10	41	4	7
16840	24	57	4	79
16848	21	28	9	228
16856	11	54	3	221
16864	26	8	4	7
16872	23	10	7	1
16880	15	44	4	156
16888	8	37	7	1
16896	6	64	7	1
16904	26	41	6	4
16912	7	17	4	66
16920	19	15	3	57
16928	24	9	6	4
16936	12	13	5	3
16944	3	31	3	161
16952	6	62	6	4
16960	12	16	4	5
16968	10	74	9	228
16976	15	7	9	228
16984	25	25	7	1
16992	26	62	5	3
17000	17	62	3	97
17008	26	17	7	1
17016	10	45	4	227
17024	22	65	9	228
17032	17	40	7	1
17040	19	56	4	5
17048	17	42	9	228
17056	16	3	12	189
17064	24	13	4	7
17072	21	57	7	1
17080	26	25	4	6
17088	2	49	5	3
17096	7	20	4	5
17104	21	29	4	6
17112	8	69	7	1
17120	24	14	4	6
17128	23	53	4	6
17136	7	11	12	96
17144	15	50	4	7
17152	26	46	4	6
17160	15	44	7	2
17168	3	26	4	6
17176	26	11	7	1
17184	18	17	4	160
17192	4	2	5	3
17200	17	64	7	1
17208	12	46	4	211
17216	19	38	5	3
17224	8	74	5	3
17232	7	11	4	7
17240	24	19	5	3
17248	4	17	4	103
17256	28	40	9	228
17264	24	30	4	6
17272	21	10	4	6
17280	18	19	5	3
17288	24	40	4	78
17296	19	57	7	1
17304	25	5	4	5
17312	17	25	3	139
17320	24	65	4	173
17328	23	41	4	11
17336	18	56	4	5
17344	14	56	4	46
17352	22	56	4	46
17360	27	3	7	2
17368	9	49	10	170
17376	2	5	9	228
17384	15	71	7	1
17392	12	10	4	6
17400	27	60	11	169
17408	11	37	4	5
17416	11	73	6	4
17424	23	51	2	212
17432	18	7	2	186
17440	2	12	4	7
17448	18	42	4	51
17456	6	7	4	23
17464	20	69	4	5
17472	15	14	4	6
17480	2	71	6	4
17488	2	66	9	228
17496	21	49	7	1
17504	8	72	4	6
17512	4	65	7	2
17520	2	51	4	7
17528	17	47	4	5
17536	25	44	9	228
17544	6	26	4	7
17552	26	31	6	4
17560	22	56	3	208
17568	9	42	4	5
17576	26	33	5	3
17584	16	74	3	69
16340	16	5	3	119
16348	7	21	4	5
16356	8	29	6	207
16364	22	6	9	228
16372	10	15	5	3
16380	10	67	4	7
16388	27	9	4	7
16396	2	9	7	1
16404	28	60	6	4
16412	26	42	9	228
16420	19	31	7	1
16428	17	54	6	4
16436	3	5	3	119
16444	26	18	7	1
16452	7	44	4	6
16460	5	33	4	6
16468	19	71	4	7
16476	20	50	3	202
16484	8	32	4	5
16492	20	24	5	3
16500	20	26	2	187
16508	22	55	4	6
16516	26	65	3	188
16524	8	72	3	118
16532	25	11	4	5
16540	9	56	12	82
16548	20	35	5	3
16556	7	56	12	146
16564	22	60	6	4
16572	13	74	3	69
16580	3	67	4	41
16588	4	49	6	4
16596	19	21	4	142
16604	23	74	4	5
16612	5	16	7	2
16620	24	68	5	3
16628	21	72	7	1
16636	6	29	7	1
16644	22	67	4	6
16652	16	70	3	152
16660	16	38	5	3
16668	5	70	4	5
16676	6	60	4	5
16684	24	65	4	6
16692	2	41	4	6
16700	18	49	2	217
16708	17	7	4	6
16716	3	31	5	3
16724	21	56	3	147
16732	15	53	7	1
16740	4	30	4	7
16748	2	5	3	171
16756	7	29	6	206
16764	14	39	7	2
16772	3	45	3	200
16780	7	15	9	228
16788	4	62	7	2
16796	11	23	3	164
16804	3	39	4	6
16812	16	29	4	5
16820	2	53	9	228
16828	11	41	4	7
16836	7	73	9	228
16844	18	44	3	130
16852	24	18	4	160
16860	24	52	7	2
16868	26	59	4	7
16876	20	70	4	60
16884	4	42	5	3
16892	16	63	9	228
16900	11	10	3	153
16908	17	55	4	116
16916	8	62	3	97
16924	13	73	9	228
16932	2	51	7	1
16940	10	14	7	1
16948	4	49	4	5
16956	20	73	4	7
16964	10	39	4	6
16972	26	45	4	7
16980	9	74	3	69
16988	16	63	11	90
16996	3	7	4	6
17004	16	22	3	137
17012	10	72	7	1
17020	18	39	4	6
17028	11	10	3	190
17036	3	56	3	215
17044	4	27	3	123
17052	20	19	7	2
17060	20	25	3	165
17068	19	46	12	216
17076	7	37	4	7
17084	11	63	4	48
17092	27	30	4	5
17100	24	32	7	1
17108	25	45	4	7
17116	19	44	7	1
17124	4	34	6	4
17132	7	38	4	6
17140	4	56	12	146
17148	25	65	12	188
17156	27	29	4	6
17164	12	52	5	3
17172	24	41	7	2
17180	21	19	9	228
17188	17	29	4	5
17196	4	50	7	1
17204	8	17	4	160
17212	4	69	6	4
17220	3	51	9	228
17228	19	27	4	5
17236	23	24	4	112
17244	18	39	3	107
17252	15	35	4	30
17260	15	24	4	181
17268	19	4	6	4
17276	18	62	7	1
17284	27	44	5	3
17292	6	58	4	7
17300	6	69	5	3
17308	14	40	5	3
17316	17	69	7	2
17324	22	2	7	1
17332	11	19	4	5
17340	23	18	5	3
17348	13	20	7	1
17356	2	43	7	1
17364	7	22	3	137
17372	27	58	9	228
17380	22	25	3	183
17388	27	26	6	4
17396	16	38	4	64
17404	2	45	4	222
17412	9	32	7	1
17420	5	69	6	4
17428	23	32	4	36
17436	10	55	12	159
17444	25	8	4	7
17452	17	46	6	4
17460	20	9	4	5
17468	4	70	7	2
17476	5	17	4	66
17484	24	61	4	52
17492	6	44	9	228
17500	8	29	7	1
17508	18	67	7	1
17516	26	20	7	1
17524	8	27	6	4
17532	22	25	7	2
17540	26	66	4	5
17548	8	27	5	3
17556	2	5	4	199
17564	16	11	7	1
17572	13	40	9	228
17580	25	39	4	140
17588	15	65	4	5
16765	12	44	12	179
16773	7	13	5	3
16781	24	4	4	6
16789	24	16	5	3
16797	10	10	3	210
16805	13	8	4	93
16813	11	49	10	170
16821	2	63	9	228
16829	4	66	6	4
16837	20	39	3	74
16845	3	30	5	3
16853	4	10	9	228
16861	18	22	4	7
16869	26	19	7	2
16877	11	36	4	6
16885	16	46	3	216
16893	9	45	4	227
16901	6	15	4	7
16909	19	46	3	225
16917	20	68	4	6
16925	12	11	4	6
16933	8	56	3	215
16941	10	4	7	1
16949	2	56	3	215
16957	14	45	12	229
16965	19	45	3	226
16973	9	31	4	5
16981	10	13	7	2
16989	25	15	3	57
16997	6	56	12	215
17005	12	25	3	165
17013	15	69	6	4
17021	14	45	3	201
17029	10	28	3	161
17037	25	9	5	3
17045	21	37	4	30
17053	19	6	7	1
17061	9	62	3	97
17069	20	20	5	3
17077	7	47	4	7
17085	22	31	3	162
17093	15	12	9	228
17101	22	1	4	5
17109	15	51	6	4
17117	10	10	3	190
17125	24	48	6	4
17133	10	1	4	7
17141	4	55	6	4
17149	24	67	5	3
17157	12	60	5	3
17165	11	27	7	2
17173	21	11	12	96
17181	16	23	9	228
17189	18	71	4	6
17197	24	10	4	5
17205	8	34	9	228
17213	16	72	7	1
17221	17	51	4	7
17229	23	16	4	6
17237	28	39	7	1
17245	8	32	7	1
17253	2	56	9	228
17261	13	53	3	203
17269	25	73	9	228
17277	2	18	4	6
17285	4	64	4	6
17293	26	19	4	5
17301	17	66	9	228
17309	12	41	4	5
17317	28	23	6	4
17325	16	51	4	7
17333	22	44	4	5
17341	25	50	2	213
17349	9	43	7	1
17357	24	44	4	156
17365	3	38	4	7
17373	7	54	4	218
17381	13	8	5	3
17389	19	54	7	1
17397	5	26	4	7
17405	12	60	7	1
17413	27	18	6	4
17421	16	32	7	1
17429	15	53	4	176
17437	12	69	4	5
17445	8	26	2	187
17453	10	42	4	5
17461	23	19	3	76
17469	12	31	6	4
17477	24	67	7	1
17485	26	18	4	193
17493	28	55	6	4
17501	19	12	5	3
17509	2	74	6	4
17517	27	36	5	3
17525	10	41	6	4
17533	11	48	4	5
17541	26	54	4	218
17549	3	69	4	50
17557	25	66	4	5
17565	26	65	6	4
17573	28	72	9	228
17581	12	33	5	3
17589	17	55	12	159
17597	9	47	4	5
17605	13	64	3	14
17613	27	7	4	6
17621	16	59	4	136
17629	17	69	4	7
17637	25	51	5	3
17645	8	37	9	228
17653	9	27	5	3
17661	23	53	4	7
17669	18	69	9	228
17677	16	47	4	5
17685	7	33	4	5
17693	6	61	4	52
17701	17	30	3	68
17709	3	51	10	54
17717	2	12	4	141
17725	13	71	4	6
17733	16	62	4	6
17741	11	33	5	3
17749	28	32	12	106
17757	2	27	3	149
17765	10	54	4	218
17773	24	23	12	137
17781	4	31	6	4
17789	2	20	5	3
17797	8	25	4	6
17805	25	43	4	6
17813	7	42	7	1
17821	28	11	7	2
17829	16	31	7	2
17837	23	5	3	119
17845	13	36	4	110
17853	13	5	3	84
17861	18	31	9	228
17869	3	46	12	229
17877	22	50	5	3
17885	17	5	4	199
17893	19	15	4	6
17901	4	15	7	1
17909	17	74	4	5
17917	24	3	7	1
17925	16	29	3	162
17933	4	12	7	2
17941	27	55	9	228
17949	15	26	4	31
17957	14	48	4	6
17965	11	8	9	228
17973	15	64	6	4
17981	28	74	4	6
17989	2	30	7	1
17997	17	66	4	5
18005	10	57	4	6
18013	10	63	3	126
16334	17	25	5	3
16342	17	56	3	223
16350	7	49	10	224
16358	28	44	4	192
16366	15	31	7	2
16374	12	63	4	6
16382	11	45	3	231
16390	13	43	4	5
16398	9	53	7	2
16406	20	40	4	6
16414	13	42	5	3
16422	12	5	3	177
16430	27	16	9	228
16438	28	13	4	7
16446	27	40	4	6
16454	20	2	9	228
16462	21	36	3	182
16470	2	55	4	5
16478	19	49	2	217
16486	23	13	6	4
16494	14	55	12	159
16502	18	21	6	4
16510	14	71	6	4
16518	21	74	3	69
16526	18	7	7	2
16534	22	27	7	2
16542	4	45	3	231
16550	11	34	4	7
16558	4	17	5	3
16566	4	56	12	214
16574	12	9	4	27
16582	5	54	5	3
16590	28	14	5	3
16598	6	56	9	228
16606	27	52	7	2
16614	27	56	12	146
16622	14	4	4	6
16630	14	44	4	192
16638	23	17	4	66
16646	7	14	7	1
16654	17	12	4	141
16662	3	44	12	179
16670	14	1	9	228
16678	25	48	4	7
16686	20	69	7	2
16694	22	44	7	2
16702	11	19	7	2
16710	8	44	4	6
16718	5	6	4	6
16726	5	20	9	228
16734	24	10	3	210
16742	19	60	5	3
16750	15	58	4	7
16758	20	54	4	7
16766	19	41	4	7
16774	26	52	9	228
16782	27	15	6	4
16790	22	21	7	1
16798	22	19	3	12
16806	11	47	4	38
16814	26	17	4	6
16822	4	70	4	5
16830	15	50	7	2
16838	8	28	7	2
16846	5	57	3	18
16854	13	66	7	2
16862	5	44	12	179
16870	8	18	4	66
16878	17	34	9	228
16886	19	16	4	5
16894	17	49	4	85
16902	11	1	4	7
16910	14	59	9	228
16918	7	27	12	163
16926	16	62	3	97
16934	22	17	4	32
16942	10	36	3	182
16950	5	30	9	228
16958	11	66	6	4
16966	5	71	7	1
16974	21	35	4	77
16982	25	6	7	1
16990	11	66	9	228
16998	25	35	4	134
17006	19	35	4	5
17014	11	50	4	6
17022	4	40	4	6
17030	10	8	4	55
17038	2	48	4	7
17046	25	66	9	228
17054	8	68	4	5
17062	17	56	3	215
17070	18	72	7	1
17078	2	24	9	228
17086	28	37	6	4
17094	22	14	3	57
17102	13	68	7	1
17110	23	8	5	3
17118	5	16	4	25
17126	10	45	3	200
17134	27	8	4	93
17142	24	74	5	3
17150	7	33	9	228
17158	21	30	4	5
17166	19	27	7	2
17174	26	48	4	5
17182	13	50	2	213
17190	17	33	4	35
17198	3	74	6	4
17206	23	55	5	3
17214	14	16	7	1
17222	27	4	5	3
17230	20	19	4	5
17238	10	13	4	5
17246	6	1	4	5
17254	22	39	7	1
17262	15	35	3	166
17270	23	56	3	82
17278	16	9	4	27
17286	25	8	7	2
17294	13	11	9	228
17302	12	70	5	3
17310	4	66	5	3
17318	14	39	7	1
17326	10	59	5	3
17334	15	18	5	3
17342	18	34	4	5
17350	8	10	4	5
17358	24	73	7	2
17366	28	30	4	7
17374	17	37	9	228
17382	17	48	5	3
17390	24	2	12	175
17398	11	56	3	147
17406	27	20	7	1
17414	26	49	7	1
17422	2	37	7	2
17430	22	53	3	203
17438	10	42	4	51
17446	19	28	7	1
17454	7	62	3	97
17462	15	45	7	1
17470	2	73	3	34
17478	2	6	7	2
17486	14	53	3	203
17494	15	70	4	5
17502	11	12	5	3
17510	19	12	6	4
17518	11	8	4	93
17526	19	37	4	5
17534	7	17	4	32
17542	4	28	3	162
17550	18	65	4	173
17558	4	17	4	66
17566	23	56	7	1
17574	13	17	4	32
17582	11	36	4	110
16339	9	68	6	4
16347	2	60	4	6
16355	19	7	6	4
16363	28	6	9	228
16371	8	46	4	6
16379	18	67	4	7
16387	21	43	4	5
16395	16	21	4	7
16403	27	71	4	56
16411	28	45	7	2
16419	8	36	9	228
16427	12	14	7	2
16435	14	64	7	1
16443	18	45	3	225
16451	2	68	9	228
16459	21	17	4	160
16467	7	16	9	228
16475	19	46	3	200
16483	19	70	4	6
16491	17	4	4	5
16499	9	57	4	79
16507	2	5	12	84
16515	18	21	4	142
16523	7	63	7	1
16531	15	27	3	149
16539	18	39	4	7
16547	6	66	3	86
16555	18	13	4	115
16563	6	48	4	7
16571	10	54	6	4
16579	9	16	3	57
16587	19	62	4	5
16595	7	74	6	4
16603	20	74	3	69
16611	22	24	4	5
16619	16	44	5	3
16627	5	73	4	6
16635	14	52	6	4
16643	6	71	4	26
16651	18	23	6	4
16659	9	56	3	146
16667	8	18	4	180
16675	21	73	7	2
16683	26	4	3	20
16691	9	20	5	3
16699	15	9	4	5
16707	12	12	7	2
16715	24	18	4	66
16723	20	51	10	54
16731	19	36	7	1
16739	26	16	4	5
16747	28	32	7	2
16755	28	51	7	2
16763	18	15	3	57
16771	12	45	3	232
16779	23	45	4	211
16787	11	27	3	149
16795	10	38	4	94
16803	10	28	5	3
16811	15	46	3	226
16819	4	30	9	228
16827	2	56	12	174
16835	11	56	12	146
16843	8	36	5	3
16851	4	52	4	95
16859	16	49	2	217
16867	27	51	4	7
16875	19	63	4	48
16883	22	19	6	4
16891	9	74	9	228
16899	28	40	13	78
16907	4	63	5	3
16915	5	5	4	7
16923	22	45	5	3
16931	13	19	7	2
16939	22	43	4	6
16947	19	44	12	179
16955	2	11	3	24
16963	28	37	9	228
16971	18	74	9	228
16979	9	4	4	83
16987	16	33	4	35
16995	20	59	7	2
17003	14	62	4	5
17011	14	31	6	206
17019	21	31	3	162
17027	17	35	5	3
17035	8	18	4	103
17043	8	51	4	6
17051	5	17	4	103
17059	19	36	4	6
17067	12	36	7	1
17075	18	55	6	4
17083	24	45	4	227
17091	18	66	3	86
17099	8	21	4	142
17107	20	35	4	77
17115	4	44	4	192
17123	24	72	4	6
17131	22	37	6	4
17139	19	13	7	2
17147	11	71	4	6
17155	15	45	3	201
17163	22	3	4	6
17171	10	67	4	62
17179	12	17	7	1
17187	27	68	7	1
17195	28	49	7	1
17203	9	64	7	1
17211	14	63	5	3
17219	15	43	4	59
17227	24	64	4	6
17235	5	36	7	2
17243	24	39	3	107
17251	13	68	4	7
17259	28	58	9	228
17267	14	51	2	212
17275	9	48	5	3
17283	20	63	3	126
17291	18	74	4	5
17299	19	41	5	3
17307	10	71	4	5
17315	23	48	7	1
17323	20	68	4	7
17331	8	51	4	7
17339	8	71	9	228
17347	21	17	4	32
17355	15	52	3	154
17363	13	50	4	7
17371	26	15	4	6
17379	19	6	5	3
17387	20	57	7	1
17395	12	12	5	3
17403	14	45	3	222
17411	9	49	4	117
17419	4	56	4	5
17427	7	40	6	4
17435	18	49	10	170
17443	16	26	2	187
17451	20	41	5	3
17459	12	40	13	78
17467	7	11	3	132
17475	11	74	4	5
17483	22	62	4	127
17491	22	38	4	5
17499	18	16	4	5
17507	16	18	4	32
17515	24	53	7	1
17523	14	33	4	5
17531	26	18	7	2
17539	23	14	4	6
17547	17	35	7	1
17555	3	37	9	228
17563	18	35	7	1
17571	17	72	7	1
17579	9	3	7	1
17587	4	4	4	7
16335	21	32	4	6
16343	27	73	3	34
16351	24	49	6	4
16359	16	3	4	7
16367	2	47	4	38
16375	20	2	6	4
16383	18	28	12	194
16391	14	52	7	2
16399	24	31	3	162
16407	8	6	7	1
16415	26	35	5	3
16423	6	54	4	5
16431	21	16	9	228
16439	3	57	4	79
16447	20	65	4	6
16455	17	35	7	2
16463	18	54	3	221
16471	10	53	4	176
16479	5	18	4	103
16487	9	4	4	5
16495	23	25	7	1
16503	24	61	3	9
16511	28	64	7	1
16519	3	11	6	4
16527	19	74	4	7
16535	9	3	6	4
16543	26	16	6	4
16551	14	60	6	4
16559	10	13	4	115
16567	13	61	4	5
16575	25	49	5	3
16583	17	7	4	7
16591	8	3	7	2
16599	9	10	4	7
16607	18	31	3	162
16615	14	24	4	5
16623	11	68	4	5
16631	21	52	7	2
16639	6	52	4	145
16647	23	47	4	7
16655	19	51	10	54
16663	8	38	5	3
16671	2	13	7	2
16679	27	21	4	6
16687	7	41	9	228
16695	21	12	4	7
16703	6	63	4	5
16711	11	51	10	54
16719	4	41	7	2
16727	16	43	4	59
16735	10	44	7	1
16743	2	29	4	5
16751	25	24	4	5
16759	24	45	4	230
16767	13	65	4	7
16775	16	11	3	24
16783	21	48	4	5
16791	4	35	4	5
16799	12	43	12	101
16807	13	59	7	2
16815	28	31	4	6
16823	26	26	7	2
16831	4	23	5	3
16839	28	46	4	227
16847	9	51	2	212
16855	19	65	3	125
16863	21	27	6	4
16871	7	11	4	6
16879	8	3	12	189
16887	19	45	4	230
16895	22	45	12	229
16903	11	42	4	51
16911	8	2	9	228
16919	10	48	9	228
16927	21	29	7	1
16935	19	23	3	164
16943	11	20	5	3
16951	11	30	9	228
16959	12	63	3	90
16967	15	8	6	4
16975	22	8	4	93
16983	2	33	3	71
16991	8	67	6	4
16999	11	9	5	3
17007	17	16	9	228
17015	19	53	4	5
17023	11	45	3	229
17031	24	23	4	5
17039	23	54	4	5
17047	12	68	4	6
17055	8	22	3	137
17063	13	63	3	90
17071	19	14	7	1
17079	2	16	7	2
17087	2	43	5	3
17095	9	51	7	1
17103	27	19	9	228
17111	18	67	5	3
17119	7	59	4	136
17127	4	62	4	127
17135	15	28	3	99
17143	21	26	4	7
17151	4	48	6	4
17159	6	27	6	4
17167	24	17	4	160
17175	9	16	9	228
17183	20	13	6	4
17191	28	10	4	6
17199	11	38	5	3
17207	3	73	4	7
17215	21	63	11	90
17223	7	45	3	222
17231	22	24	4	6
17239	5	9	4	5
17247	4	23	3	137
17255	16	46	3	232
17263	8	25	3	139
17271	8	9	4	27
17279	27	43	7	2
17287	14	62	3	97
17295	26	49	4	6
17303	19	5	4	5
17311	2	4	4	121
17319	17	39	4	5
17327	21	60	11	169
17335	12	8	9	228
17343	16	10	4	5
17351	7	12	4	5
17359	22	42	4	6
17367	3	30	3	162
17375	13	31	3	161
17383	17	10	3	210
17391	20	40	7	2
17399	4	54	4	209
17407	10	12	6	4
17415	15	71	4	26
17423	8	37	7	2
17431	8	66	4	7
17439	28	53	3	203
17447	20	20	7	1
17455	12	44	5	3
17463	8	24	5	3
17471	21	40	6	4
17479	25	6	5	3
17487	24	31	7	2
17495	21	11	7	2
17503	2	27	9	228
17511	22	45	3	222
17519	11	65	4	7
17527	24	51	6	4
17535	28	56	4	172
17543	5	44	4	156
17551	21	47	4	6
17559	2	18	4	32
17567	23	25	4	67
17575	22	26	5	3
17583	27	2	4	6
16338	3	68	6	4
16346	18	61	3	9
16354	9	61	7	2
16362	14	44	12	179
16370	13	35	4	5
16378	25	59	4	6
16386	10	35	7	2
16394	22	46	3	232
16402	25	61	5	3
16410	13	3	4	157
16418	2	6	7	1
16426	22	9	9	228
16434	12	40	7	1
16442	10	54	9	228
16450	22	35	4	5
16458	15	56	3	147
16466	4	58	4	114
16474	24	54	5	3
16482	6	42	9	228
16490	18	29	3	161
16498	10	21	6	4
16506	18	25	4	5
16514	22	28	5	3
16522	13	60	6	4
16530	25	10	6	4
16538	15	30	7	1
16546	7	9	7	2
16554	25	28	7	2
16562	17	13	4	6
16570	9	3	9	228
16578	16	17	9	228
16586	22	17	4	160
16594	25	41	13	109
16602	18	45	12	216
16610	22	55	12	159
16618	12	70	4	98
16626	17	5	3	119
16634	6	49	5	3
16642	8	42	4	7
16650	18	13	9	228
16658	27	16	4	5
16666	15	68	4	7
16674	13	45	5	3
16682	18	34	7	2
16690	17	15	4	6
16698	16	70	6	4
16706	16	3	4	157
16714	2	15	7	1
16722	24	38	4	94
16730	4	22	7	2
16738	28	47	6	4
16746	5	25	3	165
16754	19	12	4	141
16762	28	59	9	228
16770	24	20	9	228
16778	24	31	4	5
16786	18	53	4	5
16794	25	46	4	6
16802	12	17	4	66
16810	24	26	2	187
16818	24	50	10	202
16826	27	65	4	7
16834	3	56	9	228
16842	15	55	12	159
16850	28	7	4	5
16858	9	7	4	7
16866	6	28	4	5
16874	2	56	3	146
16882	24	15	3	57
16890	23	46	3	226
16898	15	39	9	228
16906	7	66	4	5
16914	28	33	5	3
16922	8	35	6	4
16930	10	34	9	228
16938	5	5	3	143
16946	15	10	7	1
16954	19	28	5	3
16962	9	48	4	7
16970	27	54	5	3
16978	17	4	4	83
16986	18	13	7	2
16994	10	49	10	170
17002	18	60	6	4
17010	4	20	4	113
17018	17	11	3	24
17026	18	61	4	5
17034	14	37	6	4
17042	4	3	4	157
17050	24	5	3	40
17058	6	50	2	213
17066	4	71	7	1
17074	27	8	7	2
17082	14	46	3	200
17090	9	18	4	6
17098	11	45	3	232
17106	17	24	5	3
17114	17	44	3	179
17122	9	33	4	35
17130	19	54	4	7
17138	23	68	4	61
17146	20	56	4	5
17154	6	56	2	223
17162	11	67	4	5
17170	13	65	7	2
17178	24	2	4	5
17186	15	46	3	200
17194	10	43	3	21
17202	4	10	3	219
17210	11	54	4	209
17218	15	16	4	6
17226	25	14	4	25
17234	16	6	3	63
17242	14	11	3	132
17250	20	70	5	3
17258	18	71	4	5
17266	24	4	3	20
17274	16	56	5	3
17282	15	56	4	46
17290	26	60	4	6
17298	18	25	7	1
17306	28	70	4	5
17314	24	46	12	229
17322	9	23	3	137
17330	14	2	7	1
17338	11	8	7	2
17346	25	67	7	1
17354	4	44	4	7
17362	9	2	4	5
17370	24	22	4	6
17378	12	4	5	3
17386	2	71	9	228
17394	23	53	4	176
17402	13	73	5	3
17410	18	12	6	4
17418	27	52	4	6
17426	14	56	4	6
17434	8	27	12	163
17442	6	63	7	2
17450	9	46	6	4
17458	2	51	4	44
17466	18	14	4	25
17474	19	65	3	89
17482	10	51	5	3
17490	8	46	3	229
17498	23	44	3	130
17506	18	50	3	197
17514	28	49	3	151
17522	23	17	4	193
17530	15	16	7	1
17538	7	58	7	2
17546	14	32	6	4
17554	14	68	9	228
17562	4	71	5	3
17570	25	4	6	4
17578	22	43	7	2
17586	7	41	4	5
17129	25	48	5	3
17137	19	33	4	7
17145	16	55	7	2
17153	25	5	7	2
17161	7	72	3	37
17169	12	33	4	7
17177	2	47	4	6
17185	7	65	7	2
17193	3	16	9	228
17201	28	47	4	6
17209	3	37	3	195
17217	22	16	7	1
17225	6	68	7	2
17233	11	27	4	5
17241	4	6	9	228
17249	16	43	4	6
17257	20	8	4	93
17265	18	4	3	20
17273	3	49	10	170
17281	5	54	4	209
17289	3	10	3	153
17297	23	68	4	42
17305	10	2	12	175
17313	9	23	4	164
17321	22	74	3	16
17329	8	45	4	222
17337	20	8	9	228
17345	13	60	7	1
17353	22	73	4	5
17361	4	5	3	84
17369	16	37	7	2
17377	24	1	6	4
17385	4	33	4	7
17393	23	39	3	22
17401	20	60	7	1
17409	19	67	7	1
17417	12	15	4	6
17425	17	30	7	1
17433	24	39	4	5
17441	8	52	4	5
17449	11	28	7	1
17457	24	65	7	2
17465	3	7	2	186
17473	11	5	3	84
17481	4	42	4	51
17489	18	46	3	201
17497	25	34	4	5
17505	19	59	4	5
17513	16	69	4	7
17521	19	10	3	219
17529	23	10	3	220
17537	14	46	3	216
17545	5	59	4	5
17553	14	38	4	5
17561	15	11	5	3
17569	8	11	7	1
17577	25	33	6	4
17585	3	12	4	7
17593	9	2	12	175
17601	26	36	4	30
17609	24	49	4	117
17617	10	65	4	173
17625	16	45	5	3
17633	19	66	4	5
17641	7	31	9	228
17649	13	38	4	5
17657	13	72	7	2
17665	7	18	4	7
17673	27	31	5	3
17681	19	59	9	228
17689	24	39	4	140
17697	10	1	5	3
17705	25	33	5	3
17713	28	22	4	7
17721	19	37	9	228
17729	15	10	7	2
17737	3	17	4	66
17745	23	49	7	2
17753	10	70	6	4
17761	20	28	3	162
17769	20	62	4	127
17777	20	55	6	4
17785	14	29	4	7
17793	11	49	7	1
17801	24	38	4	19
17809	5	17	4	32
17817	25	23	9	228
17825	18	22	3	8
17833	15	15	4	7
17841	8	52	6	4
17849	19	65	6	4
17857	10	49	4	6
17865	5	45	5	3
17873	9	46	4	211
17881	18	70	6	4
17889	9	5	4	199
17897	21	74	4	6
17905	19	26	9	228
17913	14	30	6	4
17921	17	56	2	223
17929	17	5	12	177
17937	26	32	7	2
17945	26	64	4	7
17953	7	69	5	3
17961	10	56	3	196
17969	7	34	7	1
17977	8	9	6	4
17985	26	40	9	228
17993	7	18	9	228
18001	10	46	4	211
18009	6	26	5	3
18017	4	33	5	3
18025	7	4	6	4
18033	16	30	7	1
18041	13	58	6	4
18049	14	74	4	6
18057	26	38	4	94
18065	26	22	3	137
18073	26	63	9	228
18081	5	12	7	2
18089	26	56	12	147
18097	20	31	5	3
18105	25	45	4	211
18113	2	49	10	170
18121	15	63	3	90
18129	4	45	6	4
18137	6	19	3	12
18145	25	59	5	3
18153	17	59	4	136
18161	4	6	4	5
18169	14	17	4	193
18177	4	57	7	1
18185	10	45	4	222
18193	23	64	5	3
18201	20	29	3	161
18209	5	18	5	3
18217	11	58	9	228
18225	2	40	4	7
18233	16	54	5	3
18241	20	72	9	228
18249	8	12	3	15
18257	7	66	7	1
18265	11	18	6	4
18273	4	23	7	1
18281	18	56	3	122
18289	12	57	4	7
18297	19	39	6	4
18305	7	48	4	6
18313	20	55	4	6
18321	4	10	7	1
18329	19	25	4	7
18337	18	14	4	7
18345	5	16	4	6
18353	23	42	12	108
18361	3	40	7	2
18369	24	39	9	228
18377	11	2	7	1
17594	25	17	7	1
17602	16	29	6	206
17610	2	46	4	7
17618	10	68	4	61
17626	15	56	3	82
17634	26	40	4	7
17642	25	57	4	6
17650	20	10	7	1
17658	2	5	6	4
17666	14	31	4	5
17674	2	34	9	228
17682	21	73	4	5
17690	14	8	4	28
17698	22	65	4	5
17706	15	15	7	2
17714	7	53	4	198
17722	17	13	9	228
17730	27	22	7	2
17738	22	31	4	5
17746	10	58	7	2
17754	14	34	7	1
17762	5	37	5	3
17770	8	28	4	5
17778	23	46	4	6
17786	16	28	3	184
17794	20	18	6	4
17802	24	21	7	1
17810	25	32	7	2
17818	10	1	8	124
17826	15	66	7	1
17834	23	6	4	6
17842	18	73	6	4
17850	21	63	5	3
17858	13	65	4	5
17866	17	8	7	2
17874	12	62	4	127
17882	7	55	4	116
17890	17	31	6	207
17898	18	41	5	3
17906	9	31	7	2
17914	18	45	9	228
17922	25	58	7	2
17930	2	73	4	7
17938	3	59	4	7
17946	27	36	4	110
17954	26	56	3	82
17962	3	29	4	6
17970	24	70	3	152
17978	22	72	6	4
17986	11	7	7	1
17994	7	56	3	82
18002	5	10	7	1
18010	17	45	4	222
18018	28	72	3	72
18026	26	58	9	228
18034	18	54	7	1
18042	17	22	4	6
18050	13	19	4	5
18058	11	10	4	6
18066	3	38	9	228
18074	27	25	4	67
18082	16	52	6	4
18090	11	31	6	4
18098	22	74	7	1
18106	5	45	12	229
18114	20	69	6	4
18122	11	26	6	4
18130	17	46	3	201
18138	17	1	5	3
18146	7	67	7	1
18154	25	31	6	4
18162	4	14	4	5
18170	14	57	7	2
18178	19	26	6	4
18186	23	61	4	7
18194	28	68	4	7
18202	24	74	3	16
18210	17	27	3	53
18218	24	3	4	7
18226	4	11	6	4
18234	4	8	6	4
18242	28	54	4	209
18250	10	55	4	80
18258	4	70	4	98
18266	10	26	6	4
18274	19	35	7	2
18282	7	21	4	142
18290	24	26	9	228
18298	8	54	5	3
18306	11	63	7	1
18314	10	18	9	228
18322	26	65	3	150
18330	5	44	4	5
18338	13	46	4	222
18346	11	6	4	7
18354	11	43	9	228
18362	5	11	6	4
18370	24	35	3	166
18378	19	12	3	87
18386	7	8	4	28
18394	8	44	6	4
18402	2	38	7	1
18410	18	67	4	41
18418	4	31	6	206
18426	4	62	4	5
18434	15	41	4	6
18442	12	50	6	4
18450	12	57	7	2
18458	13	32	12	106
18466	19	72	3	72
18474	5	7	4	102
18482	25	45	7	1
18490	2	10	3	219
18498	2	65	3	89
18506	6	29	5	3
18514	11	14	9	228
18522	7	59	7	1
18530	23	74	3	100
18538	20	61	9	228
18546	27	35	9	228
18554	8	26	7	2
18562	12	72	3	118
18570	4	60	11	169
18578	10	2	4	6
18586	4	63	7	1
18594	28	69	4	6
18602	4	47	6	4
18610	4	12	4	5
18618	13	37	4	6
18626	17	39	7	2
18634	20	32	9	228
18642	7	32	5	3
18650	26	17	4	7
18658	6	22	3	73
18666	2	72	3	37
18674	4	12	3	87
18682	19	52	4	6
18690	2	72	7	2
18698	7	18	4	180
18706	9	71	9	228
18714	13	38	4	19
18722	10	44	5	3
18730	11	32	3	75
18738	16	25	4	104
18746	19	60	7	1
18754	7	6	5	3
18762	15	5	3	177
18770	26	18	4	5
18778	22	63	4	7
18786	15	59	4	6
18794	22	23	12	137
18802	18	11	4	7
18810	15	55	4	10
18818	23	53	6	4
18826	15	61	5	3
18834	7	57	4	79
18842	9	18	6	4
17596	23	16	7	1
17604	7	3	4	7
17612	18	14	5	3
17620	7	26	9	228
17628	24	66	5	3
17636	22	8	5	3
17644	19	17	7	1
17652	21	31	5	3
17660	10	6	5	3
17668	3	66	6	4
17676	4	70	4	7
17684	2	41	6	4
17692	10	48	4	5
17700	18	18	7	2
17708	23	15	7	2
17716	20	30	7	2
17724	11	47	4	6
17732	10	40	13	78
17740	24	54	4	218
17748	11	32	7	2
17756	24	65	6	4
17764	6	46	3	216
17772	26	51	5	3
17780	11	7	4	6
17788	21	56	3	208
17796	4	63	11	90
17804	14	32	5	3
17812	17	29	3	162
17820	9	19	7	2
17828	9	62	4	6
17836	25	7	4	6
17844	27	8	4	5
17852	8	51	10	54
17860	7	55	9	228
17868	17	14	4	25
17876	22	44	5	3
17884	9	41	6	4
17892	13	74	4	6
17900	14	56	12	196
17908	14	58	5	3
17916	28	47	4	38
17924	13	39	7	1
17932	4	37	4	30
17940	4	48	4	5
17948	11	72	7	2
17956	8	45	7	2
17964	4	46	4	5
17972	8	46	12	229
17980	16	9	6	4
17988	13	18	6	4
17996	21	23	3	164
18004	15	17	7	2
18012	16	45	7	2
18020	11	64	3	14
18028	19	40	7	2
18036	17	71	4	5
18044	8	16	4	25
18052	12	42	7	1
18060	2	28	3	161
18068	25	44	7	2
18076	26	19	5	3
18084	24	20	4	5
18092	23	68	9	228
18100	17	38	6	4
18108	17	6	5	3
18116	18	51	4	7
18124	21	55	6	4
18132	4	9	4	5
18140	25	17	4	32
18148	16	27	4	7
18156	25	23	6	4
18164	15	39	3	74
18172	2	13	6	4
18180	7	40	5	3
18188	18	40	7	2
18196	14	23	3	164
18204	8	54	3	221
18212	4	2	7	1
18220	3	15	5	3
18228	3	60	11	169
18236	21	64	9	228
18244	21	24	3	137
18252	27	28	4	7
18260	11	42	4	6
18268	25	46	3	232
18276	15	52	7	2
18284	8	51	5	3
18292	7	14	5	3
18300	4	31	4	6
18308	12	71	4	56
18316	7	50	5	3
18324	20	72	3	118
18332	22	67	6	4
18340	11	25	4	7
18348	25	11	5	3
18356	8	18	4	193
18364	7	68	4	5
18372	21	52	10	154
18380	25	41	4	11
18388	18	23	4	6
18396	27	5	3	171
18404	10	18	4	133
18412	13	64	9	228
18420	24	21	4	7
18428	16	44	6	4
18436	4	15	4	25
18444	3	26	6	4
18452	18	39	6	4
18460	5	14	9	228
18468	27	55	12	159
18476	8	49	4	6
18484	13	38	9	228
18492	22	67	9	228
18500	27	32	12	106
18508	28	43	3	101
18516	4	22	4	5
18524	18	29	6	207
18532	28	49	4	7
18540	8	18	7	2
18548	4	41	4	5
18556	16	65	3	89
18564	13	6	6	4
18572	16	50	2	213
18580	26	47	4	5
18588	25	8	4	5
18596	2	17	7	1
18604	28	60	3	169
18612	11	7	4	65
18620	22	49	7	2
18628	22	21	4	168
18636	7	39	4	5
18644	18	72	4	7
18652	20	28	4	7
18660	10	12	3	87
18668	2	48	4	5
18676	24	68	9	228
18684	20	34	4	6
18692	22	3	6	4
18700	13	72	4	5
18708	11	17	4	7
18716	16	7	3	155
18724	28	5	4	6
18732	27	46	12	229
18740	8	45	4	5
18748	11	56	12	122
18756	22	43	6	4
18764	19	1	8	148
18772	7	10	4	7
18780	3	25	3	183
18788	4	64	6	4
18796	19	36	5	3
18804	14	37	7	1
18812	4	46	4	7
18820	24	48	4	6
18828	7	38	6	4
18836	4	34	4	6
18844	10	28	7	1
17590	3	7	4	131
17598	19	48	4	5
17606	7	65	6	4
17614	18	70	4	7
17622	20	8	6	4
17630	12	51	4	5
17638	11	10	3	219
17646	18	13	4	5
17654	15	43	6	4
17662	7	29	4	7
17670	5	28	3	162
17678	10	14	5	3
17686	25	72	3	37
17694	22	8	4	28
17702	2	45	3	226
17710	26	67	7	1
17718	15	55	3	144
17726	20	39	4	6
17734	16	12	4	141
17742	18	65	6	4
17750	3	9	5	3
17758	18	66	4	5
17766	23	63	4	5
17774	6	30	7	2
17782	22	30	6	4
17790	21	12	5	3
17798	7	4	9	228
17806	16	48	5	3
17814	4	5	6	4
17822	2	39	3	107
17830	23	15	4	7
17838	22	48	4	6
17846	23	54	7	2
17854	19	49	7	1
17862	5	43	4	6
17870	22	68	7	2
17878	7	64	4	7
17886	22	56	12	196
17894	2	13	9	228
17902	28	29	6	207
17910	10	45	9	228
17918	12	2	4	6
17926	3	5	4	199
17934	28	51	4	5
17942	24	18	4	7
17950	17	17	7	1
17958	22	66	7	1
17966	9	1	6	4
17974	9	25	4	6
17982	20	70	4	5
17990	28	50	6	4
17998	7	5	4	5
18006	27	19	4	5
18014	8	40	4	78
18022	24	17	4	6
18030	16	39	3	107
18038	4	63	4	7
18046	21	32	9	228
18054	22	30	9	228
18062	16	13	9	228
18070	3	65	4	7
18078	17	68	4	6
18086	12	40	6	4
18094	7	68	7	2
18102	24	63	4	7
18110	16	30	4	6
18118	2	27	4	7
18126	12	42	4	6
18134	5	19	6	4
18142	11	1	4	5
18150	27	23	5	3
18158	18	33	6	4
18166	28	46	3	225
18174	17	54	7	1
18182	3	68	7	1
18190	4	49	7	1
18198	4	7	5	3
18206	6	35	4	30
18214	14	56	12	122
18222	23	33	3	105
18230	8	36	4	30
18238	20	71	5	3
18246	2	44	6	4
18254	6	46	3	232
18262	6	56	4	46
18270	10	53	10	203
18278	7	58	4	5
18286	20	38	4	7
18294	11	46	4	7
18302	27	46	4	222
18310	25	56	3	82
18318	15	45	4	227
18326	17	54	5	3
18334	14	31	4	7
18342	12	67	4	7
18350	19	58	6	4
18358	10	58	9	228
18366	7	72	5	3
18374	17	36	9	228
18382	17	15	6	4
18390	23	3	4	157
18398	26	48	7	1
18406	5	29	5	3
18414	27	53	9	228
18422	18	71	7	2
18430	7	65	3	150
18438	13	66	4	6
18446	4	1	4	5
18454	26	46	4	7
18462	5	36	4	5
18470	4	14	7	2
18478	8	67	4	6
18486	12	43	9	228
18494	23	57	4	79
18502	26	26	4	5
18510	16	47	7	2
18518	15	13	4	7
18526	26	19	7	1
18534	22	69	7	1
18542	19	34	4	6
18550	27	56	12	82
18558	5	58	6	4
18566	18	68	9	228
18574	23	67	4	62
18582	24	73	4	5
18590	6	21	4	142
18598	6	28	7	2
18606	8	17	4	32
18614	15	49	6	4
18622	13	66	7	1
18630	8	26	4	7
18638	23	27	3	123
18646	13	70	7	2
18654	12	24	4	181
18662	12	58	5	3
18670	18	32	7	2
18678	17	7	9	228
18686	15	51	7	1
18694	14	74	3	100
18702	22	2	4	7
18710	9	41	4	11
18718	24	65	4	5
18726	17	14	4	7
18734	4	48	4	6
18742	5	12	4	5
18750	23	46	3	216
18758	24	64	6	4
18766	18	40	4	39
18774	4	55	4	6
18782	27	35	7	2
18790	6	30	3	68
18798	11	11	7	2
18806	8	25	4	104
18814	19	44	5	3
18822	3	54	4	5
18830	8	50	4	7
18838	24	74	7	1
17591	13	5	3	119
17599	25	30	3	68
17607	24	6	5	3
17615	6	23	4	7
17623	21	41	4	5
17631	9	30	4	6
17639	17	27	5	3
17647	22	4	4	5
17655	8	51	4	44
17663	10	39	3	107
17671	24	38	6	4
17679	20	18	4	133
17687	10	43	7	1
17695	24	18	4	193
17703	17	9	5	3
17711	8	22	4	6
17719	8	59	4	7
17727	19	47	4	6
17735	26	41	4	11
17743	17	73	6	4
17751	8	73	7	2
17759	10	41	5	3
17767	18	17	7	1
17775	27	56	3	122
17783	18	15	4	6
17791	24	8	4	7
17799	16	56	2	223
17807	3	8	7	2
17815	3	51	4	44
17823	13	46	3	216
17831	17	62	4	6
17839	13	70	4	5
17847	19	37	3	195
17855	24	52	4	5
17863	5	8	6	4
17871	6	24	4	6
17879	14	50	5	3
17887	18	72	3	37
17895	16	65	12	188
17903	19	19	9	228
17911	17	50	3	197
17919	26	25	4	67
17927	5	37	3	195
17935	11	19	9	228
17943	7	67	4	6
17951	17	37	4	7
17959	6	67	4	6
17967	17	25	4	6
17975	27	32	9	228
17983	23	17	7	2
17991	3	62	7	1
17999	5	35	4	6
18007	2	52	6	4
18015	18	73	5	3
18023	8	22	7	1
18031	23	48	4	6
18039	27	42	4	6
18047	8	30	4	6
18055	3	14	4	5
18063	14	45	3	216
18071	28	30	9	228
18079	22	72	3	118
18087	14	14	4	6
18095	24	65	3	89
18103	8	41	9	228
18111	16	36	4	6
18119	8	28	3	184
18127	8	5	12	177
18135	11	61	4	6
18143	21	62	7	2
18151	8	46	5	3
18159	14	62	7	2
18167	8	36	4	6
18175	2	46	5	3
18183	25	63	9	228
18191	10	49	7	1
18199	12	56	4	6
18207	21	7	4	131
18215	4	13	4	6
18223	5	27	4	6
18231	27	1	3	13
18239	18	26	9	228
18247	25	39	9	228
18255	27	65	3	150
18263	6	43	4	59
18271	10	3	4	7
18279	11	61	6	4
18287	2	54	5	3
18295	13	51	4	6
18303	22	17	9	228
18311	22	20	7	2
18319	11	2	4	6
18327	13	71	5	3
18335	6	32	4	36
18343	27	25	4	33
18351	8	38	7	1
18359	28	70	7	2
18367	18	72	7	2
18375	19	3	9	228
18383	23	48	4	81
18391	22	54	4	209
18399	25	51	2	212
18407	10	29	6	207
18415	11	71	6	4
18423	21	28	7	2
18431	14	57	9	228
18439	28	38	9	228
18447	10	39	6	4
18455	19	14	4	7
18463	21	24	4	181
18471	26	46	6	4
18479	10	71	7	2
18487	24	50	4	7
18495	13	35	9	228
18503	16	44	4	156
18511	4	72	7	2
18519	7	49	7	2
18527	10	67	4	41
18535	8	22	5	3
18543	11	50	6	4
18551	7	3	12	189
18559	20	17	4	7
18567	6	25	7	2
18575	17	70	4	6
18583	5	45	7	1
18591	4	55	4	80
18599	19	35	4	7
18607	8	37	4	5
18615	2	51	5	3
18623	10	54	10	221
18631	28	56	12	82
18639	15	63	4	7
18647	8	68	7	2
18655	24	64	4	7
18663	15	42	7	2
18671	17	65	3	89
18679	14	42	12	108
18687	14	27	4	6
18695	22	74	3	100
18703	16	71	7	2
18711	2	50	7	2
18719	11	32	12	106
18727	22	39	4	140
18735	12	13	7	1
18743	26	32	4	5
18751	25	48	7	1
18759	23	5	3	177
18767	8	58	9	228
18775	17	72	4	7
18783	11	17	4	193
18791	25	46	6	4
18799	11	52	7	1
18807	22	68	4	5
18815	17	71	7	2
18823	16	46	3	200
18831	7	57	6	4
18839	8	28	3	99
17592	24	5	4	5
17600	17	46	3	232
17608	8	18	4	32
17616	4	25	3	165
17624	18	49	4	117
17632	10	5	4	5
17640	20	59	4	5
17648	26	56	3	196
17656	28	52	7	1
17664	8	43	4	6
17672	20	15	7	1
17680	7	44	4	156
17688	15	44	4	5
17696	9	26	7	2
17704	18	1	5	3
17712	24	66	4	5
17720	10	5	9	228
17728	23	62	6	4
17736	8	29	3	162
17744	6	24	4	112
17752	15	6	4	49
17760	24	18	7	2
17768	15	56	3	174
17776	4	23	12	137
17784	22	64	6	4
17792	26	53	4	198
17800	19	72	3	37
17808	19	13	4	5
17816	21	30	7	2
17824	8	62	7	1
17832	18	38	5	3
17840	22	29	4	7
17848	27	28	7	1
17856	11	4	4	7
17864	2	16	4	5
17872	11	40	9	228
17880	27	50	9	228
17888	25	22	3	8
17896	12	58	6	4
17904	27	46	3	222
17912	21	42	7	1
17920	16	46	6	4
17928	11	37	3	195
17936	25	50	7	2
17944	7	32	6	4
17952	18	33	5	3
17960	15	25	9	228
17968	21	74	7	1
17976	8	35	4	134
17984	26	18	9	228
17992	22	45	3	216
18000	15	9	4	6
18008	4	61	4	6
18016	3	41	5	3
18024	7	24	4	112
18032	23	24	3	137
18040	23	55	4	5
18048	28	71	7	1
18056	26	50	7	2
18064	26	18	6	4
18072	16	40	4	78
18080	6	23	9	228
18088	3	13	6	4
18096	13	59	4	5
18104	13	71	7	1
18112	7	44	9	228
18120	14	25	9	228
18128	11	72	4	7
18136	5	21	7	1
18144	10	65	3	89
18152	7	15	3	57
18160	5	65	9	228
18168	11	73	5	3
18176	26	47	4	6
18184	3	56	3	147
18192	20	25	3	183
18200	6	16	4	6
18208	5	52	4	95
18216	15	33	3	105
18224	6	59	4	6
18232	18	12	3	87
18240	3	8	4	93
18248	25	67	4	41
18256	25	23	4	6
18264	27	66	4	6
18272	21	67	9	228
18280	4	6	3	120
18288	20	57	4	7
18296	13	70	4	7
18304	11	5	4	6
18312	18	61	7	2
18320	19	42	4	6
18328	15	42	4	7
18336	21	11	4	5
18344	22	43	4	5
18352	6	18	5	3
18360	6	27	4	6
18368	20	5	3	171
18376	15	27	12	191
18384	9	20	7	1
18392	3	60	4	6
18400	20	56	3	208
18408	25	6	4	7
18416	6	6	3	63
18424	15	18	4	180
18432	8	36	7	2
18440	22	38	9	228
18448	8	8	4	7
18456	15	56	12	208
18464	28	32	4	5
18472	28	24	7	2
18480	4	36	5	3
18488	24	41	4	5
18496	18	7	3	155
18504	27	17	4	7
18512	5	25	3	183
18520	28	25	5	3
18528	9	40	4	7
18536	17	72	3	37
18544	15	38	4	19
18552	19	71	9	228
18560	11	72	9	228
18568	20	37	3	205
18576	19	23	4	112
18584	8	62	5	3
18592	9	72	3	37
18600	7	30	4	6
18608	7	64	6	4
18616	7	21	5	3
18624	21	56	12	122
18632	10	43	7	2
18640	7	17	4	133
18648	11	68	5	3
18656	5	43	6	4
18664	20	35	9	228
18672	4	15	5	3
18680	18	27	3	53
18688	21	5	7	1
18696	7	42	12	108
18704	22	65	3	125
18712	8	50	7	2
18720	20	40	4	5
18728	27	3	9	228
18736	7	13	4	115
18744	3	39	6	4
18752	23	17	4	5
18760	16	45	3	201
18768	3	14	7	2
18776	10	64	9	228
18784	2	18	6	4
18792	22	7	4	23
18800	15	53	5	3
18808	4	56	4	172
18816	28	31	6	4
18824	23	8	7	1
18832	25	9	7	1
18840	28	53	9	228
18021	7	65	4	5
18029	9	45	9	228
18037	2	19	7	2
18045	26	74	3	16
18053	18	8	4	93
18061	9	27	12	163
18069	4	4	4	121
18077	25	45	5	3
18085	7	16	7	1
18093	24	19	6	4
18101	15	5	12	84
18109	25	54	4	218
18117	24	23	7	2
18125	25	32	4	7
18133	4	70	9	228
18141	12	5	3	84
18149	6	45	4	211
18157	16	46	5	3
18165	23	39	3	74
18173	25	49	4	6
18181	17	16	4	5
18189	4	13	5	3
18197	11	49	3	151
18205	19	53	7	2
18213	26	71	9	228
18221	2	65	4	173
18229	13	26	4	31
18237	17	29	7	2
18245	24	42	7	1
18253	18	31	4	6
18261	12	29	3	161
18269	19	15	4	25
18277	26	27	7	1
18285	19	67	4	41
18293	15	31	6	207
18301	11	35	4	7
18309	18	52	4	6
18317	24	70	4	98
18325	2	19	4	5
18333	17	7	3	155
18341	10	3	7	2
18349	16	50	3	197
18357	24	56	12	147
18365	23	13	4	7
18373	18	64	3	14
18381	20	74	4	6
18389	9	49	4	6
18397	4	47	5	3
18405	28	12	7	1
18413	2	49	7	1
18421	6	52	4	95
18429	20	13	4	115
18437	12	14	9	228
18445	13	5	3	171
18453	16	14	3	57
18461	25	64	4	7
18469	24	29	6	207
18477	13	57	4	7
18485	5	8	5	3
18493	5	13	7	1
18501	17	69	4	5
18509	11	7	5	3
18517	24	45	3	225
18525	10	25	4	104
18533	10	7	3	155
18541	22	31	7	2
18549	16	4	9	228
18557	18	60	4	6
18565	17	65	6	4
18573	12	37	3	205
18581	2	50	3	197
18589	11	40	4	39
18597	24	71	4	7
18605	25	74	3	16
18613	27	9	7	1
18621	10	50	7	2
18629	11	8	4	5
18637	13	64	6	4
18645	16	1	8	124
18653	19	46	4	7
18661	23	52	4	7
18669	11	56	4	172
18677	13	17	4	7
18685	16	65	7	2
18693	8	53	7	1
18701	13	44	3	130
18709	28	33	7	1
18717	22	23	4	7
18725	27	15	4	6
18733	21	45	7	1
18741	17	67	7	1
18749	3	36	4	30
18757	21	3	9	228
18765	26	42	12	108
18773	5	7	4	5
18781	5	6	6	4
18789	5	46	4	222
18797	12	32	4	5
18805	22	21	5	3
18813	4	65	4	5
18821	7	39	3	107
18829	7	43	3	232
18837	7	71	4	5
18845	2	15	5	3
18853	5	70	7	2
18861	10	34	4	29
18869	22	68	4	42
18877	27	29	6	4
18885	7	31	7	2
18893	21	29	6	4
18901	14	22	3	137
18909	13	45	7	1
18917	24	29	4	7
18925	7	43	6	4
18933	23	22	3	137
18941	21	4	4	5
18949	10	38	4	7
18957	5	71	5	3
18965	13	73	7	1
18973	23	33	4	35
18981	7	52	3	154
18989	17	4	6	4
18997	5	68	4	7
19005	21	42	4	7
19013	14	36	4	5
19021	24	50	5	3
19029	10	71	4	56
19037	14	35	6	4
19045	23	10	5	3
19053	15	48	4	7
19061	26	50	4	5
19069	5	57	4	7
19077	23	62	3	97
19085	28	11	4	5
19093	11	20	7	1
19101	2	14	7	2
19109	28	56	7	2
19117	5	72	3	118
19125	4	38	4	167
19133	7	44	4	5
19141	21	29	5	3
19149	10	4	5	3
19157	16	45	4	5
19165	27	19	7	2
19173	18	63	4	48
19181	13	52	3	95
19189	10	56	12	208
19197	23	49	10	224
19205	17	45	12	216
19213	24	1	8	148
19221	18	41	7	1
19229	2	67	4	41
19237	15	38	4	167
19245	25	10	7	2
19253	5	21	4	168
19261	18	40	12	92
19269	8	50	9	228
17595	15	10	3	220
17603	10	27	4	5
17611	7	56	3	196
17619	4	69	9	228
17627	8	45	5	3
17635	22	11	3	158
17643	12	59	4	5
17651	8	69	4	50
17659	12	11	7	2
17667	22	11	9	228
17675	28	56	3	208
17683	17	26	7	2
17691	4	65	4	7
17699	12	55	4	7
17707	11	6	4	5
17715	18	31	6	4
17723	18	5	9	228
17731	10	40	7	2
17739	4	12	4	7
17747	27	25	4	7
17755	17	33	6	4
17763	25	35	7	1
17771	23	50	5	3
17779	24	5	9	228
17787	17	34	4	5
17795	16	5	12	177
17803	12	28	3	162
17811	16	45	4	7
17819	6	12	9	228
17827	8	31	7	2
17835	14	17	4	133
17843	6	31	5	3
17851	19	10	4	6
17859	6	55	4	10
17867	22	32	5	3
17875	5	18	4	7
17883	16	64	4	6
17891	10	72	3	37
17899	20	58	6	4
17907	27	30	7	2
17915	2	14	5	3
17923	21	56	4	172
17931	16	66	5	3
17939	26	62	3	97
17947	10	40	4	7
17955	2	45	7	2
17963	4	21	4	6
17971	25	15	4	6
17979	18	17	4	6
17987	2	70	4	7
17995	6	2	7	1
18003	25	65	6	4
18011	7	25	4	67
18019	12	32	7	2
18027	12	30	4	7
18035	28	54	4	7
18043	7	31	4	5
18051	13	23	3	164
18059	27	34	4	6
18067	13	36	4	7
18075	3	5	6	4
18083	4	73	5	3
18091	18	57	7	1
18099	26	30	4	7
18107	22	14	4	6
18115	2	42	4	5
18123	5	44	7	2
18131	16	64	7	1
18139	18	69	4	7
18147	3	42	4	51
18155	23	56	3	174
18163	8	19	4	7
18171	4	11	4	6
18179	2	36	4	6
18187	21	72	6	4
18195	10	69	4	7
18203	7	23	4	164
18211	26	11	5	3
18219	8	72	3	37
18227	25	47	4	5
18235	25	44	4	5
18243	24	56	3	122
18251	11	61	9	228
18259	12	34	4	6
18267	21	28	4	7
18275	17	70	7	1
18283	4	42	7	1
18291	25	43	6	4
18299	8	17	4	6
18307	2	28	4	6
18315	10	29	9	228
18323	5	35	3	166
18331	13	38	7	2
18339	20	67	4	7
18347	6	51	2	212
18355	4	13	7	1
18363	14	60	4	7
18371	27	64	9	228
18379	8	69	5	3
18387	19	14	9	228
18395	10	42	4	6
18403	17	7	6	4
18411	16	38	7	1
18419	6	56	3	208
18427	23	28	9	228
18435	4	64	3	14
18443	3	7	6	4
18451	6	17	7	2
18459	16	8	4	7
18467	6	38	4	64
18475	16	70	4	6
18483	18	32	4	7
18491	22	45	3	200
18499	4	55	3	159
18507	11	56	3	208
18515	19	64	4	7
18523	14	38	6	4
18531	4	40	6	4
18539	26	61	9	228
18547	11	3	9	228
18555	16	18	4	193
18563	24	40	6	4
18571	17	26	9	228
18579	16	54	6	4
18587	5	24	4	112
18595	27	20	4	7
18603	9	65	3	89
18611	19	56	4	172
18619	10	47	6	4
18627	8	44	4	156
18635	2	37	4	5
18643	3	30	4	5
18651	26	43	5	3
18659	19	55	4	6
18667	16	37	4	5
18675	14	49	7	2
18683	15	70	9	228
18691	4	7	4	131
18699	24	40	5	3
18707	4	71	6	4
18715	28	57	5	3
18723	21	13	4	6
18731	24	8	4	28
18739	2	45	4	5
18747	3	6	7	2
18755	15	17	4	5
18763	6	61	4	7
18771	5	46	9	228
18779	7	56	12	208
18787	24	16	7	1
18795	2	4	4	7
18803	21	13	4	115
18811	25	34	4	29
18819	19	40	4	5
18827	2	13	4	5
18835	12	10	4	7
18843	3	28	7	1
18385	3	31	7	1
18393	16	73	9	228
18401	18	18	4	133
18409	17	32	4	7
18417	26	55	12	159
18425	2	1	5	3
18433	12	17	4	193
18441	10	39	9	228
18449	2	15	6	4
18457	23	63	7	2
18465	27	44	3	179
18473	10	23	4	112
18481	14	31	7	2
18489	12	52	3	154
18497	15	50	4	5
18505	7	24	4	181
18513	10	49	3	151
18521	22	70	3	152
18529	11	6	7	2
18537	14	20	4	113
18545	14	67	9	228
18553	13	56	12	122
18561	10	11	9	228
18569	5	56	3	208
18577	16	28	4	6
18585	23	54	4	6
18593	23	60	9	228
18601	16	44	9	228
18609	4	32	7	2
18617	9	29	4	7
18625	14	28	9	228
18633	7	34	4	29
18641	8	1	8	124
18649	7	19	4	6
18657	24	15	4	5
18665	13	7	2	186
18673	19	61	9	228
18681	4	10	4	6
18689	6	62	4	6
18697	17	28	3	99
18705	17	41	4	11
18713	14	43	9	228
18721	10	25	4	7
18729	24	4	6	4
18737	9	45	4	211
18745	12	49	4	7
18753	11	46	4	222
18761	28	56	12	174
18769	2	73	5	3
18777	15	49	4	85
18785	16	45	4	211
18793	21	14	4	5
18801	5	60	7	1
18809	7	31	6	207
18817	11	44	5	3
18825	24	14	6	4
18833	24	36	9	228
18841	23	55	7	2
18849	28	49	5	3
18857	7	33	3	105
18865	3	7	4	65
18873	26	12	3	87
18881	7	70	9	228
18889	3	72	9	228
18897	28	7	7	1
18905	18	37	4	5
18913	25	3	4	7
18921	12	12	4	5
18929	15	69	4	6
18937	2	8	9	228
18945	2	49	4	6
18953	27	54	7	1
18961	3	25	4	7
18969	6	46	9	228
18977	18	36	4	30
18985	4	7	4	65
18993	17	44	9	228
19001	26	61	7	2
19009	19	65	3	150
19017	16	12	9	228
19025	14	55	4	7
19033	17	40	5	3
19041	15	60	7	2
19049	14	61	6	4
19057	11	66	4	6
19065	22	43	4	59
19073	14	28	3	17
19081	17	64	4	7
19089	19	60	11	169
19097	3	27	4	5
19105	13	17	9	228
19113	25	1	3	13
19121	18	64	4	7
19129	6	54	4	209
19137	4	46	7	2
19145	11	60	11	169
19153	4	12	5	3
19161	8	35	4	6
19169	24	3	12	189
19177	7	13	4	7
19185	4	60	3	169
19193	28	46	3	226
19201	3	9	7	1
19209	9	45	3	231
19217	3	53	6	4
19225	16	56	4	46
19233	14	58	7	1
19241	14	15	4	5
19249	15	50	10	202
19257	20	31	7	1
19265	13	54	10	221
19273	4	72	3	118
19281	10	41	7	1
19289	14	38	4	64
19297	7	7	9	228
19305	16	35	4	7
19313	23	16	5	3
19321	26	33	3	105
19329	7	52	9	228
19337	14	35	4	77
19345	25	4	4	6
19353	26	65	4	6
19361	16	56	7	1
19369	3	74	4	6
19377	15	14	6	4
19385	27	52	3	95
19393	3	61	9	228
19401	7	54	3	221
19409	24	17	4	133
19417	27	27	7	2
19425	21	65	3	188
19433	10	50	4	5
19441	23	49	4	5
19449	27	22	4	5
19457	21	54	3	221
19465	9	25	6	4
19473	19	67	5	3
19481	20	56	7	2
19489	25	56	12	208
19497	17	1	8	148
19505	8	30	6	4
19513	17	71	4	26
19521	20	30	4	5
19529	8	29	5	3
19537	20	7	4	7
19545	15	18	7	1
19553	23	48	6	4
19561	17	8	4	5
19569	14	27	9	228
19577	21	63	7	1
19585	2	56	12	196
19593	12	4	7	1
19601	24	1	4	6
19609	12	10	6	4
19617	14	2	5	3
19625	27	7	4	102
19633	25	45	4	227
18846	16	74	3	16
18854	26	56	12	208
18862	12	43	7	2
18870	27	21	6	4
18878	14	34	4	7
18886	18	71	6	4
18894	28	37	4	6
18902	14	39	4	140
18910	13	43	6	4
18918	17	58	9	228
18926	24	50	9	228
18934	13	18	4	160
18942	6	19	3	76
18950	20	46	4	222
18958	27	67	7	2
18966	21	57	5	3
18974	14	37	4	6
18982	21	54	4	209
18990	14	28	7	2
18998	17	5	4	5
19006	13	42	4	7
19014	21	52	4	95
19022	12	68	6	4
19030	8	73	4	5
19038	11	51	4	5
19046	20	36	5	3
19054	19	36	6	4
19062	26	17	6	4
19070	4	17	4	193
19078	22	45	7	1
19086	20	68	6	4
19094	17	6	4	7
19102	20	70	7	2
19110	26	10	7	2
19118	22	25	4	5
19126	22	13	4	115
19134	13	44	4	5
19142	2	37	9	228
19150	21	52	3	154
19158	12	3	7	2
19166	8	32	5	3
19174	14	74	3	69
19182	17	25	4	33
19190	20	28	3	138
19198	14	63	7	1
19206	4	1	8	88
19214	28	63	11	126
19222	15	9	7	2
19230	26	67	5	3
19238	9	63	4	5
19246	4	66	4	6
19254	21	71	4	7
19262	22	6	3	120
19270	23	55	7	1
19278	17	45	3	231
19286	13	9	12	111
19294	20	28	3	161
19302	27	2	6	4
19310	28	52	5	3
19318	13	67	4	5
19326	17	17	4	133
19334	12	18	4	160
19342	4	12	7	1
19350	5	10	4	7
19358	26	60	6	4
19366	19	12	4	6
19374	16	43	6	4
19382	2	13	4	6
19390	3	55	5	3
19398	21	31	7	1
19406	18	1	7	1
19414	14	27	6	4
19422	28	51	4	44
19430	11	32	4	5
19438	27	16	7	2
19446	14	52	4	145
19454	25	28	9	228
19462	25	15	6	4
19470	17	68	4	42
19478	6	5	3	143
19486	9	26	4	5
19494	13	44	12	179
19502	4	49	7	2
19510	9	43	5	3
19518	17	28	3	17
19526	25	47	7	2
19534	2	29	9	228
19542	24	49	7	2
19550	24	51	4	6
19558	26	17	5	3
19566	27	52	6	4
19574	28	9	12	111
19582	24	22	6	4
19590	21	15	5	3
19598	9	32	5	3
19606	26	16	4	7
19614	22	55	3	159
19622	17	15	3	57
19630	9	17	4	7
19638	16	51	2	212
19646	26	15	6	4
19654	18	54	4	7
19662	22	66	4	7
19670	16	44	4	5
19678	21	5	3	143
19686	12	34	6	4
19694	22	50	3	185
19702	12	38	4	167
19710	18	16	7	2
19718	26	48	4	7
19726	11	28	12	194
19734	27	53	4	5
19742	12	12	7	1
19750	17	5	12	84
19758	9	27	7	1
19766	20	18	4	6
19774	9	6	4	49
19782	14	32	7	1
19790	11	7	6	4
19798	14	34	5	3
19806	3	53	3	203
19814	25	35	5	3
19822	4	74	3	100
19830	26	44	3	179
19838	24	28	3	17
19846	7	38	4	167
19854	8	68	9	228
19862	13	74	3	135
19870	12	3	4	5
19878	8	36	6	4
19886	17	22	6	4
19894	4	45	4	6
19902	4	57	5	3
19910	20	69	4	6
19918	6	66	4	47
19926	23	43	12	101
19934	21	55	4	6
19942	27	43	4	5
19950	27	7	4	65
19958	28	27	12	191
19966	8	21	7	2
19974	3	22	9	228
19982	6	60	7	2
19990	16	30	5	3
19998	8	52	4	6
20006	13	53	5	3
20014	16	24	3	137
20022	23	46	9	228
20030	7	72	7	1
20038	22	13	4	7
20046	22	28	3	138
20054	27	15	4	25
20062	24	39	4	7
20070	19	53	9	228
20078	10	49	6	4
20086	6	61	5	3
20094	19	16	7	2
18848	4	6	7	2
18856	20	13	4	6
18864	28	35	9	228
18872	11	9	7	1
18880	16	68	4	61
18888	21	61	9	228
18896	19	3	4	7
18904	10	4	6	4
18912	22	37	4	6
18920	4	24	4	181
18928	11	3	7	2
18936	3	4	4	7
18944	27	16	3	57
18952	6	17	4	133
18960	21	61	6	4
18968	21	44	4	5
18976	2	7	5	3
18984	21	43	6	4
18992	16	47	9	228
19000	7	35	3	166
19008	24	72	6	4
19016	21	43	3	232
19024	10	72	9	228
19032	16	7	9	228
19040	21	3	6	4
19048	21	2	4	7
19056	10	53	4	198
19064	3	7	5	3
19072	27	21	9	228
19080	23	49	4	45
19088	20	54	4	209
19096	12	11	6	4
19104	19	25	4	33
19112	9	50	7	2
19120	19	57	4	7
19128	23	55	4	116
19136	26	41	4	6
19144	4	56	3	208
19152	7	67	4	41
19160	18	36	6	4
19168	20	70	7	1
19176	16	45	3	225
19184	8	35	3	166
19192	23	46	3	232
19200	11	38	7	1
19208	10	1	7	1
19216	24	21	5	3
19224	11	3	4	5
19232	2	5	4	6
19240	25	57	6	4
19248	16	53	7	2
19256	11	56	12	82
19264	2	21	9	228
19272	6	46	3	200
19280	11	36	3	182
19288	23	56	5	3
19296	17	9	7	1
19304	23	50	7	1
19312	7	65	4	6
19320	16	45	12	216
19328	14	37	4	30
19336	14	49	4	5
19344	22	26	7	1
19352	17	72	5	3
19360	9	9	12	70
19368	17	63	4	5
19376	28	46	4	7
19384	7	49	2	217
19392	19	43	3	101
19400	14	9	4	27
19408	17	1	3	13
19416	19	17	5	3
19424	25	25	5	3
19432	15	11	7	1
19440	14	74	6	4
19448	21	39	4	7
19456	5	7	7	2
19464	9	61	9	228
19472	15	52	4	5
19480	12	16	7	2
19488	14	57	4	5
19496	24	10	7	2
19504	26	24	4	7
19512	8	46	3	222
19520	2	56	4	172
19528	28	52	3	95
19536	19	56	3	223
19544	18	17	6	4
19552	25	33	4	6
19560	17	9	12	70
19568	28	56	3	215
19576	4	66	7	1
19584	28	5	9	228
19592	22	10	3	204
19600	4	11	4	5
19608	21	3	4	157
19616	2	35	4	7
19624	24	20	7	2
19632	8	68	4	42
19640	25	60	9	228
19648	27	45	3	226
19656	27	14	4	7
19664	3	40	4	5
19672	11	60	4	7
19680	22	2	5	3
19688	8	46	3	225
19696	16	32	5	3
19704	2	17	4	7
19712	10	56	3	223
19720	14	33	7	2
19728	17	64	5	3
19736	4	44	3	130
19744	23	52	9	228
19752	9	9	6	129
19760	21	60	3	169
19768	7	66	4	47
19776	10	48	4	81
19784	23	56	2	223
19792	12	67	9	228
19800	24	47	4	7
19808	5	42	4	7
19816	19	42	9	228
19824	16	29	7	2
19832	5	19	4	6
19840	12	9	4	7
19848	4	29	3	161
19856	15	43	12	101
19864	3	1	8	88
19872	2	56	12	122
19880	16	36	6	4
19888	22	39	5	3
19896	14	1	7	2
19904	19	56	7	2
19912	2	46	12	216
19920	13	45	3	200
19928	13	69	4	6
19936	22	6	6	4
19944	14	32	4	6
19952	15	9	6	4
19960	2	52	4	6
19968	6	28	4	7
19976	7	16	5	3
19984	13	18	4	6
19992	12	65	3	188
20000	16	30	6	4
20008	25	65	4	6
20016	3	3	9	228
20024	2	29	7	2
20032	22	72	4	6
20040	5	34	4	7
20048	17	21	4	7
20056	23	1	9	228
20064	4	35	7	2
20072	20	56	9	228
20080	21	44	4	192
20088	20	33	3	71
20096	21	38	4	167
18847	21	46	4	211
18855	27	68	5	3
18863	8	71	4	7
18871	9	74	3	16
18879	26	9	4	6
18887	28	10	6	4
18895	20	35	7	2
18903	22	5	7	1
18911	4	11	7	2
18919	20	14	4	5
18927	8	56	12	147
18935	28	22	3	8
18943	28	13	4	115
18951	22	49	9	228
18959	24	66	7	1
18967	15	8	4	6
18975	11	43	7	2
18983	12	56	3	223
18991	25	9	4	6
18999	23	18	4	103
19007	11	6	9	228
19015	7	39	4	140
19023	16	17	4	32
19031	8	26	9	228
19039	22	19	4	6
19047	15	10	5	3
19055	27	17	5	3
19063	25	58	4	5
19071	20	29	9	228
19079	15	54	4	218
19087	10	11	4	7
19095	23	18	4	66
19103	13	16	3	57
19111	8	4	3	20
19119	7	31	4	7
19127	4	68	4	7
19135	27	53	7	2
19143	21	27	4	6
19151	13	67	7	2
19159	2	12	6	4
19167	27	65	3	188
19175	28	39	5	3
19183	25	33	3	105
19191	18	1	8	88
19199	14	46	4	230
19207	23	47	4	5
19215	20	15	5	3
19223	26	49	6	4
19231	3	67	7	2
19239	2	23	3	164
19247	4	67	9	228
19255	28	23	4	6
19263	23	7	4	5
19271	24	25	9	228
19279	2	61	9	228
19287	7	5	7	2
19295	12	35	4	5
19303	21	13	6	4
19311	16	8	4	28
19319	28	41	13	109
19327	21	62	4	5
19335	19	43	4	5
19343	21	27	3	123
19351	17	6	7	1
19359	27	42	6	4
19367	11	73	7	1
19375	27	28	3	161
19383	4	50	5	3
19391	7	70	4	6
19399	17	46	3	222
19407	24	26	4	31
19415	15	52	4	145
19423	26	42	7	2
19431	17	25	6	4
19439	12	31	4	6
19447	7	39	9	228
19455	23	11	12	96
19463	5	15	4	7
19471	3	1	3	13
19479	5	49	9	228
19487	12	65	3	125
19495	10	58	4	114
19503	23	56	12	146
19511	3	5	4	6
19519	14	45	3	232
19527	13	46	4	227
19535	6	20	9	228
19543	26	16	7	2
19551	4	60	4	7
19559	18	25	4	33
19567	8	27	4	6
19575	6	27	12	191
19583	17	23	4	5
19591	4	54	4	7
19599	3	46	3	225
19607	13	43	12	101
19615	7	14	3	57
19623	13	20	5	3
19631	6	70	4	43
19639	22	9	12	111
19647	11	46	3	231
19655	28	7	5	3
19663	10	12	4	6
19671	11	73	4	6
19679	14	28	4	5
19687	11	42	6	4
19695	27	44	7	1
19703	11	74	7	2
19711	27	66	6	4
19719	14	16	5	3
19727	14	30	4	6
19735	16	72	5	3
19743	7	66	4	7
19751	4	10	4	7
19759	10	43	5	3
19767	3	11	9	228
19775	19	56	12	214
19783	7	12	4	6
19791	19	11	4	5
19799	25	34	7	2
19807	8	30	3	161
19815	16	62	6	4
19823	17	1	7	1
19831	13	48	9	228
19839	18	57	5	3
19847	16	25	4	33
19855	8	18	4	5
19863	16	30	3	161
19871	17	38	4	6
19879	15	38	9	228
19887	6	17	4	5
19895	8	43	3	232
19903	21	72	4	6
19911	28	45	3	229
19919	16	61	4	7
19927	19	55	4	80
19935	20	39	6	4
19943	21	60	4	7
19951	9	11	3	132
19959	16	17	4	133
19967	18	35	4	7
19975	24	45	3	231
19983	17	46	4	6
19991	8	46	7	1
19999	15	17	4	103
20007	8	61	7	2
20015	16	9	4	6
20023	10	56	12	174
20031	17	61	4	7
20039	4	21	6	4
20047	18	53	7	2
20055	12	42	6	4
20063	16	55	4	5
20071	19	65	4	6
20079	8	25	6	4
20087	4	52	3	154
20095	15	30	3	68
18850	28	63	3	126
18858	13	13	4	115
18866	20	1	8	88
18874	3	53	4	6
18882	13	70	9	228
18890	7	45	7	1
18898	14	49	9	228
18906	23	23	9	228
18914	17	40	4	39
18922	7	68	4	42
18930	13	56	12	82
18938	20	12	3	87
18946	27	63	3	126
18954	12	35	7	2
18962	20	41	7	1
18970	11	27	3	53
18978	7	17	9	228
18986	28	38	4	5
18994	9	39	9	228
19002	14	44	3	130
19010	4	23	4	112
19018	18	38	4	7
19026	20	29	6	4
19034	11	4	5	3
19042	8	19	5	3
19050	12	36	5	3
19058	6	64	5	3
19066	26	58	4	114
19074	2	6	3	120
19082	23	67	9	228
19090	3	55	7	1
19098	13	74	3	100
19106	19	38	4	7
19114	11	1	8	88
19122	23	49	4	85
19130	5	17	7	2
19138	21	70	3	152
19146	24	71	9	228
19154	23	63	11	90
19162	15	18	4	66
19170	12	70	7	1
19178	28	16	9	228
19186	12	28	3	138
19194	15	27	12	163
19202	26	28	3	184
19210	24	63	3	90
19218	24	9	4	6
19226	8	35	4	7
19234	4	69	4	6
19242	26	49	5	3
19250	18	72	4	5
19258	22	5	4	7
19266	27	7	6	4
19274	26	46	4	227
19282	21	10	6	4
19290	15	16	6	4
19298	12	57	3	18
19306	23	6	3	63
19314	6	30	4	5
19322	15	16	5	3
19330	8	31	4	5
19338	7	39	7	2
19346	11	16	3	57
19354	26	33	7	1
19362	11	44	4	192
19370	10	41	4	6
19378	10	6	7	1
19386	7	46	3	200
19394	9	30	6	4
19402	25	17	5	3
19410	27	23	7	1
19418	15	17	4	180
19426	27	67	4	5
19434	22	49	4	5
19442	10	57	6	4
19450	19	15	6	4
19458	9	8	4	28
19466	15	43	7	1
19474	21	55	3	159
19482	8	27	7	1
19490	3	8	4	5
19498	12	17	5	3
19506	22	20	4	5
19514	23	10	3	204
19522	21	47	6	4
19530	16	41	4	11
19538	18	18	4	5
19546	7	10	3	178
19554	12	33	7	1
19562	19	12	7	1
19570	22	27	9	228
19578	6	31	7	1
19586	5	31	3	162
19594	11	20	4	113
19602	9	40	12	92
19610	25	42	4	7
19618	5	57	4	79
19626	16	39	3	22
19634	18	9	12	70
19642	21	28	4	5
19650	15	66	4	7
19658	13	8	7	1
19666	11	33	7	1
19674	15	38	4	64
19682	21	9	4	7
19690	23	62	4	6
19698	21	46	3	229
19706	2	32	3	75
19714	27	56	3	215
19722	20	9	7	2
19730	7	14	6	4
19738	15	42	4	5
19746	11	47	6	4
19754	8	67	4	41
19762	23	48	5	3
19770	16	48	7	1
19778	11	35	9	228
19786	22	73	7	2
19794	18	17	5	3
19802	16	63	4	5
19810	18	19	7	1
19818	26	14	4	7
19826	23	64	7	1
19834	2	36	6	4
19842	11	67	7	2
19850	28	23	3	137
19858	25	59	7	1
19866	7	46	3	232
19874	27	66	9	228
19882	2	46	7	1
19890	25	14	4	7
19898	8	9	4	6
19906	7	20	7	2
19914	7	67	5	3
19922	3	41	7	1
19930	8	46	12	216
19938	17	27	7	1
19946	8	26	4	31
19954	27	18	4	6
19962	2	11	4	7
19970	3	29	6	4
19978	28	50	4	6
19986	20	9	12	111
19994	13	39	5	3
20002	28	71	5	3
20010	13	7	4	65
20018	23	56	12	215
20026	18	73	7	1
20034	3	13	4	6
20042	6	67	6	4
20050	17	53	10	203
20058	20	65	3	125
20066	18	73	4	6
20074	15	66	5	3
20082	17	67	4	41
20090	4	68	5	3
20098	26	26	2	187
18852	19	14	5	3
18860	8	51	6	4
18868	19	56	12	122
18876	3	5	3	84
18884	2	47	6	4
18892	24	32	5	3
18900	22	42	4	7
18908	13	63	4	7
18916	19	11	4	7
18924	16	56	12	147
18932	18	72	5	3
18940	19	64	9	228
18948	18	30	3	162
18956	16	44	7	2
18964	26	62	7	1
18972	15	67	6	4
18980	22	8	7	1
18988	22	21	4	142
18996	9	56	3	82
19004	25	68	9	228
19012	23	8	4	6
19020	7	42	4	7
19028	15	51	4	6
19036	11	70	4	7
19044	11	36	6	4
19052	6	5	12	84
19060	9	6	3	63
19068	18	55	4	6
19076	7	13	7	1
19084	15	38	4	128
19092	19	11	7	2
19100	8	47	9	228
19108	15	10	3	204
19116	2	64	3	14
19124	9	32	4	36
19132	22	74	4	7
19140	28	6	4	5
19148	8	37	5	3
19156	21	17	9	228
19164	2	37	3	205
19172	3	50	9	228
19180	4	72	4	5
19188	10	1	8	88
19196	25	57	9	228
19204	25	33	7	1
19212	25	36	3	182
19220	22	24	6	4
19228	8	26	4	5
19236	24	56	12	208
19244	14	40	7	1
19252	4	32	4	5
19260	26	54	10	221
19268	22	9	4	27
19276	9	48	7	1
19284	18	25	5	3
19292	23	22	3	73
19300	22	4	4	121
19308	19	20	4	113
19316	24	6	7	1
19324	15	29	6	206
19332	2	53	10	203
19340	18	32	4	5
19348	16	11	5	3
19356	23	50	3	185
19364	15	60	4	5
19372	8	43	6	4
19380	27	51	10	54
19388	4	24	3	137
19396	2	71	4	6
19404	15	45	5	3
19412	8	25	4	67
19420	14	37	4	7
19428	28	35	4	77
19436	28	5	6	4
19444	24	18	4	5
19452	26	47	6	4
19460	25	50	4	5
19468	20	56	3	146
19476	21	14	7	2
19484	3	66	4	6
19492	11	72	4	5
19500	18	40	4	5
19508	7	39	4	7
19516	23	18	7	1
19524	24	15	7	2
19532	13	27	3	149
19540	10	40	4	5
19548	7	5	3	40
19556	13	60	5	3
19564	19	41	7	1
19572	5	20	7	2
19580	5	69	4	6
19588	6	60	9	228
19596	8	36	4	5
19604	25	67	5	3
19612	14	56	6	4
19620	13	5	4	7
19628	28	48	7	2
19636	15	74	3	135
19644	16	32	4	36
19652	12	39	4	7
19660	11	49	4	7
19668	10	51	7	1
19676	27	26	4	6
19684	8	17	6	4
19692	19	42	6	4
19700	24	70	4	43
19708	4	10	6	4
19716	5	37	7	1
19724	10	70	4	6
19732	17	46	12	216
19740	13	28	9	228
19748	16	36	9	228
19756	24	3	5	3
19764	6	69	7	1
19772	23	38	9	228
19780	5	8	4	6
19788	7	5	3	177
19796	27	4	7	1
19804	4	14	3	57
19812	12	43	4	5
19820	9	50	4	5
19828	4	47	4	7
19836	26	48	7	2
19844	27	71	9	228
19852	16	11	3	132
19860	24	2	7	2
19868	18	15	6	4
19876	12	21	4	168
19884	6	66	4	7
19892	18	33	4	6
19900	16	64	5	3
19908	7	41	7	2
19916	22	14	6	4
19924	20	8	4	6
19932	19	54	10	221
19940	20	21	4	168
19948	5	8	7	1
19956	7	9	4	27
19964	5	28	7	2
19972	6	2	5	3
19980	8	63	4	48
19988	24	38	4	6
19996	4	39	4	7
20004	19	10	6	4
20012	19	45	3	231
20020	5	17	4	5
20028	4	33	7	1
20036	6	28	9	228
20044	11	62	4	5
20052	22	74	5	3
20060	20	66	3	86
20068	23	46	6	4
20076	16	1	8	148
20084	26	18	4	6
20092	21	12	7	1
20100	24	11	3	158
18851	15	69	7	1
18859	9	51	5	3
18867	12	52	7	1
18875	10	46	4	7
18883	8	68	4	61
18891	8	44	7	2
18899	13	68	5	3
18907	7	63	4	7
18915	15	43	5	3
18923	10	72	5	3
18931	27	58	4	114
18939	12	12	3	87
18947	26	25	6	4
18955	6	29	6	4
18963	13	51	2	212
18971	13	68	4	42
18979	20	53	10	203
18987	17	28	4	6
18995	15	68	4	5
19003	15	3	12	189
19011	22	29	3	161
19019	21	15	7	1
19027	2	14	4	7
19035	19	43	7	2
19043	10	25	4	67
19051	11	1	3	13
19059	17	6	3	63
19067	14	43	4	59
19075	18	64	9	228
19083	14	29	5	3
19091	23	21	4	142
19099	7	11	6	4
19107	9	19	4	5
19115	22	44	3	130
19123	25	5	12	84
19131	3	46	3	226
19139	7	28	3	17
19147	7	70	6	4
19155	3	6	4	7
19163	19	57	5	3
19171	2	53	7	2
19179	15	59	6	4
19187	25	31	3	162
19195	16	35	3	166
19203	17	32	4	36
19211	20	57	3	18
19219	23	16	6	4
19227	26	15	9	228
19235	22	42	6	4
19243	8	53	7	2
19251	14	39	5	3
19259	26	45	4	227
19267	22	46	3	226
19275	6	5	12	171
19283	23	9	7	2
19291	7	18	4	103
19299	28	4	4	121
19307	12	27	3	123
19315	28	6	3	120
19323	8	56	3	122
19331	27	31	7	1
19339	3	64	9	228
19347	8	53	10	203
19355	11	12	7	1
19363	16	65	4	5
19371	14	29	7	1
19379	10	1	8	148
19387	10	6	4	49
19395	9	53	9	228
19403	10	58	4	5
19411	8	11	5	3
19419	18	35	5	3
19427	6	25	4	5
19435	16	45	7	1
19443	21	48	7	2
19451	10	43	4	5
19459	23	15	4	5
19467	10	44	3	179
19475	13	46	3	226
19483	3	28	4	7
19491	25	49	6	4
19499	25	32	4	5
19507	3	63	4	48
19515	11	4	7	1
19523	18	30	3	161
19531	24	17	6	4
19539	26	20	5	3
19547	28	74	6	4
19555	12	56	12	214
19563	24	53	5	3
19571	2	14	7	1
19579	9	3	5	3
19587	17	46	3	225
19595	17	48	7	1
19603	25	6	4	49
19611	20	35	4	5
19619	26	45	3	229
19627	17	67	4	7
19635	18	5	3	171
19643	22	71	4	7
19651	4	21	4	168
19659	23	25	3	139
19667	15	10	4	5
19675	27	20	5	3
19683	14	50	3	185
19691	20	34	6	4
19699	6	49	10	224
19707	12	58	4	6
19715	22	16	5	3
19723	8	20	4	6
19731	9	42	12	108
19739	17	47	7	2
19747	8	44	4	5
19755	14	38	7	2
19763	16	46	4	6
19771	28	71	4	56
19779	22	32	7	1
19787	8	60	4	6
19795	16	43	4	7
19803	23	35	4	77
19811	19	47	6	4
19819	9	47	7	2
19827	28	49	10	170
19835	21	5	3	177
19843	2	45	3	216
19851	25	31	4	6
19859	24	14	3	57
19867	18	21	9	228
19875	26	74	9	228
19883	19	26	4	6
19891	22	1	7	2
19899	6	33	4	35
19907	7	18	4	66
19915	9	64	5	3
19923	7	32	7	1
19931	16	46	7	1
19939	15	70	7	2
19947	2	30	5	3
19955	3	53	10	203
19963	8	29	9	228
19971	5	10	5	3
19979	13	7	4	5
19987	16	64	6	4
19995	12	24	9	228
20003	4	67	7	2
20011	11	10	6	4
20019	7	74	3	69
20027	18	56	12	174
20035	6	68	4	5
20043	28	2	12	175
20051	7	4	4	6
20059	18	54	5	3
20067	18	24	7	2
20075	19	52	10	154
20083	6	49	4	45
20091	8	25	4	33
20099	17	45	3	225
19641	25	24	7	2
19649	22	15	4	5
19657	15	15	4	5
19665	11	44	7	1
19673	21	44	12	179
19681	18	4	4	83
19689	5	65	3	125
19697	21	10	3	204
19705	3	46	12	216
19713	7	48	6	4
19721	21	41	7	2
19729	26	61	4	5
19737	3	68	5	3
19745	2	46	3	225
19753	25	51	7	1
19761	22	64	4	6
19769	4	7	4	7
19777	11	2	6	4
19785	5	3	12	189
19793	18	62	5	3
19801	25	74	4	7
19809	8	22	6	4
19817	11	46	4	230
19825	7	15	4	5
19833	7	40	7	1
19841	7	45	4	227
19849	14	14	6	4
19857	26	51	7	1
19865	24	19	4	6
19873	14	65	12	188
19881	12	58	7	1
19889	20	10	5	3
19897	14	50	10	202
19905	11	26	4	6
19913	12	56	6	4
19921	13	30	3	162
19929	22	27	12	191
19937	11	31	4	6
19945	14	39	4	5
19953	12	11	4	5
19961	28	55	4	6
19969	12	42	5	3
19977	27	17	4	160
19985	28	10	3	190
19993	3	62	5	3
20001	16	52	4	6
20009	22	25	3	139
20017	27	3	4	5
20025	11	31	6	206
20033	2	25	4	33
20041	7	13	7	2
20049	13	58	4	6
20057	23	6	6	4
20065	7	9	12	111
20073	9	67	4	41
20081	14	5	3	40
20089	9	56	12	208
20097	23	45	4	7
20105	28	27	3	123
20113	12	40	4	6
20121	26	50	3	202
20129	8	6	4	49
20137	9	24	4	7
20145	5	35	6	4
20153	6	26	7	1
20161	3	61	7	2
20169	4	13	4	115
20177	7	67	6	4
20185	25	18	4	103
20193	2	1	8	148
20201	10	10	9	228
20209	19	70	4	5
20217	18	10	5	3
20225	16	23	4	7
20233	13	64	7	1
20241	13	1	6	4
20249	12	3	7	1
20257	14	27	4	5
20265	4	2	9	228
20273	9	38	4	19
20281	27	22	9	228
20289	8	23	4	7
20297	24	56	3	215
20305	3	5	3	143
20313	12	18	4	32
20321	12	48	5	3
20329	20	36	4	6
20337	14	19	5	3
20345	12	8	7	2
20353	21	40	7	2
20361	6	55	3	144
20369	2	16	4	7
20377	11	62	9	228
20385	4	66	9	228
20393	11	15	7	2
20401	20	43	12	101
20409	14	43	7	1
20417	15	27	4	5
20425	19	1	6	4
20433	27	47	7	2
20441	19	56	12	146
20449	10	27	12	191
20457	6	36	7	1
20465	26	11	4	6
20473	18	71	4	26
20481	13	45	4	222
20489	2	17	4	5
20497	7	1	5	3
20505	26	56	12	215
20513	3	55	9	228
20521	25	44	12	179
20529	20	38	7	1
20537	7	70	4	60
20545	19	23	4	5
20553	14	59	5	3
20561	22	4	3	20
20569	7	10	3	219
20577	16	47	7	1
20585	20	37	7	2
20593	13	72	3	37
20601	12	41	9	228
20609	10	23	3	164
20617	6	65	4	7
20625	7	4	4	121
20633	2	53	6	4
20641	24	18	4	6
20649	11	56	2	223
20657	20	16	4	25
20665	12	27	4	7
20673	22	70	7	1
20681	7	62	5	3
20689	5	13	7	2
20697	23	7	6	4
20705	17	69	4	6
20713	16	38	4	5
20721	27	52	4	145
20729	26	35	4	77
20737	4	74	3	135
20745	9	60	7	2
20753	7	8	7	2
20761	11	52	9	228
20769	13	69	7	2
20777	2	8	7	1
20785	12	62	5	3
20793	14	18	4	193
20801	9	26	4	6
20809	12	45	4	7
20817	21	73	6	4
20825	16	16	6	4
20833	6	11	7	2
20841	12	33	6	4
20849	21	56	12	147
20857	20	36	6	4
20865	14	43	4	7
20873	18	46	9	228
20881	24	36	4	110
20889	14	47	4	6
19277	19	38	7	1
19285	13	45	3	229
19293	18	42	12	108
19301	8	74	7	1
19309	8	8	4	28
19317	26	7	3	155
19325	2	72	9	228
19333	21	49	5	3
19341	25	43	3	21
19349	22	70	4	98
19357	7	56	4	7
19365	27	36	7	1
19373	4	20	4	7
19381	15	43	4	6
19389	5	7	4	7
19397	19	60	3	169
19405	11	43	4	5
19413	13	46	3	200
19421	16	53	4	7
19429	17	21	4	142
19437	19	44	4	192
19445	2	46	3	222
19453	17	21	9	228
19461	6	57	4	79
19469	11	28	5	3
19477	28	6	7	2
19485	2	74	4	6
19493	28	9	4	7
19501	8	45	7	1
19509	23	14	6	4
19517	26	31	4	6
19525	11	60	3	169
19533	9	1	8	148
19541	12	44	7	1
19549	9	55	3	144
19557	8	72	6	4
19565	12	15	6	4
19573	8	21	9	228
19581	27	27	3	149
19589	16	31	4	5
19597	15	61	7	1
19605	5	54	9	228
19613	22	38	4	64
19621	20	57	5	3
19629	21	56	7	2
19637	10	3	4	5
19645	21	24	9	228
19653	7	71	7	2
19661	3	54	7	2
19669	17	26	4	5
19677	13	7	4	102
19685	24	19	7	1
19693	8	55	3	144
19701	22	20	9	228
19709	18	56	3	223
19717	28	45	3	226
19725	6	16	6	4
19733	15	49	4	117
19741	15	35	4	77
19749	24	39	7	2
19757	20	74	9	228
19765	7	46	3	229
19773	3	16	3	57
19781	9	18	4	180
19789	22	30	4	6
19797	8	23	4	5
19805	11	37	3	205
19813	20	53	9	228
19821	7	25	3	139
19829	7	43	3	21
19837	9	56	3	223
19845	27	41	4	7
19853	5	35	9	228
19861	7	74	3	135
19869	12	14	4	7
19877	21	46	4	7
19885	17	30	3	161
19893	9	61	4	7
19901	17	52	4	6
19909	23	5	4	7
19917	5	21	5	3
19925	22	41	4	7
19933	18	9	6	129
19941	14	43	12	101
19949	4	73	7	1
19957	12	46	4	230
19965	21	40	4	6
19973	4	61	6	4
19981	13	52	7	2
19989	27	34	6	4
19997	4	16	3	57
20005	27	36	3	182
20013	4	61	9	228
20021	28	28	3	161
20029	9	1	4	6
20037	14	17	4	180
20045	27	34	9	228
20053	19	33	3	71
20061	9	46	4	6
20069	16	66	7	1
20077	11	49	5	3
20085	19	49	5	3
20093	17	68	6	4
20101	10	56	12	214
20109	18	33	7	1
20117	13	74	6	4
20125	11	46	4	227
20133	22	48	6	4
20141	22	7	4	5
20149	7	8	4	55
20157	17	53	7	2
20165	8	29	4	7
20173	20	15	4	25
20181	22	50	7	1
20189	7	50	3	202
20197	3	29	9	228
20205	22	38	7	2
20213	22	55	3	144
20221	4	74	4	7
20229	4	52	6	4
20237	26	12	7	2
20245	13	19	5	3
20253	18	30	7	2
20261	26	45	5	3
20269	28	44	7	2
20277	24	36	7	1
20285	10	66	4	47
20293	28	5	4	5
20301	15	40	7	2
20309	6	47	4	38
20317	25	50	10	202
20325	12	51	10	54
20333	22	19	5	3
20341	12	28	3	184
20349	28	3	4	6
20357	14	31	4	6
20365	25	50	7	1
20373	23	42	4	6
20381	10	10	4	5
20389	21	1	5	3
20397	26	17	4	103
20405	2	53	5	3
20413	13	54	6	4
20421	16	17	4	5
20429	7	8	4	93
20437	19	2	4	5
20445	5	2	12	175
20453	27	45	6	4
20461	12	30	5	3
20469	8	55	4	7
20477	3	26	2	187
20485	27	17	4	66
20493	27	47	4	7
20501	15	7	6	4
20509	20	13	9	228
20517	3	45	4	227
20525	15	25	3	183
20102	2	20	7	1
20110	17	29	9	228
20118	21	42	5	3
20126	18	10	9	228
20134	27	44	4	192
20142	17	30	5	3
20150	27	28	5	3
20158	17	3	4	7
20166	6	18	4	103
20174	14	13	4	7
20182	25	56	4	7
20190	14	6	9	228
20198	18	38	7	1
20206	27	6	4	7
20214	4	57	3	18
20222	15	8	4	93
20230	5	55	9	228
20238	10	62	4	127
20246	9	46	4	5
20254	9	5	4	7
20262	4	56	3	146
20270	9	28	5	3
20278	22	5	4	5
20286	7	21	4	6
20294	13	2	12	175
20302	3	5	4	7
20310	8	74	3	100
20318	28	40	4	7
20326	12	36	4	6
20334	5	27	3	149
20342	13	3	7	1
20350	6	52	5	3
20358	4	9	6	4
20366	7	73	6	4
20374	23	50	7	2
20382	9	67	9	228
20390	11	62	6	4
20398	11	5	3	40
20406	6	68	7	1
20414	12	73	9	228
20422	21	15	6	4
20430	19	41	9	228
20438	8	43	3	101
20446	25	20	5	3
20454	9	49	4	5
20462	12	47	7	2
20470	22	69	7	2
20478	15	64	3	14
20486	27	29	7	1
20494	8	53	6	4
20502	25	22	9	228
20510	27	70	4	43
20518	25	54	7	2
20526	9	51	4	6
20534	5	30	5	3
20542	4	13	7	2
20550	25	27	3	149
20558	17	53	5	3
20566	14	40	13	78
20574	20	5	4	7
20582	12	37	7	2
20590	8	7	4	23
20598	23	26	9	228
20606	27	20	4	5
20614	3	60	7	2
20622	3	42	5	3
20630	6	67	4	5
20638	26	7	4	7
20646	11	5	12	177
20654	26	27	6	4
20662	23	7	5	3
20670	25	56	4	5
20678	5	49	10	170
20686	24	23	3	164
20694	20	25	4	6
20702	23	32	7	2
20710	22	70	4	6
20718	13	70	7	1
20726	20	19	4	7
20734	15	2	4	6
20742	6	27	7	2
20750	28	18	4	193
20758	14	49	7	1
20766	6	74	4	5
20774	6	6	7	1
20782	10	14	4	6
20790	4	12	4	6
20798	16	28	4	7
20806	23	49	3	151
20814	5	62	4	7
20822	28	21	4	7
20830	6	56	3	196
20838	12	57	4	6
20846	13	68	6	4
20854	8	40	4	6
20862	22	3	4	7
20870	8	56	9	228
20878	13	8	9	228
20886	13	22	3	8
20894	24	46	4	222
20902	9	17	4	103
20910	21	68	9	228
20918	17	17	4	180
20926	20	58	4	7
20934	12	29	7	2
20942	5	1	5	3
20950	18	17	4	103
20958	28	11	3	132
20966	27	11	3	132
20974	12	31	9	228
20982	18	44	4	156
20990	3	49	4	117
20998	24	25	7	1
21006	12	55	7	2
21014	6	6	4	5
21022	17	46	9	228
21030	3	66	5	3
21038	21	60	4	6
21046	13	68	9	228
21054	5	41	5	3
21062	7	60	11	169
21070	9	19	6	4
21078	15	67	7	2
21086	6	60	7	1
21094	13	70	5	3
21102	6	54	7	1
21110	18	38	6	4
21118	3	6	6	4
21126	17	41	4	7
21134	28	33	4	5
21142	16	49	4	5
21150	14	11	9	228
21158	19	23	7	2
21166	4	35	7	1
21174	3	59	5	3
21182	5	51	5	3
21190	13	11	7	2
21198	9	61	7	1
21206	11	4	9	228
21214	8	11	12	96
21222	20	31	9	228
21230	26	8	6	4
21238	16	10	3	190
21246	9	59	6	4
21254	8	6	7	2
21262	8	18	7	1
21270	27	38	4	5
21278	16	6	4	7
21286	18	28	3	99
21294	13	29	4	7
21302	4	55	12	159
21310	28	45	3	225
21318	11	26	7	2
21326	21	61	7	2
21334	10	1	9	228
21342	6	51	4	5
21350	10	46	4	222
20533	17	50	10	202
20541	17	5	3	177
20549	18	32	4	6
20557	9	31	3	161
20565	18	34	5	3
20573	9	58	7	1
20581	2	18	4	103
20589	24	27	3	123
20597	10	5	3	40
20605	7	57	7	1
20613	24	74	6	4
20621	5	28	3	161
20629	11	14	4	6
20637	2	21	4	142
20645	17	70	4	5
20653	24	60	6	4
20661	3	43	3	21
20669	7	30	4	5
20677	17	42	6	4
20685	24	48	9	228
20693	12	73	7	2
20701	19	30	6	4
20709	20	6	7	1
20717	10	16	5	3
20725	17	43	4	5
20733	10	13	4	7
20741	24	73	3	34
20749	8	5	3	177
20757	16	47	4	6
20765	10	50	3	185
20773	18	2	4	5
20781	17	52	7	2
20789	24	66	9	228
20797	12	56	2	223
20805	20	33	9	228
20813	6	45	3	229
20821	14	58	7	2
20829	15	55	5	3
20837	7	8	9	228
20845	5	57	7	1
20853	12	36	6	4
20861	21	11	4	7
20869	3	39	4	5
20877	22	40	4	39
20885	28	50	7	2
20893	15	56	12	196
20901	12	37	4	5
20909	21	29	4	7
20917	13	3	7	2
20925	16	38	4	167
20933	6	29	7	2
20941	17	37	6	4
20949	22	39	3	22
20957	25	33	9	228
20965	19	26	4	7
20973	9	30	3	162
20981	18	1	6	4
20989	5	48	4	5
20997	17	23	3	137
21005	6	8	9	228
21013	21	43	4	7
21021	3	45	12	229
21029	16	66	3	86
21037	26	65	9	228
21045	17	50	4	6
21053	21	22	3	137
21061	13	32	7	2
21069	7	1	4	5
21077	2	18	4	66
21085	5	28	4	6
21093	4	61	4	52
21101	18	39	4	5
21109	23	30	4	7
21117	17	19	9	228
21125	16	66	6	4
21133	13	61	4	7
21141	12	28	4	6
21149	6	26	9	228
21157	26	17	4	32
21165	5	31	6	207
21173	12	26	9	228
21181	6	28	4	6
21189	15	1	3	13
21197	17	45	5	3
21205	27	62	3	97
21213	2	11	12	96
21221	8	5	6	4
21229	14	56	12	147
21237	11	39	4	140
21245	4	64	7	1
21253	23	35	7	2
21261	2	18	7	1
21269	12	72	3	37
21277	12	38	5	3
21285	18	46	4	222
21293	22	12	3	87
21301	28	4	4	5
21309	2	49	4	5
21317	26	68	7	2
21325	15	53	10	203
21333	25	46	4	211
21341	15	8	4	5
21349	4	14	5	3
21357	26	28	3	99
21365	26	38	4	5
21373	20	46	3	216
21381	4	65	3	89
21389	3	52	4	145
21397	15	46	3	225
21405	14	28	4	6
21413	8	54	4	209
21421	18	29	4	6
21429	14	25	4	7
21437	28	8	4	28
21445	20	55	4	116
21453	18	12	4	7
21461	22	69	4	5
21469	11	61	7	1
21477	22	17	4	133
21485	20	50	7	2
21493	5	63	6	4
21501	27	63	5	3
21509	15	58	4	5
21517	5	50	7	2
21525	3	37	4	7
21533	23	17	4	7
21541	19	56	12	147
21549	14	1	3	13
21557	7	30	7	2
21565	17	52	3	95
21573	3	71	4	5
21581	21	38	4	94
21589	23	32	4	5
21597	8	56	12	215
21605	26	44	7	2
21613	4	58	4	7
21621	22	60	11	169
21629	18	15	7	1
21637	21	45	4	5
21645	22	34	4	29
21653	18	58	4	7
21661	6	64	4	7
21669	9	38	9	228
21677	13	25	4	67
21685	17	56	12	215
21693	13	31	4	5
21701	9	5	6	4
21709	23	51	4	5
21717	26	24	4	112
21725	11	32	4	7
21733	19	4	3	20
21741	11	23	12	137
21749	23	52	4	6
21757	9	20	4	5
21765	10	70	9	228
21773	19	12	7	2
21781	25	53	4	6
20106	22	44	7	1
20114	11	65	3	188
20122	27	35	4	5
20130	21	9	12	111
20138	7	40	4	6
20146	2	43	4	7
20154	24	11	5	3
20162	7	32	4	6
20170	25	16	7	2
20178	28	73	4	7
20186	16	29	4	7
20194	7	42	5	3
20202	7	66	7	2
20210	7	33	4	7
20218	11	55	9	228
20226	16	44	4	192
20234	19	49	4	5
20242	13	69	4	50
20250	24	59	4	7
20258	6	37	9	228
20266	6	5	6	4
20274	28	15	9	228
20282	11	55	4	116
20290	3	43	12	101
20298	19	27	6	4
20306	12	56	5	3
20314	15	45	3	216
20322	11	73	7	2
20330	13	8	4	7
20338	15	39	6	4
20346	18	5	3	143
20354	13	47	7	2
20362	16	35	9	228
20370	10	42	5	3
20378	9	49	4	45
20386	8	53	9	228
20394	5	36	3	182
20402	9	5	3	177
20410	9	56	6	4
20418	11	13	7	2
20426	14	47	6	4
20434	23	58	6	4
20442	3	10	3	204
20450	13	37	7	2
20458	17	49	10	224
20466	14	18	4	133
20474	23	14	4	7
20482	9	53	5	3
20490	19	71	7	1
20498	6	46	12	216
20506	26	1	9	228
20514	7	59	4	7
20522	11	25	4	6
20530	7	51	4	7
20538	24	35	4	5
20546	28	17	4	32
20554	3	20	7	2
20562	12	5	9	228
20570	17	39	7	1
20578	21	59	4	7
20586	28	65	9	228
20594	3	42	9	228
20602	2	67	9	228
20610	16	7	7	1
20618	22	54	10	221
20626	28	49	4	6
20634	13	56	3	196
20642	10	28	3	138
20650	12	50	2	213
20658	5	28	3	184
20666	26	62	9	228
20674	10	71	7	1
20682	18	52	7	2
20690	11	63	4	5
20698	5	46	7	1
20706	6	5	7	2
20714	11	64	4	6
20722	17	20	4	113
20730	25	27	3	123
20738	12	46	4	6
20746	3	40	4	6
20754	13	59	4	136
20762	4	10	4	5
20770	16	31	5	3
20778	24	45	3	200
20786	19	28	3	184
20794	8	7	7	1
20802	6	33	4	7
20810	12	55	4	5
20818	19	62	9	228
20826	14	7	4	6
20834	2	7	4	5
20842	9	10	3	190
20850	10	6	9	228
20858	4	74	4	5
20866	10	56	12	215
20874	12	60	4	6
20882	9	51	6	4
20890	9	48	9	228
20898	19	22	4	6
20906	24	6	9	228
20914	28	24	4	112
20922	8	50	10	202
20930	13	4	5	3
20938	3	55	12	159
20946	9	9	9	228
20954	28	51	2	212
20962	27	53	3	203
20970	14	25	4	104
20978	5	45	4	5
20986	7	60	4	6
20994	3	19	6	4
21002	5	46	5	3
21010	5	12	6	4
21018	6	73	6	4
21026	15	21	9	228
21034	9	51	9	228
21042	19	25	4	6
21050	2	13	5	3
21058	7	27	3	53
21066	8	56	6	4
21074	2	50	7	1
21082	10	46	9	228
21090	8	10	3	204
21098	12	38	4	128
21106	8	41	7	2
21114	16	27	9	228
21122	4	2	4	5
21130	24	73	4	7
21138	17	46	4	222
21146	3	21	7	1
21154	26	39	4	140
21162	13	55	7	2
21170	15	40	4	39
21178	21	62	3	97
21186	23	1	3	13
21194	16	6	7	2
21202	7	26	6	4
21210	7	7	4	6
21218	8	46	4	7
21226	10	12	9	228
21234	16	68	7	1
21242	16	1	4	7
21250	20	49	4	6
21258	19	31	7	2
21266	28	46	3	216
21274	27	18	4	7
21282	21	18	4	193
21290	26	44	5	3
21298	11	28	3	99
21306	25	28	7	1
21314	18	44	7	2
21322	23	53	10	203
21330	6	28	7	1
21338	19	54	4	6
21346	11	73	9	228
21354	5	11	4	58
20103	11	11	4	5
20111	24	56	12	174
20119	21	14	9	228
20127	24	10	9	228
20135	12	2	6	4
20143	4	3	9	228
20151	10	28	12	194
20159	15	64	4	6
20167	28	24	4	5
20175	27	1	4	7
20183	18	70	4	6
20191	17	62	6	4
20199	13	71	6	4
20207	11	5	3	171
20215	7	10	3	153
20223	4	66	4	47
20231	14	17	4	6
20239	8	46	4	211
20247	12	46	3	222
20255	24	68	4	6
20263	28	55	3	144
20271	7	30	9	228
20279	6	50	4	6
20287	11	48	4	7
20295	21	64	7	1
20303	21	19	5	3
20311	16	35	4	5
20319	24	44	4	192
20327	21	8	4	7
20335	16	48	7	2
20343	19	28	4	5
20351	26	13	5	3
20359	10	9	6	4
20367	10	41	7	2
20375	23	18	6	4
20383	5	44	4	6
20391	5	18	4	32
20399	18	14	4	6
20407	26	29	7	1
20415	10	20	9	228
20423	18	13	4	7
20431	14	33	5	3
20439	12	34	4	5
20447	21	17	7	1
20455	6	52	6	4
20463	12	12	4	141
20471	8	17	4	5
20479	26	39	3	74
20487	6	30	5	3
20495	11	25	3	165
20503	16	31	3	161
20511	17	56	9	228
20519	24	22	4	7
20527	27	19	6	4
20535	4	36	3	182
20543	3	49	4	85
20551	17	41	13	109
20559	15	42	4	6
20567	23	31	4	6
20575	11	13	4	7
20583	6	27	4	7
20591	2	51	4	6
20599	16	7	4	23
20607	18	3	4	157
20615	11	64	7	1
20623	20	63	3	90
20631	17	23	5	3
20639	20	6	4	6
20647	4	55	9	228
20655	10	27	3	123
20663	5	5	12	177
20671	8	24	9	228
20679	15	53	4	6
20687	4	20	9	228
20695	19	9	6	4
20703	16	7	4	6
20711	11	25	3	139
20719	5	17	4	160
20727	25	27	7	2
20735	9	9	12	111
20743	27	50	2	213
20751	20	5	7	2
20759	25	41	4	7
20767	27	59	4	136
20775	15	13	4	5
20783	3	44	3	179
20791	28	5	5	3
20799	8	57	4	5
20807	22	69	4	7
20815	20	1	6	4
20823	27	22	3	137
20831	8	71	4	56
20839	3	59	4	136
20847	26	10	7	1
20855	4	44	7	2
20863	18	56	12	215
20871	11	23	4	7
20879	28	31	4	5
20887	7	31	5	3
20895	2	55	7	1
20903	20	26	7	2
20911	10	69	6	4
20919	18	4	4	7
20927	27	17	4	32
20935	28	3	4	7
20943	3	48	6	4
20951	16	48	9	228
20959	3	45	3	201
20967	23	5	4	6
20975	24	38	9	228
20983	4	35	4	6
20991	17	52	4	5
20999	28	44	4	5
21007	11	63	7	2
21015	13	69	4	5
21023	20	65	9	228
21031	17	17	4	103
21039	13	18	7	2
21047	13	62	3	97
21055	2	11	4	6
21063	7	72	4	7
21071	15	25	4	7
21079	25	70	3	152
21087	8	58	7	1
21095	27	5	12	84
21103	23	21	9	228
21111	12	58	7	2
21119	10	28	3	162
21127	16	9	4	7
21135	26	9	4	5
21143	18	53	7	1
21151	7	24	4	6
21159	7	47	4	6
21167	22	31	3	161
21175	20	26	9	228
21183	2	26	2	187
21191	16	56	12	146
21199	9	6	6	4
21207	16	18	7	1
21215	12	70	6	4
21223	21	3	4	7
21231	11	31	6	207
21239	9	10	3	153
21247	19	67	4	6
21255	17	21	4	6
21263	8	42	5	3
21271	9	7	2	186
21279	10	25	3	165
21287	20	37	4	5
21295	9	4	4	7
21303	4	13	4	5
21311	3	73	7	2
21319	27	5	3	119
21327	6	59	4	5
21335	12	40	4	7
21343	4	12	9	228
21351	2	49	10	224
20104	18	56	12	214
20112	9	41	4	6
20120	14	50	7	1
20128	2	6	4	49
20136	6	18	7	1
20144	14	48	6	4
20152	10	42	7	2
20160	7	69	7	1
20168	15	41	6	4
20176	8	10	7	2
20184	24	45	12	216
20192	23	65	12	188
20200	21	74	6	4
20208	5	29	3	162
20216	5	26	2	187
20224	26	30	9	228
20232	23	44	6	4
20240	3	5	3	40
20248	8	3	4	157
20256	19	26	2	187
20264	5	5	4	199
20272	25	31	3	161
20280	16	16	3	57
20288	3	13	4	7
20296	19	55	9	228
20304	19	9	4	27
20312	24	39	7	1
20320	20	6	4	49
20328	20	50	3	197
20336	6	42	4	51
20344	14	32	7	2
20352	9	52	4	7
20360	14	7	6	4
20368	14	4	3	20
20376	23	51	9	228
20384	11	55	3	144
20392	8	23	6	4
20400	4	10	3	210
20408	17	10	3	204
20416	4	38	4	94
20424	24	45	3	226
20432	25	73	4	7
20440	16	49	5	3
20448	25	41	9	228
20456	16	24	6	4
20464	19	5	4	7
20472	19	50	7	1
20480	11	14	7	1
20488	8	67	9	228
20496	12	9	5	3
20504	14	18	7	2
20512	2	47	7	1
20520	17	51	4	6
20528	5	27	4	7
20536	6	59	7	2
20544	15	18	4	133
20552	9	30	7	2
20560	23	6	3	120
20568	22	64	3	14
20576	9	55	4	10
20584	26	41	9	228
20592	5	56	4	5
20600	18	5	3	40
20608	18	27	3	123
20616	24	52	4	7
20624	24	61	4	5
20632	27	43	4	6
20640	24	55	5	3
20648	4	74	9	228
20656	12	38	7	1
20664	13	57	4	6
20672	27	33	9	228
20680	21	45	4	222
20688	15	26	6	4
20696	24	50	4	6
20704	15	69	9	228
20712	14	26	9	228
20720	2	19	7	1
20728	14	27	5	3
20736	24	46	3	225
20744	7	29	4	6
20752	8	49	5	3
20760	12	1	6	4
20768	21	65	4	173
20776	10	2	4	5
20784	18	5	12	171
20792	5	54	4	7
20800	3	8	4	55
20808	21	59	4	136
20816	11	72	4	6
20824	16	15	4	25
20832	21	15	4	6
20840	3	35	4	6
20848	14	56	3	122
20856	4	12	6	4
20864	26	59	4	5
20872	8	24	4	5
20880	24	62	7	1
20888	15	39	4	6
20896	8	55	7	1
20904	23	28	12	194
20912	24	23	3	137
20920	9	48	6	4
20928	20	20	4	6
20936	16	50	7	1
20944	16	56	9	228
20952	3	69	4	7
20960	24	25	3	165
20968	8	50	3	185
20976	6	53	4	198
20984	7	49	7	1
20992	2	40	7	1
21000	22	35	4	7
21008	3	41	7	2
21016	23	53	7	2
21024	15	37	3	205
21032	4	23	4	164
21040	21	18	7	2
21048	4	37	5	3
21056	3	74	5	3
21064	9	21	7	1
21072	4	1	6	4
21080	15	34	4	29
21088	16	45	6	4
21096	4	14	4	25
21104	10	6	6	4
21112	20	17	4	32
21120	11	34	4	5
21128	2	48	6	4
21136	6	65	6	4
21144	28	11	3	158
21152	4	62	4	6
21160	13	47	4	6
21168	13	49	7	1
21176	6	66	4	5
21184	11	12	6	4
21192	25	70	9	228
21200	24	53	4	6
21208	19	70	9	228
21216	13	23	9	228
21224	16	5	6	4
21232	14	52	7	1
21240	7	44	5	3
21248	7	61	7	2
21256	23	8	4	5
21264	2	12	7	2
21272	16	45	9	228
21280	12	54	4	6
21288	15	72	3	72
21296	14	12	3	87
21304	9	56	12	146
21312	28	56	3	82
21320	25	36	4	110
21328	3	16	5	3
21336	6	40	13	78
21344	22	56	7	1
21352	8	49	10	224
20108	7	49	4	5
20116	8	43	4	7
20124	25	7	6	4
20132	28	7	4	131
20140	28	46	4	222
20148	12	57	4	5
20156	14	56	12	146
20164	6	24	6	4
20172	4	11	3	158
20180	19	65	3	188
20188	17	42	12	108
20196	15	71	5	3
20204	28	38	7	2
20212	4	70	5	3
20220	4	34	7	2
20228	13	4	3	20
20236	24	23	6	4
20244	14	30	5	3
20252	10	39	7	1
20260	28	36	7	2
20268	17	38	4	19
20276	27	69	6	4
20284	15	65	4	7
20292	20	3	7	1
20300	20	45	5	3
20308	25	52	3	95
20316	9	31	5	3
20324	4	53	4	5
20332	8	48	7	2
20340	21	3	7	1
20348	19	22	6	4
20356	26	56	2	223
20364	14	40	4	7
20372	15	58	6	4
20380	23	37	6	4
20388	19	55	3	144
20396	18	18	7	1
20404	14	13	4	5
20412	22	18	7	2
20420	15	18	6	4
20428	15	46	4	227
20436	25	10	3	153
20444	5	9	6	4
20452	28	45	5	3
20460	9	20	7	2
20468	12	65	4	173
20476	18	1	7	2
20484	21	62	5	3
20492	2	3	12	189
20500	20	41	6	4
20508	27	27	6	4
20516	13	38	7	1
20524	12	54	6	4
20532	4	14	7	1
20540	15	12	6	4
20548	14	26	6	4
20556	13	68	4	6
20564	22	69	4	50
20572	28	4	7	2
20580	14	8	4	93
20588	26	25	3	165
20596	20	22	5	3
20604	12	1	5	3
20612	26	60	5	3
20620	26	22	9	228
20628	20	40	4	78
20636	3	49	4	5
20644	5	14	7	1
20652	15	54	4	5
20660	26	59	7	2
20668	22	73	5	3
20676	28	59	4	136
20684	5	45	3	229
20692	12	41	6	4
20700	26	33	9	228
20708	8	24	6	4
20716	6	60	5	3
20724	13	11	7	1
20732	2	23	9	228
20740	7	48	4	5
20748	15	8	9	228
20756	16	37	4	6
20764	23	47	6	4
20772	13	1	8	124
20780	5	66	9	228
20788	11	66	5	3
20796	15	72	4	7
20804	21	17	4	6
20812	3	55	4	10
20820	11	49	4	117
20828	7	52	4	6
20836	15	32	9	228
20844	17	51	6	4
20852	18	6	9	228
20860	6	73	5	3
20868	5	44	6	4
20876	2	47	4	5
20884	13	18	4	133
20892	27	47	7	1
20900	18	56	3	147
20908	13	31	6	4
20916	19	9	4	5
20924	17	44	7	2
20932	2	16	6	4
20940	13	12	3	87
20948	14	30	4	7
20956	6	60	11	169
20964	18	16	4	25
20972	13	72	4	7
20980	21	29	6	207
20988	11	65	7	2
20996	10	44	4	156
21004	9	33	4	7
21012	19	4	9	228
21020	28	56	4	6
21028	2	25	3	139
21036	8	9	9	228
21044	20	12	3	15
21052	3	72	4	6
21060	13	36	6	4
21068	18	35	4	6
21076	19	17	4	6
21084	18	37	5	3
21092	16	34	6	4
21100	12	65	3	89
21108	10	61	4	52
21116	26	60	7	1
21124	16	7	4	131
21132	22	72	4	7
21140	24	33	4	7
21148	12	54	4	218
21156	11	53	4	198
21164	12	44	9	228
21172	19	69	5	3
21180	12	18	7	2
21188	5	57	4	6
21196	12	44	6	4
21204	13	43	4	7
21212	21	36	9	228
21220	11	51	5	3
21228	8	74	6	4
21236	3	27	5	3
21244	15	68	5	3
21252	3	17	4	180
21260	16	29	4	6
21268	12	36	9	228
21276	5	63	3	126
21284	11	38	6	4
21292	12	36	4	30
21300	11	17	4	66
21308	14	2	4	6
21316	20	68	7	2
21324	6	64	3	14
21332	18	30	3	68
21340	6	57	4	6
21348	15	71	4	6
21356	26	69	5	3
20107	4	5	4	6
20115	9	62	6	4
20123	2	29	6	207
20131	20	14	7	2
20139	2	1	7	1
20147	5	29	3	161
20155	26	66	7	2
20163	8	21	4	7
20171	26	39	9	228
20179	12	15	4	25
20187	19	54	5	3
20195	17	15	9	228
20203	10	59	7	1
20211	26	37	4	30
20219	17	24	9	228
20227	16	12	7	1
20235	25	70	4	5
20243	11	18	4	66
20251	21	16	4	5
20259	25	66	3	86
20267	28	63	3	90
20275	23	36	4	110
20283	10	74	4	7
20291	6	58	4	6
20299	11	29	3	162
20307	26	43	4	6
20315	25	55	5	3
20323	18	2	5	3
20331	19	60	9	228
20339	23	45	4	5
20347	25	39	3	74
20355	7	74	4	5
20363	22	58	7	2
20371	21	5	9	228
20379	27	26	4	7
20387	20	7	7	2
20395	13	48	4	5
20403	26	52	5	3
20411	12	59	4	7
20419	23	2	4	6
20427	18	16	5	3
20435	26	52	3	95
20443	18	27	12	191
20451	12	45	7	2
20459	14	7	3	155
20467	15	59	5	3
20475	7	50	3	197
20483	27	59	9	228
20491	15	72	7	2
20499	9	34	6	4
20507	23	4	4	7
20515	21	73	9	228
20523	19	6	4	6
20531	28	43	4	6
20539	16	11	4	5
20547	25	23	3	164
20555	3	40	7	1
20563	15	40	9	228
20571	19	48	6	4
20579	24	34	6	4
20587	8	63	11	90
20595	27	37	4	30
20603	16	24	9	228
20611	7	19	9	228
20619	13	17	4	6
20627	8	26	7	1
20635	5	45	7	2
20643	12	46	7	1
20651	26	28	4	5
20659	11	28	3	184
20667	28	11	12	96
20675	10	74	6	4
20683	17	20	4	7
20691	16	26	7	1
20699	21	11	7	1
20707	24	24	4	5
20715	25	54	4	7
20723	28	43	7	1
20731	13	73	6	4
20739	3	24	5	3
20747	11	10	3	210
20755	21	41	5	3
20763	16	2	6	4
20771	8	47	4	6
20779	20	50	2	213
20787	9	52	7	2
20795	14	51	7	2
20803	14	54	10	221
20811	11	74	5	3
20819	25	62	9	228
20827	26	8	4	93
20835	7	25	3	183
20843	17	29	6	206
20851	2	59	9	228
20859	8	16	6	4
20867	28	62	3	97
20875	2	45	6	4
20883	16	18	4	6
20891	4	16	4	25
20899	3	50	7	1
20907	22	72	7	2
20915	2	37	4	7
20923	11	14	4	25
20931	28	56	4	46
20939	25	57	7	1
20947	13	58	7	2
20955	3	9	9	228
20963	17	71	5	3
20971	17	45	12	229
20979	2	74	3	135
20987	22	32	9	228
20995	10	1	6	4
21003	6	12	5	3
21011	23	34	4	6
21019	11	44	9	228
21027	10	39	4	5
21035	16	23	4	112
21043	26	12	4	5
21051	24	10	3	153
21059	19	8	4	7
21067	19	56	3	147
21075	27	61	4	7
21083	18	31	4	7
21091	2	10	3	204
21099	10	38	9	228
21107	2	46	7	2
21115	13	33	5	3
21123	12	18	4	193
21131	3	61	7	1
21139	3	64	4	6
21147	7	36	5	3
21155	16	46	7	2
21163	13	23	6	4
21171	16	48	6	4
21179	28	32	6	4
21187	27	46	3	216
21195	3	7	4	5
21203	23	50	6	4
21211	16	46	4	7
21219	23	39	7	1
21227	17	11	12	96
21235	18	5	3	84
21243	5	46	12	229
21251	18	51	6	4
21259	6	4	6	4
21267	28	19	3	76
21275	7	15	7	1
21283	16	39	5	3
21291	10	73	4	7
21299	24	28	3	162
21307	6	46	4	211
21315	7	7	4	23
21323	20	29	4	7
21331	11	28	3	162
21339	17	50	3	185
21347	20	38	5	3
21355	25	63	6	4
20897	13	26	9	228
20905	13	10	4	6
20913	12	17	4	6
20921	13	22	3	137
20929	4	34	4	5
20937	3	59	6	4
20945	16	7	4	65
20953	28	38	4	94
20961	3	14	6	4
20969	21	72	4	7
20977	22	68	6	4
20985	22	18	6	4
20993	9	52	4	5
21001	21	27	3	53
21009	5	8	4	7
21017	10	17	4	103
21025	3	17	4	160
21033	15	14	7	1
21041	10	45	4	211
21049	7	43	7	2
21057	6	58	7	2
21065	27	45	3	222
21073	14	3	7	2
21081	13	27	3	53
21089	25	19	4	5
21097	16	30	3	162
21105	10	38	6	4
21113	15	56	4	172
21121	4	49	4	117
21129	24	16	4	5
21137	21	61	4	7
21145	13	25	4	104
21153	10	70	7	2
21161	17	38	7	2
21169	5	46	4	211
21177	28	56	12	147
21185	17	43	4	6
21193	26	23	12	137
21201	22	5	12	84
21209	9	7	4	5
21217	26	51	4	5
21225	9	11	12	96
21233	9	50	7	1
21241	19	39	4	140
21249	11	33	6	4
21257	20	40	4	7
21265	16	37	3	195
21273	13	18	9	228
21281	11	62	4	6
21289	15	32	3	75
21297	26	26	4	7
21305	19	26	7	2
21313	22	56	3	82
21321	3	72	7	1
21329	18	33	7	2
21337	20	4	6	4
21345	11	63	4	7
21353	26	44	9	228
21361	22	4	6	4
21369	7	28	7	1
21377	17	52	4	145
21385	26	30	7	2
21393	11	50	7	2
21401	16	10	3	153
21409	8	49	10	170
21417	26	4	7	2
21425	13	53	4	198
21433	13	41	4	11
21441	3	38	6	4
21449	17	17	4	66
21457	3	27	12	163
21465	14	9	12	70
21473	2	5	4	7
21481	14	51	4	5
21489	6	69	9	228
21497	7	56	4	172
21505	5	18	4	133
21513	6	5	4	5
21521	21	69	5	3
21529	18	60	4	5
21537	15	17	4	7
21545	24	48	4	5
21553	18	3	7	1
21561	4	31	6	207
21569	20	62	3	97
21577	6	27	4	5
21585	16	36	7	1
21593	24	69	7	2
21601	20	56	3	82
21609	26	63	5	3
21617	20	38	4	94
21625	15	1	8	88
21633	3	39	3	107
21641	12	19	5	3
21649	24	49	7	1
21657	15	63	4	48
21665	17	4	4	121
21673	19	3	7	1
21681	21	36	4	30
21689	14	64	9	228
21697	4	59	4	136
21705	18	37	4	7
21713	21	56	3	82
21721	11	12	9	228
21729	13	34	4	29
21737	25	26	6	4
21745	24	15	4	6
21753	2	28	3	184
21761	16	20	5	3
21769	15	60	7	1
21777	6	26	6	4
21785	7	34	4	6
21793	19	45	12	229
21801	6	58	9	228
21809	4	59	6	4
21817	15	43	7	2
21825	12	32	4	7
21833	10	13	5	3
21841	20	56	4	6
21849	5	43	4	7
21857	15	13	7	2
21865	10	15	4	5
21873	19	25	4	67
21881	12	48	7	1
21889	4	7	9	228
21897	20	35	4	7
21905	20	45	3	231
21913	5	58	9	228
21921	3	55	3	159
21929	13	3	5	3
21937	11	16	7	1
21945	16	36	4	7
21953	18	29	6	4
21961	2	17	4	6
21969	18	70	4	98
21977	5	32	9	228
21985	24	23	4	6
21993	21	19	7	1
22001	22	72	4	5
22009	28	31	4	7
22017	24	53	3	203
22025	25	64	7	2
22033	26	7	4	131
22041	7	45	3	231
22049	2	63	3	90
22057	8	49	7	1
22065	13	46	6	4
22073	12	3	5	3
22081	3	7	3	155
22089	11	28	3	17
22097	14	45	4	227
22105	15	16	3	57
22113	22	58	4	5
22121	26	27	4	6
22129	11	27	7	1
22137	18	44	4	5
22145	18	35	3	166
21358	11	35	7	1
21366	20	55	4	7
21374	26	62	4	127
21382	15	57	4	7
21390	20	51	5	3
21398	3	65	7	2
21406	20	69	5	3
21414	3	57	4	6
21422	18	38	4	19
21430	7	55	6	4
21438	4	63	7	2
21446	7	50	9	228
21454	24	40	13	78
21462	12	45	4	5
21470	24	59	9	228
21478	24	51	7	2
21486	11	56	3	196
21494	4	39	4	140
21502	16	38	7	2
21510	21	40	4	39
21518	22	17	4	7
21526	7	38	4	94
21534	24	69	4	50
21542	7	22	7	2
21550	3	16	4	25
21558	10	3	7	1
21566	25	27	4	5
21574	20	36	7	2
21582	18	45	5	3
21590	11	7	4	23
21598	24	33	5	3
21606	4	27	12	163
21614	18	12	7	2
21622	23	46	7	1
21630	23	1	8	88
21638	10	31	6	207
21646	28	48	4	6
21654	20	23	9	228
21662	25	5	5	3
21670	21	68	7	2
21678	19	10	7	1
21686	18	59	4	136
21694	5	45	4	211
21702	12	56	12	147
21710	14	34	4	29
21718	28	29	7	2
21726	27	41	4	11
21734	22	71	4	6
21742	3	22	4	6
21750	7	23	5	3
21758	17	27	9	228
21766	12	73	4	5
21774	20	4	7	2
21782	17	51	7	2
21790	13	30	4	7
21798	2	39	4	5
21806	2	6	6	4
21814	14	11	4	7
21822	7	25	4	7
21830	15	27	3	53
21838	25	18	6	4
21846	6	55	12	159
21854	15	20	4	113
21862	4	68	6	4
21870	6	67	7	2
21878	13	67	6	4
21886	11	24	4	6
21894	5	40	9	228
21902	2	31	3	162
21910	22	71	4	5
21918	23	46	4	211
21926	21	3	5	3
21934	6	32	3	75
21942	4	74	3	16
21950	15	73	7	1
21958	14	4	4	83
21966	11	6	3	63
21974	27	46	6	4
21982	16	12	5	3
21990	21	8	4	28
21998	17	46	4	227
22006	2	39	7	2
22014	13	59	7	1
22022	3	39	4	7
22030	26	11	3	158
22038	24	15	4	25
22046	4	32	4	7
22054	20	71	9	228
22062	10	13	7	1
22070	26	32	12	106
22078	28	50	4	5
22086	11	18	9	228
22094	5	29	9	228
22102	6	5	4	6
22110	5	11	5	3
22118	25	5	7	1
22126	26	3	6	4
22134	15	44	7	1
22142	7	37	3	205
22150	12	38	4	64
22158	2	44	4	156
22166	11	44	3	130
22174	9	18	4	7
22182	24	52	7	1
22190	12	65	3	150
22198	12	8	4	5
22206	3	39	7	2
22214	24	54	10	221
22222	22	6	5	3
22230	18	31	7	1
22238	28	57	4	79
22246	10	46	3	226
22254	20	58	5	3
22262	12	68	4	42
22270	19	53	4	7
22278	6	34	4	6
22286	11	65	4	5
22294	5	23	4	112
22302	25	55	4	6
22310	12	21	4	142
22318	19	56	4	46
22326	20	5	7	1
22334	11	61	4	7
22342	23	44	3	179
22350	25	49	7	2
22358	28	42	4	7
22366	19	7	4	5
22374	14	54	4	218
22382	13	54	4	6
22390	21	46	5	3
22398	13	63	7	2
22406	11	25	6	4
22414	16	46	4	227
22422	23	49	5	3
22430	26	10	4	7
22438	7	46	12	229
22446	25	70	7	2
22454	27	42	4	7
22462	22	56	12	174
22470	19	9	4	6
22478	28	22	3	137
22486	3	73	4	5
22494	18	22	3	73
22502	15	74	7	2
22510	27	30	3	68
22518	27	43	6	4
22526	28	5	7	1
22534	21	62	4	6
22542	21	41	7	1
22550	26	43	7	2
22558	26	56	12	82
22566	6	52	7	1
22574	27	62	4	6
22582	23	24	9	228
22590	7	53	7	2
22598	20	30	4	6
22606	7	61	9	228
21362	28	58	5	3
21370	12	46	3	216
21378	19	55	7	2
21386	18	11	12	96
21394	9	29	7	1
21402	18	17	4	32
21410	24	29	4	6
21418	23	6	4	49
21426	7	26	5	3
21434	7	56	3	208
21442	5	18	4	193
21450	5	59	5	3
21458	9	60	4	5
21466	11	59	6	4
21474	16	54	4	209
21482	17	70	7	2
21490	11	18	4	193
21498	16	67	4	5
21506	8	66	5	3
21514	6	72	4	7
21522	16	9	5	3
21530	7	8	4	5
21538	13	44	6	4
21546	22	71	4	26
21554	12	7	4	6
21562	27	70	4	5
21570	17	52	5	3
21578	8	73	4	7
21586	18	8	6	4
21594	4	60	4	5
21602	15	44	5	3
21610	25	69	6	4
21618	25	18	4	133
21626	4	54	7	1
21634	9	28	4	5
21642	18	59	6	4
21650	22	27	3	53
21658	14	29	7	2
21666	8	25	7	1
21674	8	64	4	6
21682	10	59	4	136
21690	13	2	4	6
21698	7	40	4	39
21706	23	3	7	2
21714	21	5	4	5
21722	23	4	5	3
21730	5	40	7	2
21738	4	73	6	4
21746	3	6	5	3
21754	24	8	9	228
21762	18	61	7	1
21770	12	56	4	46
21778	16	7	2	186
21786	21	32	4	36
21794	14	50	6	4
21802	15	46	12	216
21810	23	70	4	60
21818	26	42	4	6
21826	9	29	4	6
21834	14	18	4	5
21842	11	68	4	42
21850	21	40	12	92
21858	10	6	3	120
21866	27	20	7	2
21874	5	46	4	7
21882	6	57	4	7
21890	10	12	4	5
21898	12	55	12	159
21906	24	10	4	6
21914	28	22	4	6
21922	15	45	3	226
21930	16	19	4	5
21938	12	72	5	3
21946	24	46	3	226
21954	24	29	6	4
21962	19	21	4	7
21970	12	53	4	7
21978	26	57	4	7
21986	10	53	3	203
21994	18	33	4	5
22002	10	31	6	206
22010	24	68	6	4
22018	27	71	5	3
22026	27	21	4	142
22034	26	45	7	1
22042	13	55	12	159
22050	5	64	7	2
22058	14	28	6	4
22066	20	52	4	95
22074	11	40	5	3
22082	19	29	5	3
22090	24	7	4	102
22098	6	3	9	228
22106	14	46	12	229
22114	15	12	4	6
22122	8	14	3	57
22130	11	32	4	36
22138	12	19	7	1
22146	11	25	7	2
22154	27	35	6	4
22162	5	50	9	228
22170	28	42	12	108
22178	28	31	7	2
22186	10	24	4	112
22194	23	15	4	6
22202	4	61	4	7
22210	14	45	3	200
22218	4	11	3	132
22226	7	1	3	13
22234	7	28	4	7
22242	21	14	5	3
22250	22	56	3	223
22258	10	46	3	200
22266	15	73	4	6
22274	4	68	9	228
22282	21	3	12	189
22290	7	9	7	1
22298	19	46	3	229
22306	3	41	4	5
22314	12	1	3	13
22322	2	1	8	124
22330	20	17	4	133
22338	15	56	4	7
22346	20	31	6	207
22354	26	49	4	7
22362	25	17	4	7
22370	7	44	3	130
22378	28	37	7	1
22386	23	37	4	6
22394	3	8	5	3
22402	8	41	4	5
22410	23	35	9	228
22418	17	69	6	4
22426	9	34	4	6
22434	23	52	10	154
22442	22	54	4	218
22450	22	33	3	105
22458	7	46	3	201
22466	3	5	4	5
22474	23	7	4	6
22482	7	63	3	126
22490	12	51	2	212
22498	19	17	4	193
22506	17	56	12	196
22514	24	51	4	5
22522	6	3	4	7
22530	18	14	6	4
22538	14	31	6	4
22546	22	18	4	180
22554	6	6	5	3
22562	25	25	9	228
22570	20	4	4	5
22578	22	57	3	18
22586	8	26	5	3
22594	10	36	4	7
22602	28	49	6	4
22610	2	54	4	5
21364	18	23	12	137
21372	20	45	4	211
21380	28	34	7	1
21388	13	46	3	222
21396	4	45	12	229
21404	18	11	4	6
21412	11	19	3	12
21420	18	63	11	90
21428	23	36	5	3
21436	12	28	3	99
21444	6	72	7	2
21452	23	56	12	82
21460	14	44	6	4
21468	14	8	4	5
21476	20	5	4	5
21484	26	55	4	116
21492	28	30	6	4
21500	23	9	7	1
21508	2	71	5	3
21516	18	5	6	4
21524	28	32	5	3
21532	11	56	12	147
21540	13	67	4	6
21548	28	36	9	228
21556	28	17	4	133
21564	11	55	4	10
21572	5	23	9	228
21580	16	51	10	54
21588	28	24	4	181
21596	2	56	12	215
21604	20	44	7	2
21612	8	10	3	219
21620	23	65	3	150
21628	26	39	7	1
21636	21	58	9	228
21644	11	49	4	6
21652	12	39	3	22
21660	15	41	7	1
21668	4	69	7	2
21676	21	44	6	4
21684	14	14	7	1
21692	7	55	5	3
21700	12	35	7	1
21708	25	69	9	228
21716	21	4	6	4
21724	4	61	7	1
21732	4	51	4	7
21740	11	45	3	201
21748	18	6	4	5
21756	14	4	5	3
21764	9	26	4	7
21772	2	45	4	7
21780	18	9	4	5
21788	13	68	7	2
21796	7	2	7	1
21804	27	71	7	1
21812	19	63	9	228
21820	3	25	4	6
21828	10	11	4	6
21836	5	65	5	3
21844	26	28	7	2
21852	13	67	4	7
21860	15	43	4	5
21868	9	31	7	1
21876	18	15	4	5
21884	3	46	3	200
21892	19	11	3	132
21900	28	49	7	2
21908	26	14	9	228
21916	23	44	4	6
21924	16	8	7	2
21932	18	7	5	3
21940	12	9	7	1
21948	23	54	7	1
21956	6	71	4	56
21964	21	23	4	164
21972	25	43	3	232
21980	16	17	4	66
21988	14	17	6	4
21996	24	54	4	5
22004	18	31	6	206
22012	12	74	7	1
22020	25	25	4	7
22028	22	45	4	227
22036	27	67	9	228
22044	20	45	7	1
22052	28	41	4	6
22060	18	13	7	1
22068	24	31	6	206
22076	19	27	4	6
22084	13	65	3	150
22092	27	28	7	2
22100	9	58	4	7
22108	6	50	6	4
22116	22	30	3	68
22124	13	32	5	3
22132	15	60	3	169
22140	4	44	4	5
22148	23	4	7	1
22156	3	58	7	2
22164	3	18	4	193
22172	5	71	9	228
22180	13	48	7	1
22188	18	24	4	112
22196	19	13	7	1
22204	24	18	6	4
22212	4	7	3	155
22220	3	47	9	228
22228	3	36	9	228
22236	11	46	3	232
22244	28	56	12	208
22252	14	56	12	208
22260	21	18	4	5
22268	11	70	4	98
22276	5	39	6	4
22284	22	43	3	21
22292	20	36	4	5
22300	20	35	4	30
22308	26	28	4	7
22316	22	57	6	4
22324	15	3	4	5
22332	14	29	4	5
22340	27	45	7	1
22348	9	50	4	7
22356	25	32	12	106
22364	8	55	3	159
22372	8	23	4	6
22380	22	19	7	1
22388	28	54	4	218
22396	13	42	12	108
22404	28	52	3	154
22412	21	2	7	2
22420	14	33	7	1
22428	22	24	9	228
22436	9	8	5	3
22444	14	43	5	3
22452	9	70	4	98
22460	25	46	4	222
22468	24	17	4	7
22476	19	68	7	2
22484	8	47	6	4
22492	23	2	6	4
22500	24	39	5	3
22508	17	24	4	112
22516	14	7	7	1
22524	22	38	5	3
22532	11	39	4	5
22540	2	55	3	159
22548	9	53	4	6
22556	12	1	4	6
22564	6	40	12	92
22572	21	33	3	105
22580	18	16	4	6
22588	6	66	4	6
22596	5	58	4	5
22604	14	45	3	231
22612	5	30	7	1
21363	25	21	4	6
21371	6	58	6	4
21379	27	62	7	2
21387	15	40	4	5
21395	21	72	3	72
21403	3	20	4	5
21411	10	8	4	7
21419	26	31	5	3
21427	16	33	4	7
21435	6	67	7	1
21443	5	47	4	6
21451	18	45	12	229
21459	13	40	4	39
21467	15	60	4	6
21475	10	4	4	121
21483	24	37	9	228
21491	6	18	9	228
21499	26	28	3	162
21507	26	58	6	4
21515	4	11	7	1
21523	21	16	7	1
21531	2	5	3	40
21539	19	19	5	3
21547	9	27	6	4
21555	20	67	4	6
21563	8	1	9	228
21571	21	46	3	222
21579	4	17	4	32
21587	15	9	7	1
21595	15	1	7	1
21603	20	8	5	3
21611	14	9	7	1
21619	10	12	7	2
21627	12	74	3	16
21635	16	52	3	95
21643	23	43	7	2
21651	22	37	4	5
21659	6	4	4	7
21667	27	36	4	7
21675	11	38	4	128
21683	2	43	12	101
21691	22	46	3	222
21699	18	31	6	207
21707	5	49	7	1
21715	27	71	4	26
21723	22	72	5	3
21731	6	59	5	3
21739	28	23	4	5
21747	4	33	6	4
21755	26	36	4	7
21763	28	57	7	2
21771	23	25	4	33
21779	22	36	6	4
21787	23	32	12	106
21795	6	7	7	1
21803	2	70	7	2
21811	13	45	4	5
21819	15	9	12	70
21827	13	37	4	5
21835	19	22	3	137
21843	25	55	7	1
21851	17	8	4	93
21859	10	42	7	1
21867	4	26	9	228
21875	12	34	4	29
21883	12	46	3	232
21891	23	3	4	5
21899	28	29	4	5
21907	12	45	12	216
21915	6	28	12	194
21923	21	9	4	6
21931	26	72	3	118
21939	6	34	4	29
21947	24	61	7	2
21955	14	41	4	6
21963	6	68	5	3
21971	4	69	4	5
21979	26	61	6	4
21987	13	68	4	5
21995	23	35	4	5
22003	13	8	4	28
22011	6	53	7	2
22019	3	70	4	6
22027	9	31	3	162
22035	2	18	4	193
22043	17	17	4	32
22051	4	47	9	228
22059	20	37	7	1
22067	20	3	5	3
22075	13	64	5	3
22083	26	13	4	115
22091	18	7	4	102
22099	21	68	4	5
22107	18	10	7	1
22115	10	41	4	5
22123	25	54	4	5
22131	23	44	7	1
22139	12	43	5	3
22147	23	31	6	4
22155	16	48	4	5
22163	11	73	4	5
22171	16	65	4	7
22179	11	11	6	4
22187	25	13	4	115
22195	24	14	4	7
22203	13	18	4	5
22211	9	36	9	228
22219	19	43	3	232
22227	17	55	3	159
22235	6	6	7	2
22243	25	3	6	4
22251	20	51	2	212
22259	12	30	7	1
22267	14	57	6	4
22275	3	18	4	7
22283	26	46	9	228
22291	2	33	9	228
22299	20	3	6	4
22307	21	40	4	5
22315	8	48	4	5
22323	27	19	4	6
22331	24	47	6	4
22339	24	38	7	2
22347	12	43	3	232
22355	7	73	4	6
22363	11	26	4	5
22371	8	40	6	4
22379	4	38	4	64
22387	9	46	7	2
22395	26	45	3	222
22403	7	13	4	6
22411	3	12	9	228
22419	18	18	5	3
22427	14	16	4	7
22435	8	24	4	6
22443	20	56	3	174
22451	6	11	9	228
22459	3	56	3	82
22467	2	45	3	201
22475	14	5	3	171
22483	6	27	3	53
22491	21	31	7	2
22499	17	23	7	1
22507	4	40	4	39
22515	5	17	4	133
22523	21	73	4	6
22531	26	43	3	232
22539	6	46	4	222
22547	2	8	5	3
22555	16	49	3	151
22563	13	33	7	1
22571	26	4	4	5
22579	25	43	7	2
22587	27	44	4	5
22595	21	17	6	4
22603	19	10	3	220
22611	17	39	5	3
21360	4	3	7	1
21368	19	62	3	97
21376	23	57	4	7
21384	16	35	4	77
21392	4	68	4	6
21400	18	52	4	5
21408	21	44	4	156
21416	16	44	12	179
21424	5	58	7	2
21432	20	28	3	99
21440	5	40	13	78
21448	15	54	7	2
21456	8	28	3	161
21464	20	55	9	228
21472	27	36	7	2
21480	25	37	3	195
21488	16	46	4	222
21496	24	22	3	8
21504	15	3	7	2
21512	28	50	5	3
21520	25	3	4	6
21528	13	56	7	1
21536	4	45	5	3
21544	12	12	9	228
21552	2	46	6	4
21560	12	25	4	67
21568	11	31	9	228
21576	14	50	9	228
21584	5	31	9	228
21592	19	27	5	3
21600	14	25	6	4
21608	6	10	4	6
21616	18	73	9	228
21624	28	46	3	222
21632	22	29	6	207
21640	16	19	7	2
21648	11	27	5	3
21656	9	45	6	4
21664	23	44	5	3
21672	20	55	4	10
21680	20	22	3	137
21688	5	8	9	228
21696	15	72	4	5
21704	19	8	5	3
21712	25	25	3	183
21720	23	60	7	1
21728	23	49	4	7
21736	18	4	4	121
21744	7	36	4	30
21752	19	18	7	2
21760	11	13	4	5
21768	25	65	5	3
21776	11	58	4	7
21784	13	32	4	36
21792	25	59	9	228
21800	21	31	4	5
21808	10	45	3	201
21816	27	32	4	36
21824	4	45	3	201
21832	8	46	9	228
21840	8	39	4	7
21848	27	25	9	228
21856	23	43	4	5
21864	20	35	6	4
21872	21	67	6	4
21880	18	13	4	6
21888	25	30	3	162
21896	16	54	9	228
21904	15	57	6	4
21912	12	72	6	4
21920	4	52	4	6
21928	17	45	3	216
21936	7	25	4	33
21944	12	47	4	5
21952	6	72	9	228
21960	25	4	4	5
21968	8	54	9	228
21976	26	56	3	208
21984	22	17	6	4
21992	20	7	4	5
22000	17	51	4	5
22008	13	11	4	5
22016	11	13	7	1
22024	20	43	6	4
22032	27	37	7	1
22040	12	43	4	59
22048	27	48	4	6
22056	18	11	6	4
22064	2	17	4	66
22072	21	64	5	3
22080	7	32	3	75
22088	10	35	3	166
22096	13	45	3	231
22104	26	46	3	232
22112	27	70	7	2
22120	21	32	5	3
22128	21	28	12	194
22136	20	43	5	3
22144	19	27	7	1
22152	21	38	4	7
22160	15	43	3	21
22168	2	65	9	228
22176	6	71	6	4
22184	19	11	5	3
22192	11	14	6	4
22200	11	11	3	158
22208	16	47	4	7
22216	11	38	4	167
22224	7	52	10	154
22232	20	27	7	1
22240	21	30	4	6
22248	10	8	5	3
22256	20	32	5	3
22264	2	47	4	7
22272	25	74	4	6
22280	25	72	9	228
22288	17	68	4	7
22296	23	33	7	1
22304	26	37	4	6
22312	5	53	10	203
22320	6	37	3	205
22328	28	11	3	24
22336	12	18	4	5
22344	27	63	7	2
22352	18	17	7	2
22360	22	56	12	214
22368	26	11	9	228
22376	9	6	7	2
22384	10	40	5	3
22392	9	56	4	6
22400	22	55	7	2
22408	14	24	4	7
22416	3	71	9	228
22424	24	46	4	7
22432	13	2	7	2
22440	12	67	4	41
22448	24	20	7	1
22456	7	3	9	228
22464	13	53	4	7
22472	7	29	6	4
22480	3	40	6	4
22488	15	2	6	4
22496	19	30	4	6
22504	20	1	4	6
22512	6	35	7	2
22520	13	73	4	6
22528	10	14	6	4
22536	2	12	9	228
22544	11	66	7	1
22552	14	19	7	1
22560	28	3	6	4
22568	14	27	7	1
22576	22	70	5	3
22584	16	7	5	3
22592	13	17	6	4
22600	2	68	4	61
22608	22	53	4	7
21359	4	8	4	7
21367	23	52	7	1
21375	3	60	4	5
21383	18	14	4	5
21391	7	25	7	2
21399	16	38	9	228
21407	22	20	7	1
21415	21	67	4	6
21423	5	13	4	5
21431	27	68	4	7
21439	24	31	6	4
21447	14	32	3	75
21455	24	17	7	1
21463	11	61	4	52
21471	11	12	7	2
21479	27	39	7	1
21487	19	18	4	193
21495	26	67	4	6
21503	13	12	5	3
21511	28	29	4	7
21519	19	23	9	228
21527	13	38	4	94
21535	17	38	9	228
21543	12	41	4	11
21551	18	43	4	6
21559	4	29	6	206
21567	22	47	4	38
21575	23	29	9	228
21583	5	56	12	147
21591	3	26	7	2
21599	13	69	5	3
21607	16	45	3	229
21615	2	17	4	103
21623	15	66	4	6
21631	4	43	4	6
21639	15	29	9	228
21647	19	69	6	4
21655	10	37	6	4
21663	23	20	7	1
21671	26	36	4	110
21679	5	49	4	6
21687	7	56	3	122
21695	15	61	7	2
21703	21	39	4	6
21711	23	12	3	87
21719	19	8	6	4
21727	13	39	3	22
21735	23	43	4	7
21743	19	45	4	211
21751	6	40	9	228
21759	18	13	5	3
21767	2	48	5	3
21775	25	4	7	2
21783	13	22	4	7
21791	17	1	9	228
21799	7	42	4	6
21807	24	70	5	3
21815	12	59	5	3
21823	20	37	5	3
21831	2	46	9	228
21839	26	21	4	142
21847	23	20	4	113
21855	25	24	4	112
21863	18	6	3	120
21871	19	56	7	1
21879	9	54	10	221
21887	13	23	3	137
21895	6	35	9	228
21903	24	69	4	5
21911	14	11	3	24
21919	13	9	4	6
21927	16	11	7	2
21935	23	6	4	5
21943	16	30	4	5
21951	27	17	4	133
21959	26	29	3	161
21967	7	53	6	4
21975	28	45	4	227
21983	23	17	5	3
21991	25	52	3	154
21999	12	9	12	70
22007	27	64	5	3
22015	28	28	6	4
22023	12	56	7	1
22031	15	61	4	5
22039	2	15	9	228
22047	16	36	4	110
22055	11	74	7	1
22063	11	72	6	4
22071	26	38	7	2
22079	20	10	3	220
22087	15	4	7	1
22095	7	64	9	228
22103	25	5	3	119
22111	13	9	12	70
22119	20	57	7	2
22127	12	6	4	7
22135	5	55	4	6
22143	13	37	3	205
22151	20	8	4	28
22159	22	18	4	5
22167	11	26	5	3
22175	14	32	4	5
22183	17	44	5	3
22191	26	68	4	5
22199	6	25	4	7
22207	26	25	9	228
22215	28	28	9	228
22223	18	5	12	84
22231	4	72	4	7
22239	6	30	7	1
22247	17	22	4	5
22255	6	25	4	33
22263	13	58	4	5
22271	11	38	4	64
22279	8	65	7	2
22287	15	27	3	123
22295	22	70	4	7
22303	19	70	4	98
22311	26	5	7	1
22319	18	12	4	5
22327	18	1	4	5
22335	3	14	3	57
22343	17	50	4	7
22351	25	24	4	181
22359	16	18	6	4
22367	4	11	4	7
22375	9	28	7	1
22383	11	24	4	181
22391	28	2	4	7
22399	16	51	9	228
22407	16	2	4	6
22415	3	71	4	7
22423	28	23	9	228
22431	23	47	4	6
22439	2	19	5	3
22447	2	25	4	104
22455	17	36	4	7
22463	23	38	4	5
22471	15	26	4	6
22479	10	39	5	3
22487	13	31	7	2
22495	20	42	12	108
22503	13	11	5	3
22511	14	56	4	7
22519	18	40	5	3
22527	2	46	3	200
22535	10	16	7	1
22543	16	37	6	4
22551	12	62	7	1
22559	5	40	4	5
22567	12	45	3	225
22575	8	7	5	3
22583	9	44	4	7
22591	4	56	4	46
22599	24	34	4	6
22607	3	56	3	122
21789	14	26	4	5
21797	12	61	4	52
21805	25	11	4	58
21813	19	23	12	137
21821	20	35	4	6
21829	24	37	6	4
21837	6	7	4	65
21845	24	31	4	6
21853	15	60	6	4
21861	13	40	12	92
21869	20	53	4	176
21877	20	59	4	6
21885	28	57	9	228
21893	11	56	4	46
21901	26	50	6	4
21909	27	38	7	2
21917	18	46	4	230
21925	14	46	5	3
21933	16	49	7	1
21941	5	56	3	122
21949	11	35	4	30
21957	18	7	9	228
21965	26	29	5	3
21973	25	42	4	6
21981	24	36	5	3
21989	25	7	4	102
21997	13	19	7	1
22005	6	59	7	1
22013	3	65	9	228
22021	2	73	9	228
22029	20	26	4	5
22037	25	38	4	167
22045	25	3	9	228
22053	26	43	6	4
22061	24	63	11	126
22069	12	59	7	1
22077	10	11	6	4
22085	3	58	4	7
22093	18	2	7	1
22101	6	7	4	131
22109	5	71	4	56
22117	2	47	7	2
22125	25	46	3	229
22133	2	68	4	7
22141	18	14	7	2
22149	13	44	3	179
22157	9	26	6	4
22165	27	50	5	3
22173	18	15	5	3
22181	19	11	6	4
22189	10	40	6	4
22197	25	72	3	72
22205	23	53	4	5
22213	27	37	4	6
22221	21	43	3	101
22229	5	63	4	6
22237	13	30	4	6
22245	22	56	12	208
22253	12	22	3	73
22261	19	74	3	16
22269	10	5	3	119
22277	24	11	9	228
22285	14	43	3	21
22293	5	72	3	72
22301	28	6	5	3
22309	14	39	3	107
22317	28	51	7	1
22325	26	39	5	3
22333	6	52	10	154
22341	19	26	4	5
22349	6	57	6	4
22357	21	6	5	3
22365	20	46	3	201
22373	23	48	7	2
22381	16	46	3	226
22389	4	32	4	36
22397	16	19	3	12
22405	3	71	7	2
22413	28	43	4	59
22421	15	43	3	101
22429	21	11	5	3
22437	28	33	3	105
22445	16	44	4	7
22453	28	34	4	7
22461	26	52	7	1
22469	28	23	12	137
22477	19	18	4	5
22485	22	70	6	4
22493	22	16	4	7
22501	28	43	5	3
22509	17	36	4	110
22517	5	11	4	7
22525	23	33	3	71
22533	14	49	5	3
22541	3	42	7	1
22549	6	70	4	7
22557	17	54	4	5
22565	7	53	10	203
22573	22	38	4	128
22581	19	23	4	164
22589	7	57	5	3
22597	25	48	4	6
22605	20	25	6	4
22613	12	1	8	148
22621	11	68	9	228
22629	12	61	7	2
22637	24	11	7	2
22645	24	36	4	7
22653	9	22	3	73
22661	17	42	4	6
22669	7	62	7	1
22677	16	54	10	221
22685	27	68	4	42
22693	20	22	7	1
22701	22	56	4	7
22709	13	35	4	7
22717	20	57	9	228
22725	4	36	7	2
22733	17	4	9	228
22741	16	7	6	4
22749	9	7	5	3
22757	28	55	4	7
22765	15	59	7	1
22773	27	29	5	3
22781	13	46	5	3
22789	12	58	4	5
22797	11	65	3	150
22805	10	14	9	228
22813	2	47	5	3
22821	14	5	4	6
22829	10	68	4	7
22837	27	17	9	228
22845	16	24	4	181
22853	14	46	4	7
22861	25	18	4	160
22869	28	9	4	27
22877	26	27	12	191
22885	14	66	3	86
22893	25	43	4	5
22901	11	35	5	3
22909	21	10	9	228
22917	7	53	4	5
22925	13	2	9	228
22933	27	47	9	228
22941	26	44	12	179
22949	22	16	9	228
22957	15	7	4	65
22965	2	18	5	3
22973	7	26	7	1
22981	14	26	2	187
22989	16	30	7	2
22997	6	45	3	200
23005	2	70	4	5
23013	22	33	3	71
23021	27	49	2	217
23029	23	10	3	190
23037	14	39	9	228
22153	19	11	3	158
22161	14	49	4	7
22169	14	58	4	5
22177	2	7	7	2
22185	15	28	5	3
22193	23	49	6	4
22201	27	48	7	1
22209	19	38	4	64
22217	23	50	4	5
22225	2	38	4	6
22233	11	15	4	5
22241	14	12	4	6
22249	14	3	4	5
22257	18	50	4	7
22265	15	52	4	7
22273	4	46	3	200
22281	4	27	3	53
22289	6	40	4	39
22297	24	32	7	2
22305	27	49	7	2
22313	25	63	4	6
22321	25	21	6	4
22329	27	21	5	3
22337	23	51	7	1
22345	28	43	6	4
22353	20	31	7	2
22361	13	25	5	3
22369	17	53	4	6
22377	14	59	7	1
22385	13	24	7	2
22393	19	32	5	3
22401	22	74	7	2
22409	18	16	7	1
22417	21	1	7	1
22425	5	9	4	6
22433	19	70	7	2
22441	8	19	3	12
22449	19	12	4	5
22457	7	14	4	5
22465	21	45	12	216
22473	18	6	7	2
22481	25	56	12	122
22489	16	47	6	4
22497	24	71	4	56
22505	9	54	4	5
22513	20	6	5	3
22521	7	35	7	2
22529	2	53	7	1
22537	9	49	3	151
22545	15	35	9	228
22553	11	64	6	4
22561	12	57	6	4
22569	12	56	12	208
22577	16	18	4	133
22585	16	26	5	3
22593	4	36	9	228
22601	20	6	6	4
22609	28	18	4	180
22617	27	61	6	4
22625	9	58	5	3
22633	22	46	4	211
22641	11	11	4	7
22649	26	54	4	209
22657	8	40	13	78
22665	24	50	6	4
22673	28	45	3	231
22681	16	55	4	80
22689	5	14	5	3
22697	17	40	9	228
22705	25	44	5	3
22713	16	40	9	228
22721	25	71	5	3
22729	15	7	4	6
22737	17	6	3	120
22745	6	58	4	5
22753	6	52	4	6
22761	14	6	4	5
22769	26	44	4	5
22777	17	38	4	167
22785	21	42	12	108
22793	17	46	3	226
22801	28	45	12	216
22809	23	16	7	2
22817	15	56	3	215
22825	21	17	5	3
22833	23	5	3	171
22841	12	29	6	207
22849	25	56	12	82
22857	15	18	4	6
22865	3	45	12	216
22873	3	50	5	3
22881	3	59	4	6
22889	25	57	5	3
22897	14	5	6	4
22905	13	41	13	109
22913	2	55	5	3
22921	7	15	5	3
22929	24	56	12	122
22937	13	18	4	103
22945	23	15	4	25
22953	23	41	4	7
22961	8	16	4	6
22969	11	51	7	1
22977	17	55	5	3
22985	16	8	4	5
22993	11	38	4	6
23001	14	29	3	162
23009	23	1	4	7
23017	18	24	3	137
23025	24	32	4	5
23033	9	50	5	3
23041	3	65	3	150
23049	4	59	4	6
23057	19	20	9	228
23065	10	5	3	177
23073	19	10	4	7
23081	28	74	3	69
23089	14	5	12	177
23097	18	26	4	31
23105	24	58	4	114
23113	19	18	4	180
23121	19	42	12	108
23129	12	70	4	43
23137	16	56	3	208
23145	19	55	4	5
23153	17	52	3	154
23161	15	66	6	4
23169	9	57	7	2
23177	25	27	12	191
23185	25	44	7	1
23193	18	15	7	2
23201	5	10	7	2
23209	25	69	4	6
23217	6	73	4	6
23225	28	48	4	7
23233	6	35	4	5
23241	18	37	7	1
23249	7	22	4	5
23257	15	66	3	86
23265	27	66	4	47
23273	27	28	4	5
23281	18	1	4	6
23289	10	10	4	7
23297	3	64	6	4
23305	23	34	6	4
23313	20	42	4	7
23321	3	66	7	1
23329	25	64	4	5
23337	5	41	7	1
23345	9	21	5	3
23353	25	35	9	228
23361	14	1	4	7
23369	11	25	4	5
23377	24	35	7	2
23385	22	44	4	192
23393	18	7	4	7
23401	11	65	3	125
22620	16	47	5	3
22628	24	60	11	169
22636	13	38	5	3
22644	26	29	6	4
22652	24	36	4	30
22660	20	21	7	2
22668	21	58	4	114
22676	16	10	4	6
22684	20	5	3	119
22692	2	18	7	2
22700	20	3	4	7
22708	11	14	5	3
22716	24	32	3	75
22724	23	48	4	7
22732	14	42	7	2
22740	24	55	7	1
22748	16	4	4	7
22756	19	6	6	4
22764	6	36	5	3
22772	11	12	4	5
22780	28	42	7	2
22788	4	4	9	228
22796	14	48	4	81
22804	7	1	7	1
22812	7	58	4	114
22820	20	41	4	6
22828	12	35	4	7
22836	11	64	5	3
22844	9	53	6	4
22852	18	28	4	7
22860	23	18	4	6
22868	6	16	3	57
22876	15	71	4	56
22884	14	2	6	4
22892	4	65	3	150
22900	16	16	4	6
22908	13	56	3	146
22916	3	35	4	30
22924	22	5	4	199
22932	15	55	7	1
22940	9	10	3	220
22948	12	54	3	221
22956	25	20	4	7
22964	18	60	7	2
22972	6	67	5	3
22980	9	55	5	3
22988	17	45	7	1
22996	16	39	7	1
23004	23	39	5	3
23012	6	45	3	226
23020	7	28	3	161
23028	19	69	7	1
23036	4	25	4	33
23044	26	44	7	1
23052	21	10	3	178
23060	2	45	3	225
23068	7	47	6	4
23076	28	57	4	5
23084	22	36	4	6
23092	14	52	5	3
23100	7	42	6	4
23108	21	16	7	2
23116	28	49	4	45
23124	24	37	4	6
23132	12	7	6	4
23140	8	30	9	228
23148	4	44	3	179
23156	12	34	7	2
23164	9	61	5	3
23172	20	24	4	7
23180	24	53	6	4
23188	7	48	7	2
23196	20	5	3	143
23204	20	2	4	7
23212	18	59	4	6
23220	5	51	7	1
23228	8	25	7	2
23236	13	42	9	228
23244	11	30	3	161
23252	9	26	4	31
23260	23	46	4	7
23268	3	26	4	5
23276	12	56	12	174
23284	23	50	4	6
23292	13	36	4	6
23300	4	1	4	6
23308	16	67	7	2
23316	23	5	4	199
23324	17	50	6	4
23332	28	38	4	167
23340	6	53	4	5
23348	10	9	4	6
23356	13	9	4	7
23364	6	46	4	227
23372	19	10	3	178
23380	2	49	7	2
23388	5	29	4	5
23396	21	26	2	187
23404	5	55	4	80
23412	21	66	9	228
23420	26	58	4	6
23428	9	11	3	158
23436	24	17	5	3
23444	20	48	4	7
23452	11	39	7	2
23460	6	74	7	2
23468	3	38	4	6
23476	5	7	9	228
23484	4	33	4	6
23492	18	68	4	42
23500	27	74	3	69
23508	14	23	3	137
23516	6	11	3	24
23524	16	62	9	228
23532	23	27	3	149
23540	7	52	4	7
23548	22	7	2	186
23556	11	43	4	59
23564	26	8	4	6
23572	14	18	4	32
23580	23	20	5	3
23588	7	34	6	4
23596	14	50	4	6
23604	28	22	3	73
23612	7	20	4	7
23620	5	49	2	217
23628	12	43	3	21
23636	4	31	3	162
23644	13	6	3	63
23652	9	5	3	119
23660	6	28	6	4
23668	8	24	3	137
23676	3	47	4	7
23684	13	66	3	86
23692	26	9	12	111
23700	21	13	7	2
23708	16	12	3	87
23716	12	28	9	228
23724	7	36	3	182
23732	21	44	4	6
23740	21	34	9	228
23748	7	55	7	1
23756	26	67	6	4
23764	22	72	7	1
23772	21	69	7	1
23780	24	33	7	1
23788	4	15	9	228
23796	26	70	4	98
23804	14	45	7	2
23812	5	53	9	228
23820	19	28	7	2
23828	25	65	3	188
23836	7	43	4	5
23844	13	50	3	202
23852	2	46	4	6
23860	23	35	4	134
23868	9	17	9	228
22618	19	68	4	7
22626	2	69	6	4
22634	6	72	4	5
22642	9	27	4	5
22650	25	53	3	203
22658	12	19	3	76
22666	19	71	5	3
22674	22	73	4	6
22682	28	23	7	2
22690	3	39	9	228
22698	3	15	4	5
22706	3	36	7	2
22714	2	4	3	20
22722	16	7	4	102
22730	6	49	4	7
22738	10	74	4	6
22746	9	55	7	1
22754	16	24	4	6
22762	21	9	6	129
22770	19	8	4	28
22778	20	50	4	5
22786	28	38	4	128
22794	18	32	6	4
22802	27	31	9	228
22810	25	20	7	1
22818	11	72	3	118
22826	5	29	7	2
22834	26	13	7	1
22842	25	45	3	222
22850	24	11	4	5
22858	14	26	4	6
22866	14	42	9	228
22874	3	35	6	4
22882	2	28	3	17
22890	13	45	7	2
22898	6	73	7	1
22906	8	72	9	228
22914	27	63	7	1
22922	12	46	3	200
22930	11	74	3	100
22938	9	45	12	216
22946	20	33	3	105
22954	5	57	5	3
22962	20	20	6	4
22970	13	5	12	177
22978	5	1	7	1
22986	10	62	9	228
22994	17	26	4	31
23002	23	16	9	228
23010	28	70	4	98
23018	27	46	3	200
23026	19	24	4	7
23034	15	41	4	7
23042	3	37	7	1
23050	23	51	7	2
23058	6	44	4	192
23066	27	52	9	228
23074	14	6	7	2
23082	14	41	13	109
23090	9	28	7	2
23098	11	20	9	228
23106	25	44	4	192
23114	11	49	6	4
23122	24	12	7	1
23130	15	27	9	228
23138	8	56	4	172
23146	11	10	4	7
23154	9	17	4	193
23162	13	56	4	7
23170	21	16	4	7
23178	16	29	6	4
23186	16	3	9	228
23194	4	30	3	161
23202	9	68	4	42
23210	22	18	4	6
23218	11	12	4	6
23226	18	53	5	3
23234	2	71	7	1
23242	12	16	4	7
23250	15	14	9	228
23258	13	31	4	6
23266	12	60	9	228
23274	28	24	5	3
23282	13	47	9	228
23290	25	52	4	7
23298	2	35	3	166
23306	28	27	12	163
23314	27	33	4	35
23322	18	35	6	4
23330	24	67	9	228
23338	28	45	4	222
23346	13	16	4	7
23354	21	66	4	7
23362	13	4	7	1
23370	16	49	7	2
23378	4	45	7	1
23386	24	3	9	228
23394	6	56	4	7
23402	15	46	3	201
23410	18	3	5	3
23418	8	54	7	2
23426	11	34	7	2
23434	25	42	6	4
23442	17	43	7	2
23450	28	32	7	1
23458	7	54	4	5
23466	24	62	5	3
23474	28	65	12	188
23482	21	18	4	66
23490	8	60	11	169
23498	12	11	3	24
23506	23	52	6	4
23514	22	71	6	4
23522	13	43	3	21
23530	7	2	5	3
23538	4	49	9	228
23546	4	18	4	180
23554	28	34	5	3
23562	28	32	4	6
23570	11	14	3	57
23578	14	28	3	184
23586	4	42	4	7
23594	26	66	4	7
23602	20	74	4	7
23610	13	3	4	5
23618	8	25	5	3
23626	12	28	6	4
23634	21	32	7	1
23642	21	6	3	63
23650	27	5	12	171
23658	22	5	7	2
23666	16	17	7	2
23674	6	24	9	228
23682	23	45	7	2
23690	11	21	4	142
23698	10	29	3	161
23706	21	39	6	4
23714	19	10	5	3
23722	23	46	4	222
23730	3	52	4	95
23738	13	46	4	7
23746	18	49	9	228
23754	8	25	9	228
23762	3	6	7	1
23770	8	22	9	228
23778	18	43	6	4
23786	23	36	7	1
23794	5	56	4	7
23802	19	68	4	5
23810	7	6	4	7
23818	17	56	12	82
23826	11	46	3	200
23834	6	15	4	25
23842	4	11	5	3
23850	19	19	7	1
23858	5	7	3	155
23866	5	5	3	171
22616	7	21	6	4
22624	12	5	3	119
22632	8	54	4	5
22640	2	51	6	4
22648	13	57	6	4
22656	12	1	7	1
22664	13	10	7	2
22672	22	54	4	6
22680	22	53	9	228
22688	3	37	5	3
22696	25	7	2	186
22704	6	1	8	88
22712	24	60	4	6
22720	21	62	7	1
22728	24	64	9	228
22736	5	65	3	150
22744	13	21	9	228
22752	28	45	7	1
22760	2	45	4	211
22768	20	44	4	5
22776	18	36	7	2
22784	7	29	9	228
22792	19	25	6	4
22800	25	50	5	3
22808	27	27	4	6
22816	19	48	4	6
22824	27	51	2	212
22832	10	38	7	2
22840	26	11	6	4
22848	17	53	6	4
22856	27	47	5	3
22864	21	33	3	71
22872	7	31	7	1
22880	23	52	5	3
22888	3	34	4	29
22896	12	33	4	6
22904	17	37	4	6
22912	18	3	12	189
22920	12	56	4	7
22928	15	56	9	228
22936	3	58	4	5
22944	24	25	5	3
22952	10	72	3	118
22960	2	16	4	6
22968	7	49	5	3
22976	3	48	4	6
22984	4	1	8	148
22992	22	71	7	2
23000	17	22	7	2
23008	16	25	7	2
23016	3	24	3	137
23024	17	35	9	228
23032	28	26	2	187
23040	7	65	3	188
23048	26	57	4	79
23056	15	37	9	228
23064	23	6	4	7
23072	13	35	4	134
23080	7	27	3	123
23088	11	24	4	7
23096	2	45	12	216
23104	6	4	4	6
23112	26	65	3	125
23120	27	55	3	159
23128	5	15	9	228
23136	21	7	3	155
23144	10	15	7	2
23152	4	35	5	3
23160	3	25	6	4
23168	14	8	4	55
23176	7	24	6	4
23184	9	45	4	6
23192	7	7	6	4
23200	24	53	9	228
23208	19	69	4	6
23216	13	45	4	7
23224	8	65	4	5
23232	24	32	12	106
23240	9	19	4	6
23248	21	55	4	80
23256	24	21	4	168
23264	10	6	4	6
23272	18	63	3	90
23280	16	34	4	6
23288	6	18	4	180
23296	5	30	3	161
23304	19	17	6	4
23312	21	74	7	2
23320	18	46	3	231
23328	3	19	4	6
23336	12	2	7	2
23344	3	21	5	3
23352	4	3	5	3
23360	26	45	3	200
23368	28	4	4	6
23376	15	59	4	7
23384	24	16	7	2
23392	14	45	4	230
23400	6	44	3	179
23408	25	54	3	221
23416	5	37	3	205
23424	27	10	3	204
23432	23	16	4	5
23440	11	24	6	4
23448	20	21	4	5
23456	15	38	4	7
23464	15	42	4	51
23472	18	30	4	5
23480	8	5	3	119
23488	2	12	4	5
23496	25	26	4	6
23504	25	56	7	2
23512	6	26	4	6
23520	4	36	4	5
23528	19	3	5	3
23536	28	28	3	184
23544	12	44	3	179
23552	21	9	4	27
23560	27	60	4	7
23568	22	56	5	3
23576	16	32	12	106
23584	6	2	9	228
23592	10	2	7	2
23600	12	66	4	47
23608	26	21	4	168
23616	9	6	4	6
23624	14	14	5	3
23632	4	43	4	59
23640	20	68	4	5
23648	3	63	3	90
23656	13	44	4	6
23664	6	56	3	215
23672	27	47	4	5
23680	4	43	6	4
23688	10	28	3	17
23696	27	74	3	135
23704	15	67	4	5
23712	19	53	4	176
23720	13	56	5	3
23728	16	63	4	48
23736	6	63	11	126
23744	24	31	7	1
23752	28	43	12	101
23760	13	69	7	1
23768	24	67	4	7
23776	11	59	4	6
23784	20	18	4	103
23792	19	47	9	228
23800	27	50	3	185
23808	27	14	9	228
23816	16	15	4	7
23824	11	49	2	217
23832	28	33	7	2
23840	12	49	4	45
23848	18	57	4	79
23856	26	49	10	224
23864	10	39	7	2
22614	21	45	3	225
22622	23	56	3	146
22630	18	72	9	228
22638	3	16	7	1
22646	23	7	7	1
22654	8	42	7	1
22662	26	57	9	228
22670	13	62	4	6
22678	14	18	4	180
22686	21	35	3	166
22694	19	29	4	7
22702	9	15	4	25
22710	3	4	6	4
22718	24	72	3	118
22726	5	38	4	7
22734	9	53	7	1
22742	19	50	5	3
22750	12	41	4	6
22758	13	48	4	81
22766	28	35	6	4
22774	2	44	4	7
22782	21	63	7	2
22790	2	52	4	5
22798	24	74	4	6
22806	17	55	7	1
22814	3	56	12	147
22822	11	11	3	132
22830	3	72	6	4
22838	15	4	4	83
22846	13	33	4	35
22854	6	54	5	3
22862	11	21	4	168
22870	19	57	9	228
22878	3	45	3	231
22886	23	58	4	6
22894	7	27	7	2
22902	10	69	4	6
22910	4	64	5	3
22918	10	22	9	228
22926	8	61	9	228
22934	24	54	7	2
22942	7	13	9	228
22950	9	13	4	115
22958	18	10	4	7
22966	8	18	5	3
22974	19	7	4	7
22982	5	50	4	5
22990	28	49	4	85
22998	22	34	9	228
23006	12	42	7	2
23014	8	74	4	6
23022	9	59	4	6
23030	5	58	4	114
23038	21	28	3	184
23046	20	4	4	6
23054	3	72	5	3
23062	2	41	4	11
23070	19	54	6	4
23078	8	44	3	130
23086	13	29	3	162
23094	2	56	3	82
23102	22	39	9	228
23110	14	7	4	102
23118	13	23	4	6
23126	25	28	5	3
23134	20	45	4	230
23142	8	56	3	208
23150	17	54	7	2
23158	22	18	4	66
23166	24	49	4	7
23174	6	28	5	3
23182	5	6	4	49
23190	12	70	4	6
23198	15	1	4	7
23206	11	6	4	49
23214	7	25	4	5
23222	16	17	4	193
23230	28	38	4	64
23238	14	27	12	163
23246	23	4	4	121
23254	10	21	4	168
23262	3	14	4	6
23270	10	56	12	122
23278	4	35	6	4
23286	4	60	7	2
23294	16	52	3	154
23302	3	36	4	5
23310	10	3	12	189
23318	7	42	9	228
23326	9	54	7	2
23334	2	13	7	1
23342	10	1	4	6
23350	14	48	7	2
23358	17	49	4	7
23366	18	45	7	1
23374	7	1	7	2
23382	19	16	4	7
23390	10	7	9	228
23398	23	55	12	159
23406	18	39	7	2
23414	9	7	7	2
23422	26	49	4	85
23430	22	10	3	210
23438	3	45	3	225
23446	7	61	4	5
23454	19	55	3	159
23462	28	30	4	6
23470	14	17	4	160
23478	11	47	9	228
23486	24	15	6	4
23494	28	42	4	5
23502	25	63	11	126
23510	14	13	7	2
23518	17	70	4	60
23526	10	7	7	2
23534	4	70	4	43
23542	21	74	9	228
23550	18	43	9	228
23558	7	17	4	160
23566	10	35	9	228
23574	25	53	6	4
23582	13	4	4	83
23590	2	48	7	1
23598	14	30	7	1
23606	14	48	9	228
23614	15	19	7	2
23622	2	45	3	222
23630	17	62	9	228
23638	27	50	7	1
23646	18	38	4	6
23654	27	25	3	139
23662	21	60	6	4
23670	23	59	7	2
23678	22	48	9	228
23686	12	4	4	83
23694	13	9	4	27
23702	17	57	4	79
23710	27	18	4	66
23718	5	10	9	228
23726	4	70	7	1
23734	5	52	10	154
23742	6	65	4	6
23750	2	15	4	7
23758	16	9	7	1
23766	3	49	7	2
23774	22	35	4	134
23782	22	49	4	117
23790	23	9	5	3
23798	15	46	4	222
23806	11	29	3	161
23814	12	34	9	228
23822	28	45	4	230
23830	20	8	7	1
23838	27	28	9	228
23846	16	17	4	7
23854	28	50	7	1
23862	28	9	9	228
23045	8	5	4	6
23053	19	67	6	4
23061	9	56	3	174
23069	13	47	6	4
23077	4	63	4	5
23085	10	37	4	6
23093	16	68	5	3
23101	28	39	9	228
23109	21	56	12	174
23117	7	74	7	2
23125	13	48	7	2
23133	19	67	9	228
23141	24	46	12	216
23149	8	72	3	72
23157	8	64	9	228
23165	19	2	7	2
23173	27	62	4	5
23181	20	7	9	228
23189	15	6	4	7
23197	7	55	4	80
23205	26	2	4	7
23213	11	50	4	5
23221	7	56	7	2
23229	25	47	4	7
23237	22	27	12	163
23245	25	28	3	138
23253	14	7	5	3
23261	22	5	9	228
23269	2	40	5	3
23277	4	37	7	1
23285	8	56	4	6
23293	12	44	4	6
23301	14	2	9	228
23309	9	29	5	3
23317	14	73	3	34
23325	10	63	3	90
23333	19	49	9	228
23341	14	27	3	149
23349	28	58	7	1
23357	13	66	4	7
23365	5	59	7	1
23373	7	73	3	34
23381	20	56	6	4
23389	3	15	9	228
23397	16	56	12	82
23405	20	34	4	7
23413	3	7	7	2
23421	16	50	5	3
23429	14	44	4	6
23437	27	17	4	180
23445	18	11	3	158
23453	6	66	7	2
23461	22	20	5	3
23469	12	74	9	228
23477	11	2	9	228
23485	13	10	4	5
23493	16	60	11	169
23501	19	8	4	6
23509	6	29	4	5
23517	26	60	4	7
23525	3	15	7	2
23533	24	37	3	205
23541	20	58	7	1
23549	11	52	3	154
23557	20	51	7	1
23565	24	10	6	4
23573	12	29	4	5
23581	10	38	4	6
23589	7	44	7	1
23597	25	24	9	228
23605	6	7	5	3
23613	3	3	4	7
23621	28	5	7	2
23629	28	48	6	4
23637	20	60	7	2
23645	16	4	5	3
23653	4	54	5	3
23661	11	33	4	35
23669	3	6	4	6
23677	9	47	4	7
23685	25	67	9	228
23693	21	4	4	6
23701	11	7	9	228
23709	4	53	7	2
23717	16	20	7	1
23725	17	43	6	4
23733	8	64	6	4
23741	6	50	3	202
23749	7	56	9	228
23757	13	12	7	1
23765	12	35	5	3
23773	15	27	7	2
23781	23	60	5	3
23789	12	33	3	71
23797	7	44	4	192
23805	9	49	7	2
23813	26	43	4	5
23821	25	23	7	1
23829	2	26	4	31
23837	12	46	3	229
23845	4	67	4	7
23853	2	11	6	4
23861	7	7	4	102
22619	25	68	4	7
22627	28	36	4	5
22635	24	12	5	3
22643	27	46	4	5
22651	7	54	7	1
22659	21	1	4	6
22667	21	10	7	2
22675	16	31	7	1
22683	8	4	4	7
22691	2	53	4	6
22699	12	71	4	5
22707	27	45	4	6
22715	25	60	11	169
22723	24	72	3	72
22731	17	53	7	1
22739	18	34	7	1
22747	5	55	12	159
22755	12	17	6	4
22763	10	71	5	3
22771	7	74	3	100
22779	16	25	3	183
22787	22	3	9	228
22795	12	14	4	25
22803	23	42	6	4
22811	13	32	4	5
22819	19	56	3	174
22827	10	7	4	5
22835	4	6	3	63
22843	21	33	4	35
22851	19	1	4	6
22859	5	64	4	5
22867	11	57	9	228
22875	12	45	4	227
22883	13	10	6	4
22891	7	13	6	4
22899	9	53	4	176
22907	21	5	7	2
22915	24	63	4	48
22923	5	11	3	24
22931	16	56	12	196
22939	18	51	4	6
22947	15	58	4	6
22955	21	45	7	2
22963	22	19	7	2
22971	7	52	6	4
22979	5	44	3	179
22987	7	23	7	1
22995	13	57	3	18
23003	7	54	5	3
23011	4	61	5	3
23019	21	46	3	200
23027	15	8	4	55
23035	20	31	3	162
23043	16	35	7	2
23051	4	10	7	2
23059	8	3	9	228
23067	28	34	9	228
23075	20	42	7	2
23083	18	17	4	133
23091	10	10	7	2
23099	7	36	7	1
23107	12	60	6	4
23115	4	62	6	4
23123	9	5	4	6
23131	24	43	3	101
23139	26	30	4	5
23147	5	43	3	101
23155	27	34	4	7
23163	3	61	5	3
23171	7	26	4	6
23179	20	35	4	134
23187	23	18	4	32
23195	23	5	6	4
23203	7	14	7	2
23211	22	8	4	55
23219	13	49	5	3
23227	25	57	4	79
23235	28	56	6	4
23243	17	25	9	228
23251	7	6	3	120
23259	23	66	9	228
23267	15	73	3	34
23275	24	56	12	82
23283	13	2	6	4
23291	8	58	5	3
23299	3	23	4	5
23307	13	74	7	2
23315	19	47	4	7
23323	22	37	7	2
23331	8	22	4	7
23339	2	68	4	42
23347	4	9	4	6
23355	27	49	4	5
23363	27	69	4	6
23371	18	19	3	76
23379	22	4	4	6
23387	16	36	5	3
23395	10	57	4	79
23403	7	28	5	3
23411	25	5	3	171
23419	28	49	4	117
23427	12	71	7	2
23435	4	73	4	6
23443	27	48	6	4
23451	9	35	4	30
23459	2	54	7	2
23467	14	27	4	7
23475	13	45	4	230
23483	28	27	4	7
23491	18	42	4	7
23499	15	60	5	3
23507	21	61	4	5
23515	7	20	4	113
23523	15	68	7	1
23531	5	24	9	228
23539	3	57	9	228
23547	18	28	3	17
23555	4	2	7	2
23563	14	10	3	210
23571	9	29	6	4
23579	25	65	7	1
23587	3	22	6	4
23595	16	66	4	6
23603	26	74	4	7
23611	24	70	7	1
23619	23	19	7	2
23627	9	30	4	5
23635	13	32	7	1
23643	11	26	7	1
23651	10	31	3	162
23659	2	48	4	6
23667	14	27	7	2
23675	10	39	4	7
23683	5	49	5	3
23691	6	11	4	5
23699	3	21	4	7
23707	19	8	7	1
23715	16	11	9	228
23723	16	47	4	38
23731	28	35	4	134
23739	8	17	7	2
23747	27	39	5	3
23755	4	45	12	216
23763	8	66	7	1
23771	13	8	4	55
23779	14	7	4	131
23787	12	39	9	228
23795	15	9	5	3
23803	14	28	5	3
23811	15	70	4	7
23819	25	61	3	9
23827	15	51	10	54
23835	12	26	2	187
23843	10	11	5	3
23851	7	35	4	5
23859	9	27	4	6
23867	3	17	9	228
22615	12	46	5	3
22623	5	34	4	29
22631	7	23	4	7
22639	3	40	5	3
22647	2	50	4	7
22655	8	53	4	6
22663	2	56	12	147
22671	12	46	6	4
22679	13	1	4	6
22687	19	68	9	228
22695	22	31	9	228
22703	24	19	4	5
22711	7	54	4	209
22719	15	53	6	4
22727	20	45	3	222
22735	9	47	5	3
22743	22	73	7	1
22751	24	7	4	131
22759	27	42	12	108
22767	27	36	4	5
22775	12	43	4	7
22783	9	25	4	7
22791	9	46	3	226
22799	15	42	6	4
22807	22	67	4	7
22815	13	67	4	41
22823	26	53	3	203
22831	13	9	6	129
22839	22	59	7	1
22847	22	45	4	222
22855	22	63	11	126
22863	8	32	9	228
22871	19	17	9	228
22879	26	62	4	5
22887	24	22	9	228
22895	16	45	4	6
22903	5	28	6	4
22911	17	71	7	1
22919	5	43	3	21
22927	6	9	6	129
22935	26	31	7	1
22943	8	55	5	3
22951	18	61	5	3
22959	16	5	4	6
22967	5	12	4	6
22975	25	2	4	7
22983	11	60	7	2
22991	26	54	3	221
22999	18	15	4	7
23007	14	51	4	44
23015	20	49	6	4
23023	17	24	4	181
23031	9	48	4	6
23039	27	45	4	7
23047	17	21	6	4
23055	28	42	9	228
23063	22	45	9	228
23071	15	71	6	4
23079	3	65	4	5
23087	19	49	7	2
23095	24	28	4	7
23103	28	49	4	5
23111	11	18	4	180
23119	4	55	3	144
23127	10	20	4	113
23135	16	30	9	228
23143	6	10	6	4
23151	26	42	4	7
23159	15	51	4	44
23167	22	49	2	217
23175	11	33	4	6
23183	23	38	7	2
23191	20	20	9	228
23199	5	57	6	4
23207	3	59	7	1
23215	17	32	12	106
23223	16	1	3	13
23231	3	28	3	17
23239	19	10	7	2
23247	3	74	7	1
23255	23	6	7	2
23263	9	28	4	7
23271	11	70	4	43
23279	20	2	7	2
23287	16	18	5	3
23295	22	68	4	6
23303	22	2	9	228
23311	14	6	4	7
23319	19	7	7	2
23327	21	13	4	7
23335	21	14	4	7
23343	23	51	4	7
23351	2	45	4	6
23359	5	47	6	4
23367	20	69	7	1
23375	26	69	7	1
23383	11	61	5	3
23391	23	10	3	153
23399	23	42	4	51
23407	19	54	3	221
23415	2	6	4	6
23423	3	57	6	4
23431	12	7	3	155
23439	5	56	7	2
23447	23	33	4	7
23455	7	60	3	169
23463	21	15	4	5
23471	27	46	7	2
23479	25	43	3	101
23487	28	40	4	78
23495	14	4	7	1
23503	24	35	9	228
23511	8	57	7	2
23519	15	20	5	3
23527	13	67	4	62
23535	9	19	3	76
23543	26	42	6	4
23551	27	10	3	210
23559	20	49	2	217
23567	6	9	4	7
23575	6	43	3	21
23583	20	18	4	66
23591	26	10	5	3
23599	4	35	4	30
23607	25	22	4	5
23615	24	29	3	161
23623	22	71	9	228
23631	4	45	3	225
23639	18	54	9	228
23647	26	63	7	1
23655	15	45	3	229
23663	13	34	9	228
23671	15	35	4	134
23679	9	36	5	3
23687	20	61	5	3
23695	16	3	7	2
23703	20	67	6	4
23711	15	74	4	5
23719	20	9	4	27
23727	20	28	9	228
23735	16	48	4	6
23743	15	59	7	2
23751	8	15	4	7
23759	28	46	3	232
23767	2	50	5	3
23775	15	13	9	228
23783	22	30	3	162
23791	18	5	4	6
23799	18	52	4	95
23807	15	62	7	1
23815	5	46	4	227
23823	20	57	4	5
23831	21	16	5	3
23839	15	10	3	219
23847	20	42	9	228
23855	13	47	4	5
23863	20	34	9	228
23409	7	55	4	6
23417	6	12	7	1
23425	22	60	9	228
23433	12	49	2	217
23441	21	12	4	6
23449	3	55	3	144
23457	7	14	9	228
23465	21	14	6	4
23473	24	30	4	5
23481	21	10	4	5
23489	2	18	4	5
23497	18	36	4	5
23505	16	45	3	216
23513	27	60	9	228
23521	21	23	4	112
23529	18	2	7	2
23537	3	27	7	1
23545	10	70	4	43
23553	19	43	4	59
23561	27	50	10	202
23569	18	35	9	228
23577	16	39	3	74
23585	12	71	4	7
23593	20	66	4	7
23601	7	23	4	112
23609	28	30	7	1
23617	5	65	7	1
23625	15	2	12	175
23633	17	63	3	90
23641	27	6	3	63
23649	5	61	3	9
23657	23	46	5	3
23665	14	67	4	62
23673	18	35	4	30
23681	7	46	4	7
23689	7	15	4	25
23697	7	45	4	230
23705	24	24	7	2
23713	3	56	12	208
23721	2	17	7	2
23729	9	35	7	2
23737	7	60	6	4
23745	5	49	6	4
23753	11	71	4	7
23761	17	44	4	5
23769	14	71	4	56
23777	13	1	4	7
23785	9	45	3	225
23793	17	52	7	1
23801	14	42	4	5
23809	26	46	3	229
23817	15	14	5	3
23825	23	52	3	95
23833	26	9	7	2
23841	2	36	9	228
23849	12	61	4	5
23857	8	53	3	203
23865	10	3	5	3
\.


--
-- Data for Name: recommendations; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.recommendations (id, nam, prefix, major, minor, part, desc_eng, desc_esp, summary_eng, summary_esp, pep_responsible, absg_responsible, installation, feild_verification, interview, sweetiening_plant, drill, crae, cases, abk_a2) FROM stdin;
2	REC P1-1	P	1	1	b	b) monitor the type, sources, and effects of bacteria present in offshore facilities in the Campeche Sound; 	b) Monitorear el tipo, origen y efecto de las bacterias presentes en las instalaciones costa fuera de la Sonda de Campeche	Monitor microorganisms in GC	Monitoreo de microorganismos en lineas de GC	Ing. Christian Guillermo Garcia Hernandez 	Juan Manuel Hernandez	X	Installation of bioprobe or monitoring system.\nLogbook entries of checking the above.	\N	\N	\N	\N	\N	Installation of bioprobe or monitoring system.
10	REC P2-1	P	2	1	b	Reduce the possibility of exceeding sweetening plant permissible H2S limits by: b) Evaluate the feasibility of optimizing the efficiency of the sweeting plants process, periodically evaluate their performance and, if necessary, implement a mitigation plan. 	Reducir la posibilidad de exceder los límites permisibles de H2S en las plantas endulzadoras mediante: b) Evaluar la factibilidad de optimizar la eficiencia del proceso de las plantas endulzadoras y evaluar periódicamente su desempeño, y si es necesario, aplicar un plan de mitigación.	Optimize Sweetening Plants	Optimización de plantas endulzadoras	Ing. Adriana Valenzuela Izquierdo (ABK)	Jorge Herrera Estrada	\N	\N	\N	X	\N	\N	\N	\N
18	REC D2	D	2	\N	b	Establish the requirements for the different specialists, who plan, supervise and execute activities of: inspection, non-destructive testing, mechanical integrity and RBI for static equipment, as applicable, to comply with the following: b) For Pemex personnel - Require certification according to national and international normative mentioned above. 	Establecer los requerimientos para los diferentes especialistas que efectúen actividades de planeación, supervisión y ejecución de inspección, pruebas no destructivas, integridad mecánica e IBR a equipos estáticos, según aplique, que cumpla con lo siguiente: b) Para personal de Pemex – requerir capacitación conforme a la normatividad aplicable nacional e internacional mencionada.	Specialist requirements: PEP	Requerimiento de especialistas: PEP	Ing. Wilbert Eduardo Koh Cambranis/\nIng. José Antonio Gómez Flores 	Francois Coblentz	\N	\N	\N	\N	\N	\N	\N	\N
26	REC 2.1	\N	2	1	a	Avoid the use of manual valves to regulate flow in pipes by: a) Prohibit the use of manual valves as flow control valves. 	Evitar el uso de válvulas manuales para regular flujo en tuberías mediante: a) La prohibición de operar válvulas manuales como válvulas reguladoras de flujo.	Prohibit flow control with manual valves	Prohibición de válvulas manuales para control de flujo	Ing. Eligio Soto	Jorge Herrera Estrada	X	Manual valves, which were previously strangled, have been set open or closed.	X	\N	\N	\N	\N	\N
34	REC 2.5	\N	2	5	\N	Update NRF-152-PEMEX-2013 or equivalent to include new types of actuators that are more resistance to fire and thermic radiation effects.	Actualizar la NRF-152-PEMEX-2013 o su equivalente para incluir un nuevo tipo de actuadores que sean más resistentes a los efectos de fuego y radiación térmica.	Actuator thermal resistance	Actuadores con resistencia térmica	Ing. Sergio Dionicio Renovato Carrion/\nIng. Gabriela Yasmin Palacios Blanco	Jerry Collinsworth	\N	\N	\N	\N	\N	\N	\N	Installed SDV actuators
42	REC 2.10	\N	2	10	b	Establish an effective and continuous communication for emergencies: b) Through drills, enable and verify the startup of the selected Emergency Group in offshore facilities for the Trunking System.	Establecer comunicación efectiva y continua en casos de emergencias: b) Mediante simulacros habilitar y verificar la puesta en operación del Grupo de Emergencia seleccionado en instalaciones costa fuera para el Sistema Trunking.	Trunking system	Sistema de enlace trunking	Ing. Julio Alberto Martínez Garcia/\nIng. Brenda Yadira	Juan Manuel Hernandez	X	\N	\N	\N	X	O	\N	\N
50	REC 3.3	\N	3	3	b	Address issues related to medication at offshore facilities: b) Implement an awareness plan about the prohibition on the use of any non-prescribed sleeping medication or medications that cause drowsiness.	Atender los asuntos relacionados con medicación en instalaciones costa fuera: b) Implementar un plan de concientización acerca de la prohibición de uso de cualquier medicamento para dormir o que cause somnolencia sin prescripción médica.	Non-prescribed sleeping medication. 	Medicamentos para dormir sin prescripción	Ing. Juan Manuel Peralta Rodriguez/\nIng. Miguel Angel Gomez Leon 	Juan Manuel Hernandez	X	\N	X	\N	\N	\N	\N	\N
58	REC 3.7	\N	3	7	b	Update requirements for selection and training of helmsmen including: b) Strictly comply with the training program for platform lifeboat helmsmen (first to third Helmsman and alternates), which are taught in the CASES.	Actualizar los requerimientos para la selección y entrenamiento de los timoneles incluyendo: b) Cumplir estrictamente con el programa de capacitación de los Timoneles (del primer al tercer Timonel y suplentes), que se imparten en los CASES.	Helmsman training program	Programa de capacitación para timoneles	 Ing. Raul Garza Torre	Alicia Castellanos Gil	\N	\N	\N	\N	\N	\N	X	\N
66	REC 3.11	\N	3	11	\N	Update the response plan to provide psychological treatment for evacuated personnel arriving from a major accident in offshore facilities, during the time the medic specialist determine. 	Actualizar el plan de respuesta para proveer tratamiento psicológico para personal evacuado proveniente de un accidente mayor en instalaciones costa fuera, durante el tiempo que el personal médico especialista determine.	Psychological treatment	Tratamiento psicológico	Ing. Miguel Angel Alcaraz Guevara/\nIng. Juan Manuel Peralta Rodriguez 	Alicia Castellanos Gil	\N	\N	\N	\N	\N	\N	\N	\N
74	REC B.4	B	\N	4	\N	Determine if the heat treatment after the cold forming and after welding is sufficient in existing pressure vessels in critical sour service (which includes sour service and other critical services as defined by Pemex) in offshore installations. Priority determinations to be given to vessels identified under recommendation REC B.3 as having non-normalized steel.	Determinar si el tratamiento térmico después del formado en frío y posterior a la soldadura es suficiente en recipientes a presión en servicio crítico amargo (que incluye servicio amargo y cualquier otro servicio definido como crítico por Pemex) existentes en las instalaciones costa afuera. Debe darse prioridad de determinación a los recipientes identificados bajo la recomendación REC B.3 que tengan acero no normalizado.	Check vessels for sufficient heat treatment 	Revisión de recipientes por tratamiento térmico suficiente	Ing. Wilbert Eduardo Koh Cambranis/\nIng. José Antonio Gómez Flores 	Nelson Duran	\N	\N	\N	\N	\N	\N	\N	No field verification
4	REC P1-2	P	1	2	\N	Analyze and if it is the case, modify the criteria for material selection in combustible and sour gas lines based on the characterization of the damage mechanisms (e.g., the type, source, and quantity of bacteria, the effects of identified bacteria, H2S and other existing mechanisms) that in combination could influence corrosion rates in the lines.	Analizar y en su caso, modificar el criterio para la selección de material para las líneas de gas combustible y gas amargo basado en la caracterización de los mecanismos de daño (por ejemplo el tipo, fuente y cantidad de la bacteria, los efectos de bacterias identificadas, H2S y otros mecanismos) que en combinación puedan influenciar las velocidades de corrosión en las líneas. 	Material Selection in GA & GC	Selección de material en líneas de Gas Amargo y Gas Combustible	Ing. Martin López Solares	Francois Coblentz	\N	\N	\N	\N	\N	\N	\N	Use of alternative materials for GC and GC lines (if selection criteria has changed from analysis).
12	REC P2-3	P	2	3	a	a) Review and define the H2S operating limits	a) Revisar y definir los límites operacionales permisibles de H2S	H2S limits	Límites de H2S	Ing. Hazael Hernández Ruiz/\nIng. Angel Refugio Martínez González	Jorge Herrera Estrada	\N	\N	\N	X	\N	\N	\N	\N
20	REC D3	D	3	\N	b	Update or develop inspection procedures for static equipment in PEP offshore facilities to include the following: b) Include in the RBI procedure P.6.0300.01:2015 (or equivalent) the criteria of these mentioned codes to detect and control damage mechanisms on sporadic use lines.	Actualizar o desarrollar los procedimientos de inspección a equipo estático en instalaciones costa afuera de PEP para incluir lo siguiente: b) Incluir en el procedimiento IBR P.6.0300.01:2015 (o su equivalente) los criterios establecidos en estos códigos mencionados, para detectar y controlar los mecanismos de daño a los que está sujeta una línea de uso esporádico.	Inspection procedures: RBI	Procedimientos de inspección: IBR	Ing. Francisco Javier Montes Angel	Francois Coblentz	\N	\N	\N	\N	\N	\N	\N	\N
28	REC 2.2	\N	2	2	a	Perform analyses on the offshore facilities to consider: a) Analyze if the current SDVs location and its instruments are at appropriate spots in accordance with applicable regulations.	Realizar análisis en las instalaciones costa afuera para considerar: a) Analizar si el sitio actual de las SDVs y sus instrumentos están en los puntos adecuados de acuerdo a la normatividad aplicable.	Analyze SDV/Instrumentaion location	Análisis de ubicación de SDV/Instrumentación 	Ing. Julio Alberto Martínez Garcia/\nIng. Brenda Yadira	Miguel Onofre Alvarado	X	Changes to SDVs or SDV instruments were made according to analysis recommendations.	\N	\N	\N	\N	\N	No field verification
36	REC 2.6	\N	2	6	b	Update the maintenance plan for SDVs at inlets and outlets of the facilities to include: b) Full testing of SDVs to verify the operation, seal tightness, and the frequency of testing in accordance with NRF-045-PEMEX-2010 (or equivalent), IEC 61511, ISA-TR84.00.02.	Actualizar el plan de mantenimiento para las SDVs en las entradas y salidas de las instalaciones para incluir: b) Pruebas totales de las SDVs para verificar la operación, su hermeticidad y frecuencia de prueba de acuerdo a las normas NRF-045-PEMEX-2010 o equivalente, IEC 61511, ISA-TR84.00.02.	Full testing of SDVs	Prueba total de SDVs	Ing. Julio Alberto Martínez Garcia/\nIng. Brenda Yadira	Miguel Onofre Alvarado	O	\N	\N	\N	\N	\N	\N	\N
44	REC 3.1	\N	3	1	b	Perform an analysis of critical evacuation scenarios in offshore facilities, and implement the results of the analysis where appropriate, including: b) Modify the requirements to install emergency lights considering the possibility of autonomous operation with application of new technologies (e.g., lights with solar panels or fluorescent signal).	Realizar análisis de escenarios críticos de evacuación en instalaciones costa fuera, y en su caso implementar los resultados del análisis incluyendo:\nb) Modificar los requerimientos para instalar luces viendo la posibilidad de que sea de funcionamiento autónomo mediante la aplicación de nuevas tecnologías (por ejemplo, luces con paneles solares, señalización fluorescente).	Emergency lighting requirements 	Requisitos de iluminación de emergencia	Ing. Hazael Hernández Ruiz/\nIng. Angel Refugio Martínez González	Jorge Herrera Estrada	X	Installation of different emergency lighting.	\N	\N	\N	\N	\N	Installation of different emergency lighting.
52	REC 3.4	\N	3	4	b	Update the abandon platform drill requirements, including: b) Establish a program for abandon platform drill under pressure to train the personnel.	Actualizar los requerimientos de simulacros de abandono de plataforma incluyendo: b) Establecer un programa de simulacro de abandono bajo presión para capacitar al personal.	Drills under pressure	Simulacros bajo presión	Ing. Hermenegildo Perez Velazquez (Hildo)	Juan Manuel Hernandez	X	\N	X	\N	X	\N	\N	\N
60	REC 3.7	\N	3	7	d	Update requirements for selection and training of helmsmen including: d) Develop a training plan with critical scenarios at the training centers (CASES) including lowering the lifeboat and navigation tests with the crew (lifeboat Helmsmen).	Actualizar los requerimientos para la selección y entrenamiento de los timoneles incluyendo: d) Elaborar un plan de capacitación con escenarios críticos en los Centros de Adiestramiento (CASES) incluyendo la realización de la prueba de descenso de botes y navegación con la tripulación (Timoneles).	Helmsman training at CASES	Entrenamiento en el CASES para timoneles	 Ing. Raul Garza Torre	Alicia Castellanos Gil	\N	\N	\N	\N	\N	\N	X	\N
68	REC A.2	A	\N	2	\N	Establish a requirement that any cold formed shell or head should be heat treated for stress relieving in accordance with ASME BPVC Section VIII, Div. 1, Part UCS-56. Include this requirement in the PEMEX Technical Standard that updates or replaces PEMEX Norm NRF-028-PEMEX-2010 and apply it to new pressure vessels in critical sour service (which includes sour service and other critical services as defined by Pemex) in offshore installations.	Establecer un requisito que toda placa que sea parte de la envolvente o de la tapa que sea formada en frío deba ser tratada térmicamente para el relevado de esfuerzos de acuerdo a la norma ASME BPVC sección VIII Div. 1 Parte USC-56. Incluir este requisito en el Estándar Técnico de Pemex que actualice o sustituya la norma NRF-028-PEMEX-2010 y se aplique a los recipientes a presión nuevos en servicio crítico amargo (que incluye servicio amargo y cualquier otro servicio definido como crítico por Pemex) en instalaciones costa afuera).	Heat treatment of crit. sour service vessels	Tratamiento térmico de recipientes en servicio crítico amargo	Ing. Sergio Dionicio Renovato Carrion/\nIng. Gabriela Yasmin Palacios Blanco	Jerry Collinsworth	\N	\N	\N	\N	\N	\N	\N	No field verification
8	REC P1-6	P	1	6	\N	Establish the communication protocols of the detection of bacteria between personal from the Asset and GTDH in process facilities, and hydrocarbons recovery and transport systems, based on the results of the identification and monitoring of the bacteria.	Establecer los protocolos de comunicación de la detección de bacterias entre el personal de los Activos y GTDH, en las instalaciones de proceso y sistemas de transporte y recolección de hidrocarburos basado en los resultados de la identificación y monitoreo de las bacterias. 	Microorganism reporting communication 	Comunicación por reportes de microorganismos	Ing. Leonel Sandoval Medina 	Francois Coblentz	\N	\N	\N	\N	\N	\N	\N	\N
16	REC D1	D	1	\N	c	Develop Inspection Plans for offshore facilities including: c) Historical results of inspection according to a periodic updating process in SADIRIM and PM-SAP systems. 	Elaborar Planes de Inspección para las instalaciones costa fuera que incluyan: c) Resultados históricos de inspección de acuerdo a un proceso de actualización periódica en los sistemas SADIRIM y PM-SAP.	Inspection plans include historical review	Planes de inspección que incluyan revisión histórica	Ing. Wilbert Eduardo Koh Cambranis/\nIng. José Antonio Gómez Flores 	Miguel Onofre Alvarado	X	\N	\N	\N	\N	\N	\N	\N
24	REC D4	D	4	\N	c	c) make modifications to the inspection plan under the new operational contexts. 	c) Efectúe las modificaciones al plan de inspección conforme a los nuevos contextos operativos. 	GC Deadlegs operational inspection plans	Planes de inspección operacional para piernas muertas en líneas de GC	Ing. Angel Refugio Martínez González 	Jorge Herrera Estrada	X	\N	\N	\N	\N	\N	\N	\N
32	REC 2.3	\N	2	3	\N	Establish a strategy to maintain operational staff with decision-making capability in the COE 24 hours to activate security systems (for example: the responsibility to activate the emergency stop system). 	Establecer una estrategia para mantener personal operativo con capacidad de decisión en el COE las 24 horas para activar los sistemas de seguridad (por ejemplo: la responsabilidad de activar el sistema de paro por emergencia).	COE Highest authority 24hr	COE las mas alta autoridad las 24hrs	Ing. Leonel Sandoval Medina 	Miguel Onofre Alvarado	O	\N	O	\N	\N	\N	\N	\N
40	REC 2.9	\N	2	9	\N	Update the operational emergency shutdown procedure to include and verify the communication with all facilities involved in a process center based on the most recent operational context.	Actualizar el procedimiento de operación del sistema de paro por emergencia donde se incluya y verifique la comunicación con todas las instalaciones involucradas por centro de proceso en base al contexto operativo más reciente.	Emergency shutdown communication	Comunicación de paro por emergencia	Ing. Leonel Sandoval Medina 	Miguel Onofre Alvarado	X	\N	\N	\N	X	O	\N	\N
48	REC 3.2	\N	3	2	b	Modify the criteria to elaborate the contracting basis for third parties in order to: b) Define the companies SSPA supervisor profile to specify the required knowledge regarding all safety and protection environment aspects inherent to the position, including survival at the sea.	Modificar los criterios para la elaboración de las bases de contratación de terceros para: b) Definir el perfil del supervisor de SSPA de las compañías para precisar los conocimientos requeridos acerca de todos los aspectos de seguridad y protección ambiental propios de su puesto, incluyendo la sobrevivencia en el mar.	Contractor Training: SSPA supervisor	Capacitación a contratistas: supervisor SSPA	 Ing. Manuel Graniel Peralta	Jorge Herrera Estrada	O	\N	O	\N	\N	\N	\N	\N
56	REC 3.6	\N	3	6	\N	Modify the Emergency Response Plan for major accident cases in offshore facilities, in such a way that the Strategic URE team (first aid brigade and medic) are the last persons to abandon the process center, and designate a specific lifeboat for these personnel. 	Modificar los Planes de Respuesta a Emergencia (PRE) para casos de accidentes mayores en las instalaciones costa fuera, para que los integrantes de la URE Estratégica (que incluye la brigada de primeros auxilios y el médico) sean los últimos en abandonar el centro de proceso, y designar un bote de salvamento específico para estas personas. 	URE last to abandon	URE último en abandonar el Centro de Proceso	Ing. José Luis Ulín Torres 	Francois Coblentz	X	Identification and communication of lifeboat assigned for URE use.	X	\N	\N	\N	\N	\N
64	REC 3.10	\N	3	10	a	Update helicopter emergency response capabilities by: a) Perform a study to determine the feasibility of having available helicopters for night shifts in strategic offshore facilities to provide a quick emergency response including medical emergencies. 	Actualizar las capacidades de respuesta a emergencia con helicópteros mediante: a) Realizar estudio para determinar la viabilidad de tener helicópteros disponibles en turno nocturno en instalaciones estratégicas costa fuera con el objetivo de responder rápidamente a emergencias incluyendo emergencias médicas.	Night shift helicopters	Helicópteros turno nocturno	Cap. Carlos Torres López/\nIng. Raul Rodriguez Estrada	Alicia Castellanos Gil	X	\N	\N	\N	\N	\N	\N	\N
72	REC B.2	B	\N	2	\N	Create a census of existing pressure vessels in critical sour service (which includes sour service and other critical services as defined by Pemex) (i.e., technical document that includes all detailed information of the vessels, including the results of their inspections during their operation period) in offshore installations.	Crear un censo de recipientes a presión en servicio crítico amargo (que incluye servicio amargo y cualquier otro servicio definido como crítico por Pemex) en instalaciones costa afuera (esto es, un documento técnico que incluya toda información detallada de los recipientes, incluyendo los resultados de sus inspecciones durante su periodo de operación).	Critical sour service vessel census	Censo de recipientes en servicio crítico amargo	Ing. Francisco Javier Montes Angel	Nelson Duran	\N	\N	\N	\N	\N	\N	\N	No field verification
1	REC P1-1	P	1	1	a	a) Identify the type, sources, and effects of bacteria present in offshore facilities in the Campeche Sound	a) Identificar el tipo, origen y efecto de las bacterias presentes en las instalaciones costa fuera de la Sonda de Campeche	Identify microorganisms in GC	Identificación de microorgnismos en GC	Ing. Christian Guillermo Garcia Hernandez 	Juan Manuel Hernandez	X	\N	\N	\N	\N	\N	\N	\N
9	REC P2-1	P	2	1	a	Reduce the possibility of exceeding sweetening plant permissible H2S limits by: a) Install real-time monitoring equipment to have instantly and cumulative readings of H2S of the combustible gas composition at the outlets of the sweetening plants to verify that it does not exceed the permissible limits	Reducir la posibilidad de exceder los límites permisibles de H2S en las plantas endulzadoras mediante: a) Instalación de equipo para monitoreo en tiempo real para tomar lecturas instantáneas y acumulativas del H2S en la composición del gas combustible en el flujo de salida de las plantas endulzadoras para verificar que no se excedan los límites permisibles.	Monitoring of H2S in GC	Monitoreo de H2S en líneas de GC	Ing. Adriana Valenzuela Izquierdo (ABK)	Jorge Herrera Estrada	\N	Installation of monitoring equipment.\nLogbook entries of checking the monitoring equipment.	\N	X	\N	\N	\N	\N
17	REC D2	D	2	\N	a	Establish the requirements for the different specialists, who plan, supervise and execute activities of: inspection, non-destructive testing, mechanical integrity and RBI for static equipment, as applicable, to comply with the following: a) For contractors - Require certification according to the applicable national and international normative (to be declarative but not limiting API 570, 571, 510, 574, 580, 581, 653).	Establecer los requerimientos para los diferentes especialistas que efectúen actividades de planeación, supervisión y ejecución de inspección, pruebas no destructivas, integridad mecánica e IBR a equipos estáticos, según aplique, que cumpla con lo siguiente: a) Para contratistas –  requerir certificación conforme a la normatividad aplicable nacional e internacional (siendo enunciativas más no limitativas API 570, 571, 510, 574, 580, 581, 653).	Specialist requirements: contractors	Requerimiento de especialistas: Contratistas	Ing. Wilbert Eduardo Koh Cambranis/\nIng. José Antonio Gómez Flores 	Francois Coblentz	\N	\N	\N	\N	\N	\N	\N	\N
25	REC D5	D	5	\N	\N	Inspect the combustible gas lines in offshore facilities including the bypass lines (dead legs), using techniques that identify damage associated with MIC and H2S corrosion. 	Inspeccionar las líneas de gas combustible en instalaciones costa fuera incluyendo las líneas de derivación (piernas muertas) con técnicas que identifiquen los daños asociados a CIM y corrosión por H2S. 	Inspect GC lines for MIC/H2S corrosion	Inspección en líneas de GC por corrosión por CIM/H2S	Ing. Wilbert Eduardo Koh Cambranis/\nIng. José Antonio Gómez Flores 	Miguel Onofre Alvarado	O	\N	\N	\N	\N	\N	\N	\N
33	REC 2.4	\N	2	4	\N	Select actuator types whose energy supply (hydraulic or pneumatic) do not depend on a central power source, with the capability to take the SDV to a safe position on loss of power, and analyze the feasibility to apply these selected designs in SDVs of the ESD system at inlets/outlets of the existing platforms and new projects (according to NRF-045-PEMEX-2010 and NRF-152-PEMEX-2013 or equivalent). 	Seleccionar tipos de actuadores cuyo suministro de energía (hidráulica, neumática) no dependa de un sistema central de abastecimiento, con la capacidad de llevar la SDV a una condición de falla segura por pérdida de energía, y analizar la factibilidad para aplicar estos diseños seleccionados en las SDVs del sistema de ESD en las entradas/salidas de las plataformas existentes, así como en nuevos proyectos (de acuerdo a la NRF-045-PEMEX-2010 y NRF-152-PEMEX-2013 o equivalentes). 	Fail safe SDV actuators	Actuadores de SDV en falla segura	Ing. Leonel Sandoval Medina 	Miguel Onofre Alvarado	O	Replacement of actuators with fail-safe types.	\N	\N	\N	\N	\N	Installed SDV actuators
41	REC 2.10	\N	2	10	a	Establish an effective and continuous communication for emergencies: a) Through random communication drills with members of the Emergency Operations Center (COE) and the Regional Attention Emergency Center (CRAE) among all the platforms involved in an emergency	Establecer comunicación efectiva y continua en casos de emergencias: a) Mediante simulacros aleatorios de comunicación con Unidad de Respuesta a Emergencia (URE) Estratégica y el Grupo Regional para la Atención y Manejo de Emergencia (GRAME) entre todas las plataformas involucradas en una emergencia.	Random communication drills	Simulacros de comunicación aleatorios	Ing. Julio Alberto Martínez Garcia/\nIng. Brenda Yadira	Juan Manuel Hernandez	X	\N	\N	\N	x	O	\N	\N
49	REC 3.3	\N	3	3	a	Address issues related to medication at offshore facilities: a) Identify the medicine to prevent nausea, to be stored on the lifeboats and to be provided to the personnel during the boarding process (e.g., anti-nausea patches or anti-nausea pills prior to boarding).	Atender los asuntos relacionados con medicación en instalaciones costa fuera: a) Identificar los medicamentos para prevenir náuseas, para que estén almacenados en el bote salvavidas y sean entregados al personal durante el proceso de abordaje en caso de emergencia (por ejemplo, parches o pastillas anti-náuseas antes del abordaje).	Anti-nausea medication on life boats	Medicamentos anti-náuseas en botes salvavidas	Ing. Juan Manuel Peralta Rodriguez/\nIng. Miguel Angel Gomez Leon 	Juan Manuel Hernandez	X	Placement of anti-nausea medication, quantity, and expiration date.	X	\N	X	\N	\N	Placement of anti-nausea medication, quantity, and expiration date.
57	REC 3.7	\N	3	7	a	Update requirements for selection and training of helmsmen including: a) Perform analysis to determine the appropriate profile to comply with the Helmsmen (first to third Helmsman and alternates) functions, under emergency situations.	Actualizar los requerimientos para la selección y entrenamiento de los timoneles incluyendo: a) Realizar análisis para determinar el perfil adecuado para cumplir con las funciones de Timonel (del primer al tercer Timonel) y suplentes bajo situaciones de emergencia. 	Helmsman selection profile	Seleccionar perfil de timoneles	 Ing. Raul Garza Torre	Alicia Castellanos Gil	\N	\N	\N	\N	\N	\N	\N	\N
65	REC 3.10	\N	3	10	b	Update helicopter emergency response capabilities by: b) Set up a strategy to hire or have an agreement to have a properly equipped ambulance helicopter with instruments and medical personnel considering the worst case scenario than can happen in an offshore installation (e.g., agreements with institutions that have ambulance helicopters). 	Actualizar las capacidades de respuesta a emergencia con helicópteros mediante: b) Establecer una estrategia de contratación o convenio para contar con helicóptero ambulancia debidamente equipado con instrumental y personal médico, considerando el peor de los escenarios que pueda pasar en una instalación costa fuera (por ejemplo, acuerdos con entidades que tengan helicópteros ambulancia).	Ambulance helicopters	Helicópteros ambulancia	Cap. Carlos Torres López/\nIng. Raul Rodriguez Estrada	Alicia Castellanos Gil	X	\N	\N	\N	X	O	\N	\N
5	REC P1-3	P	1	3	\N	Reduce risks associated with thinning caused by MIC, H2S and other damage mechanisms by: (a) evaluating the operational feasibility of eliminating unnecessary dead legs, or (b) where appropriate, use corrosion inhibitors for mentioned damage mechanisms in the combustible gas system, with periodic reviewing of the effects in dead legs. 	Reducir los riesgos asociados al adelgazamiento causado por MIC, H2S y otros mecanismos de daño: (a) evaluando la viabilidad operacional de eliminar las piernas muertas innecesarias, o (b) cuando sea apropiado, use inhibidores de corrosión para los mecanismos de daño mencionados en el sistema de gas combustible, con revisión periódica de los efectos en las piernas muertas.	Eliminate Deadlegs or inject corrosion inhibitors in GC	Eliminación de Piernas Muertas o inyectar inhibidores de corrosión en líneas de GC	Ing. Leonel Sandoval Medina 	Juan Manuel Hernandez	X	Removal of deadlegs.\nInstallation of corrosion inhibitor injectors.\nLogbook entries of injecting corrosion inhibitors.	\N	\N	\N	\N	\N	Installation of corrosion inhibitor injectors.
13	REC P2-3	P	2	3	b	b) Review and define the operating and maintenance strategy for sour gas sweetening plants to ensure that the H2S permissible limits are not exceeded for all combustible gas offshore facilities, including the potentially most affected elements (e.g., dead legs). 	b) Revisar y definir la estrategia operativa y de mantenimiento de las plantas endulzadoras para asegurarse que los límites operacionales permisibles de H2S no sean excedidos para todas las instalaciones costa afuera de gas combustible incluyendo los elementos con mayor afectación (por ejemplo piernas muertas). 	Op. and Maint. Strategies for H2S	Estrategias de operación y mantenimiento por H2S	Ing. Hazael Hernández Ruiz/\nIng. Angel Refugio Martínez González	Jorge Herrera Estrada	\N	\N	\N	X	\N	\N	\N	\N
21	REC D3	D	3	\N	c	Update or develop inspection procedures for static equipment in PEP offshore facilities to include the following: c) Include in the technical specification P.9.0320.1:2015 (or equivalent) the detection of 1 - damage mechanisms associated with the combination of MIC and H2S and 2 - special conditions of the process such as dead legs and other situations that can contribute to damage mechanisms becoming more aggressive.	Actualizar o desarrollar los procedimientos de inspección a equipo estático en instalaciones costa afuera de PEP para incluir lo siguiente: c) Incluir en la especificación técnica P.9.0320.1:2015 (o su equivalente) la detección de (1) mecanismos de daño asociados a la combinación de CIM con H2S y otros presentes, y (2) las condiciones especiales en el proceso, como una pierna muerta y otras situaciones que podrían contribuir a que los mecanismos de daño sean más agresivos.	Inspection procedures: MIC/H2S/special cond.	Procedimientos de inspección: CIM/H2S/Condiciones especiales	Ing. Francisco Javier Montes Angel	Francois Coblentz	\N	\N	\N	\N	\N	\N	\N	\N
29	REC 2.2	\N	2	2	b	Perform analyses on the offshore facilities to consider: b) The possible effects of the operation of manual valves downstream (partially open), to perform the pertinent modifications in the operational philosophy or implement mitigation plans.	Realizar análisis en las instalaciones costa afuera para considerar: b) Los posibles efectos de la operación de válvulas manuales aguas abajo (parcialmente abiertas), para realizar las modificaciones pertinentes en las filosofías de operación o implementar planes de mitigación.	Analyze partially open manual valves	Análisis de válvulas manuales parcialmente abiertas	Ing. Julio Alberto Martínez Garcia/\nIng. Brenda Yadira	Miguel Onofre Alvarado	X	Set points of SDV instruments, in the process control system (in control room) are according to analysis recommendations.	\N	\N	\N	\N	\N	Set points of SDV instruments, in the process control system (in control room) are according to simulation recommendations.
37	REC 2.6	\N	2	6	c	Update the maintenance plan for SDVs at inlets and outlets of the facilities to include: c) Activities to mitigate the deterioration of the internal elements of the SDV valves in the preventive maintenance plans. 	Actualizar el plan de mantenimiento para las SDVs en las entradas y salidas de las instalaciones para incluir: c) Actividades para mitigar el deterioro de los internos de las válvulas SDVs en los planes de mantenimiento preventivo. 	Mitigate SDV deterioration 	Mitigación de deterioro de SDVs	Ing. Julio Alberto Martínez Garcia/\nIng. Brenda Yadira	Miguel Onofre Alvarado	O	\N	\N	\N	\N	\N	\N	\N
45	REC 3.1	\N	3	1	c	Perform an analysis of critical evacuation scenarios in offshore facilities, and implement the results of the analysis where appropriate, including: c) Analyze the necessity and feasibility, if applicable, to strategically place additional lifejacket containers for the platform abandonment to help personnel to escape in fire events.	Realizar análisis de escenarios críticos de evacuación en instalaciones costa fuera, y en su caso implementar los resultados del análisis incluyendo:\nc) Analizar la necesidad y en su caso la factibilidad de ubicar estratégicamente contenedores adicionales de chalecos salvavidas para el abandono de plataforma para ayudar al personal para escapar en situaciones de incendios.	Life jacket placement	Ubicación de chalecos salvavidas	Ing. Hazael Hernández Ruiz/\nIng. Angel Refugio Martínez González	Jorge Herrera Estrada	X	Placement of additional lifejacket containers.	\N	\N	\N	\N	\N	Placement of additional lifejacket containers.
53	REC 3.4	\N	3	4	c	Update the abandon platform drill requirements, including: c) Extend the scope of the abandon platform drills to cover similar situations to the Permanente accident (e.g., at night, with no lights, severe accidents).	Actualizar los requerimientos de simulacros de abandono de plataforma incluyendo: c) Ampliar el alcance de los simulacros de abandono de plataforma para cubrir situaciones similares al accidente de Permanente (por ejemplo, en la noche, sin luces, accidentes muy graves).	Drills of severe accidents	Simulacros de accidentes graves	Ing. Hermenegildo Perez Velazquez (Hildo)	Juan Manuel Hernandez	X	\N	X	\N	X	\N	\N	\N
61	REC 3.8	\N	3	8	a	Update requirements for helmsmen including: a) Set up a guideline for the helmsmen to perform the verification of the lifeboat conditions at the beginning of his 14 day shift. 	Actualizar los requerimientos para timoneles para que incluyan:\na) Establecer un lineamiento para que realicen la verificación de las condiciones del bote de salvamento que les corresponden al inicio de su catorcena.	Life boat check	Revisión de botes salvavidas	 Ing. Raul Garza Torre	Alicia Castellanos Gil	O	\N	O	\N	\N	\N	\N	\N
69	REC A.3	A	\N	3	\N	Incorporate in Appendices B and B1 included in the contracts for purchasing, design, or construction, the heat treatment requirements (normalization, stress relief and post-welding heat treatment) for pressure vessels in critical sour service (which includes sour service and other critical services as defined by Pemex) in offshore installations.	Incorporar en los Anexos B y B-1 contenidos en los contratos de adquisición, diseño o construcción, los requisitos de tratamiento térmico (normalización, relevado de esfuerzos y tratamiento térmico posterior a la soldadura) para recipientes a presión en servicio crítico amargo (que incluye servicio amargo y cualquier otro servicio definido como crítico por Pemex) en instalaciones costa afuera.	Contract requirements for heat treatment	Requerimientos de contratación por tratamiento térmico	Ing. Sergio Dionicio Renovato Carrion/\nIng. Gabriela Yasmin Palacios Blanco	Jerry Collinsworth	\N	\N	\N	\N	\N	\N	\N	No field verification
3	REC P1-1	P	1	1	c	c) designate a tolerance value to establish control methods in the combustible gas system.	c) Designar un valor de tolerancia para establecer métodos de control en el sistema de gas combustible. 	Microorganism criteria and control method in GC	Criterio para microorganismos en líneas de GC	Ing. Christian Guillermo Garcia Hernandez 	Juan Manuel Hernandez	X	Installation of control method (biocides)\nLogbook entries of applying/checking the above.	\N	\N	\N	\N	\N	Installation of control method (biocides)
11	REC P2-2	P	2	2	\N	Install corrosion coupons in the combustible gas system at the offshore process facilities. 	Instalar testigos de corrosión en el sistema de gas combustible dentro de las instalaciones de proceso costa afuera. 	Install corrosion coupons in GC	Instalación de testigos de corrosión	Ing. Wilbert Eduardo Koh Cambranis/\nIng. José Antonio Gómez Flores 	Juan Manuel Hernandez	X	Installation of corrosion coupons.\nLogbook entries of checking the corrosion coupons.	\N	\N	\N	\N	\N	Installation of corrosion coupons.
19	REC D3	D	3	\N	a	Update or develop inspection procedures for static equipment in PEP offshore facilities to include the following: a) Techniques and criteria to perform inspections for static equipment in offshore facilities according to the best international practices and codes (e.g., API 570, 571,510, 574, 580, 581, 653).	Actualizar o desarrollar los procedimientos de inspección a equipo estático en instalaciones costa afuera de PEP para incluir lo siguiente: a) Las técnicas y los criterios para la realización de las inspecciones a equipo estático en instalaciones costa afuera, conforme a las mejores prácticas y códigos internacionales (por ejemplo API 570, 571,510, 574, 580, 581, 653).	Inspection procedures: best practices	Procedimientos de inspección: Mejores prácticas	Ing. Francisco Javier Montes Angel	Francois Coblentz	\N	\N	\N	\N	\N	\N	\N	\N
27	REC 2.1	\N	2	1	b	Avoid the use of manual valves to regulate flow in pipes by: b) Develop a study for the installation of automatic flow control valves, defining where these are required, and implement the results of the analysis.	Evitar el uso de válvulas manuales para regular flujo en tuberías mediante: b) Desarrollar estudio para la instalación de válvulas automáticas reguladoras de flujo, definiendo donde se requiere, e implementar los resultados del análisis.	Automatic flow control valve addition for lines 	Adición de válvulas de control de flujo automáticas en líneas	Ing. Eligio Soto	Jorge Herrera Estrada	X	Installation of automatic valves or other process modificaitons to address strangled valves.\n\nManual valves, which were previously strangled, have been set open or closed.	\N	\N	\N	\N	\N	Installation of automatic valves or other process modificaitons to address strangled valves.\n\nManual valves, which were previously strangled, have been set open or closed.
35	REC 2.6	\N	2	6	a	Update the maintenance plan for SDVs at inlets and outlets of the facilities to include: a) The total and partial shutdown of the facilities with a specific frequency to improve the reliability according to the Safety Integrity Level (SIL) of the SDVs, considering the replacement of SDVs before the end of their useful life.	Actualizar el plan de mantenimiento para las SDVs en las entradas y salidas de las instalaciones para incluir: a) El paro total y/o parcial de las instalaciones con una frecuencia específica para mejorar la confiabilidad conforme al Nivel de Integridad de Seguridad (SIL, por sus siglas en inglés) de las SDVs, considerando el reemplazo de las SDVs antes del fin de su vida útil.	Regular offline SDV maintenance	Mantenimiento regular en SDVs fuera de línea	Ing. Julio Alberto Martínez Garcia/\nIng. Brenda Yadira	Miguel Onofre Alvarado	O	\N	\N	\N	\N	\N	\N	\N
43	REC 3.1	\N	3	1	a	Perform an analysis of critical evacuation scenarios in offshore facilities, and implement the results of the analysis where appropriate, including: a) Identifying if it is necessary to install additional evacuation routes and consider all the stairs in the facility as evacuation routes. 	Realizar análisis de escenarios críticos de evacuación en instalaciones costa fuera, y en su caso implementar los resultados del análisis incluyendo: a) Identificar si es necesario instalar rutas de evacuación adicionales y considerar todas las escaleras como rutas de evacuación en la instalación.	Evacuation routes	Rutas de evacuación	Ing. Hazael Hernández Ruiz/\nIng. Angel Refugio Martínez González	Jorge Herrera Estrada	X	Installation of additional evacuation routes.	\N	\N	\N	\N	\N	Installation of additional evacuation routes.
51	REC 3.4	\N	3	4	a	Update the abandon platform drill requirements, including: a) Reinforce and verify during the abandon platform drills that the personnel at the accommodation platform uses the assigned lifejackets. 	Actualizar los requerimientos de simulacros de abandono de plataforma incluyendo: a) Reforzar y verificar durante los simulacros de abandono de plataforma que el personal que pernocta en la Habitacional debe utilizar su chaleco asignado.	Use life jackets in room	Uso de chalecos salvavidas en la habitación	Ing. Hermenegildo Perez Velazquez (Hildo)	Juan Manuel Hernandez	X	\N	X	\N	X	\N	\N	\N
59	REC 3.7	\N	3	7	c	Update requirements for selection and training of helmsmen including: c) Train the members of the COE as platform lifeboat Helmsmen. 	Actualizar los requerimientos para la selección y entrenamiento de los timoneles incluyendo: c) Capacitar a los integrantes de la Unidad de Respuesta a Emergencias (URE) Estratégica como Timoneles.	COE helmsman	Timoneles URE	 Ing. Raul Garza Torre	Alicia Castellanos Gil	O	\N	O	\N	\N	\N	\N	\N
67	REC A.1	A	\N	1	\N	Include in the PEMEX Technical Standard for pressure vessel design and construction, that updates or replaces PEMEX Norm NRF-028-PEMEX-2010, requirements equivalent to NRF-028-PEMEX-2010 Annex 1 Sections 2.3.5 a) and b), such that all carbon steel plate and low alloy steel plate, used in the manufacturing of the shell and heads of pressure vessels in critical sour service (which includes sour service and other critical services as defined by Pemex) in offshore installations, be normalized.	Verificar y si es necesario establecer que en el Estándar Técnico de Pemex para diseño y construcción de recipientes a presión que actualice o sustituya la norma Pemex NRF-028-PEMEX-2010, incluya los requerimientos equivalentes a los incluidos en el Anexo 1 Secciones 2.3.5 a) y b) de la misma norma, en el cual se indique que todas las placas de acero al carbón y baja aleación, usadas en la fabricación de la envolvente y tapas del recipiente a presión en servicio  crítico amargo (que incluye servicio amargo y cualquier otro servicio definido como crítico por Pemex) en instalaciones costa afuera, sea normalizado.	Normalization of crit. sour service vessels	Normalización de recipientes en servicio crítico amargo	Ing. Francisco Javier Montes Angel	Jerry Collinsworth	\N	\N	\N	\N	\N	\N	\N	No field verification
6	REC P1-4	P	1	4	\N	Require that the team of process risk analysis includes the participation of a certified corrosion expert with experience in the identification of MIC and consequent related damage and other damage mechanisms in the offshore facilities. 	Requerir que dentro de los ARP participe una persona certificada en corrosión y tenga experiencia en la identificación y daño consecuente de CIM y otros mecanismos de daños en las instalaciones costa fuera.	ARPs to include corrosion SME	Incluir expertos en corrosión en los ARPs	Ing. Gonzalo Vivanco Ramírez	Jorge Herrera Estrada	O	\N	\N	\N	\N	\N	\N	\N
14	REC D1	D	1	\N	a	Develop Inspection Plans for offshore facilities including: a) Special conditions in the process, such as dead legs and other situations, which can contribute to damage mechanisms becoming more aggressive.	Elaborar Planes de Inspección para las instalaciones costa fuera que incluyan: a) Condiciones especiales en el proceso, como piernas muertas y otras situaciones que pudieran contribuir a que los mecanismos de daño sean más agresivos.	Inspection plans for special conditions	Planes de inspección por condiciones especiales	Ing. Wilbert Eduardo Koh Cambranis/\nIng. José Antonio Gómez Flores 	Miguel Onofre Alvarado	X	\N	\N	\N	\N	\N	\N	\N
22	REC D4	D	4	\N	a	a) Identify and census those lines of the combustible gas system on process facilities offshore, operating sporadically and	a) Identificar y censar las líneas del sistema de gas combustible en instalaciones de proceso costa afuera que operan de forma esporádica	Census of GC Deadlegs	Censo de piernas muertas en líneas de GC	Ing. Angel Refugio Martínez González 	Jorge Herrera Estrada	X	Dealegs that were not removed.\nLogbook entries of operational maintenance (periodic flow cycling).	\N	\N	\N	\N	\N	Combustible gas deadlegs.
30	REC 2.2	\N	2	2	c	Perform analyses on the offshore facilities to consider: c) Evaluation of Functional Safety for SDVs to determine the compliance with the standard NRF-045-PEMEX-2010 or equivalent that includes dynamic simulation of Functional Safety for all offshore facilities (e.g., with a scenario addressing a line rupture downstream of a partially open manual valve).	Realizar análisis en las instalaciones costa afuera para considerar: c) Evaluación de la Seguridad Funcional para las SDVs para determinar su cumplimiento conforme a la norma NRF-045-PEMEX-2010 o equivalente que incluya la simulación dinámica de Seguridad Funcional para todas las instalaciones costa afuera (por ejemplo, con un escenario de ruptura en una línea aguas abajo con válvula manual parcialmente abierta). 	Evaluate functional safety of SDVs	Evaluación de seguridad funcional de SDVs	Ing. Julio Alberto Martínez Garcia/\nIng. Brenda Yadira	Miguel Onofre Alvarado	X	Changes to SDVs were made according to analysis recommendations.	\N	\N	\N	\N	\N	No field verification
38	REC 2.7	\N	2	7	\N	Require the engineering, construction and maintenance personnel to consider the characterizations of the most recent composition of the fluids when making the selection and acquisition of new SDVs and other valves.	Requerir al personal de ingeniería, obras y mantenimiento que tomen en cuenta las caracterizaciones de la composición de los fluidos más reciente posible al realizar la selección y adquisición de las nuevas SDVs y otras válvulas.	Valve specs & fluid composition 	Especificación de válvula y composición de fluido	Ing. Julio Alberto Martínez Garcia/\nIng. Brenda Yadira	Francois Coblentz	\N	\N	\N	\N	\N	\N	\N	No field verification
46	REC 3.1	\N	3	1	d	Perform an analysis of critical evacuation scenarios in offshore facilities, and implement the results of the analysis where appropriate, including: d) Analyze the necessity and feasibility, if applicable, to strategically place fire blankets in strategic sites to help personnel to escape in fire events.	Realizar análisis de escenarios críticos de evacuación en instalaciones costa fuera, y en su caso implementar los resultados del análisis incluyendo:\nd) Analizar la necesidad y en su caso la factibilidad de ubicar estratégicamente mantas ignífugas en lugares estratégicos para ayudar al personal para escapar en situaciones de incendios.	Fire blanket placement	Ubicación mantas ignífugas	Ing. Hazael Hernández Ruiz/\nIng. Angel Refugio Martínez González	Jorge Herrera Estrada	X	Placement of fire blankets containers.	\N	\N	\N	\N	\N	Placement of fire blankets containers.
54	REC 3.4	\N	3	4	d	Update the abandon platform drill requirements, including: d) Perform drills closer to critical situations to address the entire abandonment process using life boats including; identify the assigned lifeboat/raft, open the hatch, enter the boat.	Actualizar los requerimientos de simulacros de abandono de plataforma incluyendo: d) Realizar simulacros apegados a situaciones más críticas para que se cumpla el proceso completo de abandono en el bote de salvamento incluyendo; identificar el bote y/o balsa correspondiente, abrir la escotilla e ingresar al bote.	Drills enter life boat	Simulacros para ingresar a botes salvavidas	Ing. Hermenegildo Perez Velazquez (Hildo)	Juan Manuel Hernandez	X	\N	X	\N	X	\N	\N	\N
62	REC 3.8	\N	3	8	b	Update requirements for helmsmen including: b) Set up an optimum frequency and identify the necessary personnel (e.g., helmsmen and safety engineer) to perform navigation tests.	Actualizar los requerimientos para timoneles para que incluyan: b) Establecer la frecuencia óptima e identificar el personal necesario (por ejemplo, timonel e ingeniero de seguridad) para realizar pruebas de navegación.	Helmsman navigation tests	Prueba de navegación de timoneles	 Ing. Raul Garza Torre	Alicia Castellanos Gil	O	\N	O	\N	\N	\N	O	\N
70	REC A.4	A	\N	4	\N	Establish the requirement that all new pressure vessels in critical sour service (which includes sour service and other critical services as defined by Pemex) in offshore installations, shall have the ASME stamp and that all associated documentation shall be provided to PEMEX. Include this requirement in the PEMEX Technical Standard that updates or replaces PEMEX Norm NRF-028-PEMEX-2010 and applicable purchasing standards.	Establecer el requisito que todos los recipientes a presión nuevos en servicio crítico amargo (que incluye servicio amargo y cualquier otro servicio definido como crítico por Pemex) en instalaciones costa afuera, deberán tener el estampado ASME y que toda la documentación asociada deberá ser entregada a Pemex. Incluir este requisito en el Estándar Técnico de Pemex que actualice o sustituya la norma Pemex NRF-028-PEMEX-2010 y estándares aplicables a la adquisición.	ASME stamp requirement	Requerimiento de estampa ASME	Ing. Sergio Dionicio Renovato Carrion/\nIng. Gabriela Yasmin Palacios Blanco	Jerry Collinsworth	\N	\N	\N	\N	\N	\N	\N	Installed vessels have ASME stamp
7	REC P1-5	P	1	5	\N	Implement the MOC process for lines of sporadic use and enforce the MOC concept. 	Implementar el proceso de la Administración de cambio para líneas de uso esporádico y reforzar el concepto de la administración de cambio. 	Management of Change for Deadlegs	Gestión de Cambio para Piernas Muertas	 Ing. Fernando Ortiz Bautista	Francois Coblentz	\N	\N	\N	\N	\N	\N	\N	\N
15	REC D1	D	1	\N	b	Develop Inspection Plans for offshore facilities including: b) Corrosion damage mechanisms associated to the combination of MIC and H2S, and special conditions of the sporadic used lines.	Elaborar Planes de Inspección para las instalaciones costa fuera que incluyan: b) Mecanismos de daño por corrosión asociados a la combinación de CIM y H2S y las condiciones especiales de las líneas de uso esporádico.	Inspection plans for damage mechanisms	Planes de inspección por mecanismos de daño	Ing. Wilbert Eduardo Koh Cambranis/\nIng. José Antonio Gómez Flores 	Miguel Onofre Alvarado	X	\N	\N	\N	\N	\N	\N	\N
23	REC D4	D	4	\N	b	b) update the operating contexts as required to communicate to the staff that plan, supervise, and execute inspection programs and 	b) Actualizarlo cuando sea requerido en los contextos operativos para comunicar al personal que planea, supervisa y ejecuta los programas de inspección 	GC Deadlegs operating contexts	Contextos operativos de Piernas Muertas 	Ing. Angel Refugio Martínez González 	Jorge Herrera Estrada	X	\N	\N	\N	\N	\N	\N	\N
31	REC 2.2	\N	2	2	d	Perform analyses on the offshore facilities to consider: d) The scenarios that may inhibit the performance of the actuators of the emergency valves (e.g., fire and explosions that could impact the hydraulic and pneumatic functions).	Realizar análisis en las instalaciones costa afuera para considerar: d) Los escenarios que puedan inhabilitar la función de los actuadores de las válvulas de emergencia (por ejemplo, fuego y explosiones que pudieran impactar las funciones hidráulicas y neumáticas.	Evaluate scenario effects on emergency valves	Evaluación de efectos de diferentes escenarios en válvulas de emergencia	Ing. Julio Alberto Martínez Garcia/\nIng. Brenda Yadira	Miguel Onofre Alvarado	X	\N	\N	\N	\N	\N	\N	\N
39	REC 2.8	\N	2	8	\N	Perform analysis to identify if there are enough fire vessels and if their capacity (water volume and jet range) are according to the conditions of a major event and number of facilities over the Campeche Sound, and implement the results of this analysis.	Desarrollar un análisis para identificar si es suficiente el número y capacidad de embarcaciones contra incendios FIFI (volumen de agua y alcance de chorro) de acuerdo a las condiciones de un evento mayor y número de instalaciones en la Sonda de Campeche e implementar los resultados de este análisis.	Fire vessels sufficiency 	Suficiencia de tanques contrainciedio	Cap. Alfredo Romero\nIng. Juan Santillan Ferreira 	Alicia Castellanos Gil	O	\N	\N	\N	O	O	\N	\N
47	REC 3.2	\N	3	2	a	Modify the criteria to elaborate the contracting basis for third parties in order to: a) Define the scope of the sea survival training to enforce that the personnel who board lifeboats/rafts stay calm and use different ways to help individuals in the water during critical situations.	Modificar los criterios para la elaboración de las bases de contratación de terceros para: a) Definir el alcance de los cursos de sobrevivencia en el mar para reforzar que el personal que aborde los botes/balsas conserve la calma y las diferentes formas de ayuda al personal que se encuentre en el agua durante situaciones críticas.	Contractor Training: calm and helpful	Capacitación a contratistas: calma y ayuda	 Ing. Manuel Graniel Peralta	Jorge Herrera Estrada	O	\N	O	\N	\N	\N	\N	\N
55	REC 3.5	\N	3	5	\N	Create and communicate a procedure to control the personnel access to the process centers arriving from ships, using as a reference NRF-043-PEMEX-2014 or equivalent to include that the control of personnel is established for 24 hrs. 	Elaborar y difundir procedimiento para tener el control de acceso a centros de proceso del personal proveniente de embarcaciones tomando como una referencia la NRF-043-PEMEX-2014 o su equivalente, que incluya que el control del personal se establezca las 24 horas.	24 hr process center access control	Control de acceso al Centro de Proceso las 24 hrs	Ing. Manuel de Jesús Herrera Villegas/\nIng. Alejandro Palacios Porras.	Juan Manuel Hernandez	X	Implementation of system for 24hr personnel access control.\n24 hr notification/ communicaition of access control system.	\N	\N	\N	\N	\N	\N
63	REC 3.9	\N	3	9	\N	Modify the sea survival training scope at the CASES to reinforce that the personnel remain calm in lifeboats/rafts as well as the different ways to help personnel in the water during critical situations.	Modificar el alcance de cursos de sobrevivencia en el mar del Centro de Adestramiento (CASES) para reforzar que el personal que aborde los botes/balsas conserve la calma, así como las diferentes formas de ayuda al personal que se encuentre en el agua durante situaciones críticas.	PEP Training: calm and helpful	Entrenamiento a PEP: calma y ayuda	 Ing. Raul Garza Torre	Alicia Castellanos Gil	O	\N	O	\N	\N	\N	O	\N
71	REC B.1	B	\N	1	\N	Include in the current PEMEX Norms and Technical Standards for pre-startup safety review the guidelines and requirements for the personnel that perform the pre-startup review to make it mandatory that they verify the evidences that the required heat treatment has been adequately performed and, if applicable, that the ASME stamp as defined in recommendation REC A.4 for new pressure vessels in critical sour service (which includes sour service and other critical services as defined by Pemex) in offshore installations is the correct one for such vessel.	Incluir en las normas y Estándares Técnicos de PEMEX actuales de RSPA las directrices y obligaciones para las personas que ejecutan la revisión de seguridad de pre arranque para hacer obligatorio que verifiquen las evidencias de que se hayan realizado adecuadamente los tratamientos térmicos necesarios, y en su caso, que el estampado ASME definido en la recomendación REC A.4 sea el que corresponda para ese recipiente a presión nuevo en servicio crítico amargo (que incluye servicio amargo y cualquier otro servicio definido como crítico por Pemex)  en instalaciones costa afuera.	Pre-startup safety review requirements	Requerimientos de revisión de seguridad para pre-arranque	Ing. Omar Hernández Carrera 	Nelson Duran	\N	\N	\N	\N	\N	\N	\N	No field verification
73	REC B.3	B	\N	3	\N	Determine whether existing pressure vessels in critical sour service (which includes sour service and other critical services as defined by Pemex) in offshore installations are made of normalized or non-normalized steel. 	Determinar si los recipientes a presión en servicio crítico amargo (que incluye servicio amargo y cualquier otro servicio definido como crítico por Pemex) existentes en las instalaciones costa afuera son de acero normalizado o no normalizado.	Check vessels for normalization	Revisión de recipientes por normalización	Ing. Wilbert Eduardo Koh Cambranis/\nIng. José Antonio Gómez Flores 	Nelson Duran	\N	\N	\N	\N	\N	\N	\N	No field verification
\.


--
-- Data for Name: status; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.status (id, desc_eng, desc_esp, type_user, type_rev, next_action) FROM stdin;
5	Needs Additional Data	Necesita datos adicionales	\\x01	\\x00	Collect additional data
7	In Conformance	En Conformidad	\\x01	\\x01	None
2	TBD	Por Definir	\\x01	\\x01	\N
8	Open	Abierto	\\x00	\\x01	\N
6	Needs Additional Attention	Necesita atención adicional	\\x01	\\x00	Evaluate further
1	Not Applicable	No aplica	\\x01	\\x00	None
4	Data Received/Evaluation	Datos recibidos/Evaluación	\\x01	\\x00	Evaluate conformance
3	Collecting Data	Recolectando datos	\\x01	\\x00	Submit data
9	Nonconformant	No conforme	\\x00	\\x01	\N
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.users (id, username, passcode, contact_phone, contact_email, type_user, type_rev) FROM stdin;
1	Default	\N	\N	\N	\N	\N
\.


--
-- Data for Name: verification_actions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.verification_actions (id, desc_eng, desc_esp) FROM stdin;
7	Review the implementation program for the action(s) to address the recommendation	Revisar el programa de implementación de la(s) acción(es) para atender la recomendación
1	 Review the documented policies, procedures, or requirements associated with the implemented action(s) to address the recommendation	Revisar las políticas, los procedimientos o los requisitos documentados asociados con las acciones implementadas para atender la recomendación
9	Verify that the implemented action(s) meet the intent of the recommendation	Verificar que la(s) acción(s) implementada(s) cumplen con la intención de la recomendación.
2	Interview PEP personnel 	Entrevistar personal de PEP
10	Visit CASES and installation(s) 	Visitar CASES e instalación(es)
5	Review documentation of the implemented action(s) taken by PEP	Revisar la documentación de la(s) acción(es) implementada(s) por PEP
13	Visit installation(s) and CRAE	Visitar instalación(es)
8	Review the roster of the team that participated in the study	Revisar la lista del equipo que participó en el estudio
6	Review the approval and/or validation documentation for the implemented action(s) to address the recommendation	Revisar la documentación de aprobación y/o verificación para las acciones implementada(s) que abarcan la recomendación
4	Review applicable PEP policies, procedures, and requirements 	Revisar las políticas, procedimientos y requerimientos de PEP
12	Visit installation(s) 	Visitar instalación(es)
3	Review applicable PEP documentation 	Revisar la documentación aplicable de PEP
11	Visit CASES(s) 	Visitar CASES(s)
\.


--
-- Name: SCHEMA public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- PostgreSQL database dump complete
--

