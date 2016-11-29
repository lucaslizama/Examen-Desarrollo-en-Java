drop database if exists dej_4501_examen;

create database dej_4501_examen;
use dej_4501_examen;

create table comuna (
    id int auto_increment,
    nombreComuna varchar(100) not null,
    primary key(id),
    unique(nombreComuna)
);

create table cliente (
    id int auto_increment,
    rut int unsigned not null,
    dv char not null,
    clave varchar(255) not null,
    nombreCliente varchar(50) not null,
    apellidoPaterno varchar(50) not null,
    apellidoMaterno varchar(50) not null,
    direccionCliente varchar(255) not null,
    numeracion int not null,
    comuna int not null,
    telefono varchar(9) not null,
    primary key(id),
    foreign key(comuna) references comuna(id),
    unique(rut)
);

create table plato (
    id int auto_increment,
    nombrePlato varchar(255) not null,
    precioPlato int not null,
    primary key(id),
    unique(nombrePlato)
);

create table bebida (
    id int auto_increment,
    nombreBebida varchar(255) not null,
    precioBebida int not null,
    primary key(id),
    unique(nombreBebida)
);

create table pedido (
    id int auto_increment,
    cliente int not null,
    plato int not null,
    bebida int not null,
    total int not null,
    fechaHora timestamp not null,
    primary key(id),
    foreign key(cliente) references cliente(id),
    foreign key(plato) references plato(id),
    foreign key(bebida) references bebida(id)
);

-- Datos de comunas

insert into comuna (nombreComuna) values ('Arica'),('Camarones'),('General Lagos'),('Putre'),('Alto Hospicio'),('Iquique'),('Camiña'),('Colchane'),('Huara'),( 'Pica'),( 'Pozo Almonte'),( 'Antofagasta'),( 'Mejillones'),( 'Sierra Gorda'),( 'Taltal'),( 'Calama'),( 'Ollague'),( 'San Pedro de Atacama'),( 'María Elena'),( 'Tocopilla'),( 'Chañaral'),( 'Diego de Almagro'),( 'Caldera'),( 'Copiapó'),( 'Tierra Amarilla'),( 'Alto del Carmen' ),( 'Freirina' ),( 'Huasco' ),( 'Vallenar' ),( 'Canela' ),( 'Illapel' ),( 'Los Vilos' ),( 'Salamanca' ),( 'Andacollo' ),( 'Coquimbo' ),( 'La Higuera' ),( 'La Serena' ),( 'Paihuaco' ),( 'Vicuña' ),( 'Combarbalá' ),( 'Monte Patria' ),( 'Ovalle' ),( 'Punitaqui' ),( 'Río Hurtado' ),( 'Isla de Pascua' ),( 'Calle Larga' ),( 'Los Andes' ),( 'Rinconada' ),( 'San Esteban' ),( 'La Ligua' ),( 'Papudo' ),( 'Petorca' ),( 'Zapallar' ),( 'Hijuelas' ),( 'La Calera' ),( 'La Cruz' ),( 'Limache' ),( 'Nogales' ),( 'Olmué' ),( 'Quillota' ),( 'Algarrobo' ),( 'Cartagena' ),( 'El Quisco' ),( 'El Tabo' ),( 'San Antonio' ),( 'Santo Domingo' ),( 'Catemu' ),( 'Llaillay' ),( 'Panquehue' ),( 'Putaendo' ),( 'San Felipe' ),( 'Santa María' ),( 'Casablanca' ),( 'Concón' ),( 'Juan Fernández' ),( 'Puchuncaví' ),( 'Quilpué' ),( 'Quintero' ),( 'Valparaíso' ),( 'Villa Alemana' ),( 'Viña del Mar' ),( 'Colina' ),( 'Lampa' ),( 'Tiltil' ),( 'Pirque' ),( 'Puente Alto' ),( 'San José de Maipo' ),( 'Buin' ),( 'Calera de Tango' ),( 'Paine' ),( 'San Bernardo' ),( 'Alhué' ),( 'Curacaví' ),( 'María Pinto' ),( 'Melipilla' ),( 'San Pedro' ),( 'Cerrillos' ),( 'Cerro Navia' ),( 'Conchalí' ),( 'El Bosque' ),( 'Estación Central' ),( 'Huechuraba' ),( 'Independencia' ),( 'La Cisterna' ),( 'La Granja' ),( 'La Florida' ),( 'La Pintana' ),( 'La Reina' ),( 'Las Condes' ),( 'Lo Barnechea' ),( 'Lo Espejo' ),( 'Lo Prado' ),( 'Macul' ),( 'Maipú' ),( 'Ñuñoa' ),( 'Pedro Aguirre Cerda' ),( 'Peñalolén' ),( 'Providencia' ),( 'Pudahuel' ),( 'Quilicura' ),( 'Quinta Normal' ),( 'Recoleta' ),( 'Renca' ),( 'San Miguel' ),( 'San Joaquín' ),( 'San Ramón' ),( 'Santiago' ),( 'Vitacura' ),( 'El Monte' ),( 'Isla de Maipo' ),( 'Padre Hurtado' ),( 'Peñaflor' ),( 'Talagante' ),( 'Codegua' ),( 'Coínco' ),( 'Coltauco' ),( 'Doñihue' ),( 'Graneros' ),( 'Las Cabras' ),( 'Machalí' ),( 'Malloa' ),( 'Mostazal' ),( 'Olivar' ),( 'Peumo' ),( 'Pichidegua' ),( 'Quinta de Tilcoco' ),( 'Rancagua' ),( 'Rengo' ),( 'Requínoa' ),( 'San Vicente de Tagua Tagua' ),( 'La Estrella' ),( 'Litueche' ),( 'Marchihue' ),( 'Navidad' ),( 'Peredones' ),( 'Pichilemu' ),( 'Chépica' ),( 'Chimbarongo' ),( 'Lolol' ),( 'Nancagua' ),( 'Palmilla' ),( 'Peralillo' ),( 'Placilla' ),( 'Pumanque' ),( 'San Fernando' ),( 'Santa Cruz' ),( 'Cauquenes' ),( 'Chanco' ),( 'Pelluhue' ),( 'Curicó' ),( 'Hualañé' ),( 'Licantén' ),( 'Molina' ),( 'Rauco' ),( 'Romeral' ),( 'Sagrada Familia' ),( 'Teno' ),( 'Vichuquén' ),( 'Colbún' ),( 'Linares' ),( 'Longaví' ),( 'Parral' ),( 'Retiro' ),( 'San Javier' ),( 'Villa Alegre' ),( 'Yerbas Buenas' ),( 'Constitución' ),( 'Curepto' ),( 'Empedrado' ),( 'Maule' ),( 'Pelarco' ),( 'Pencahue' ),( 'Río Claro' ),( 'San Clemente' ),( 'San Rafael' ),( 'Talca' ),( 'Arauco' ),( 'Cañete' ),( 'Contulmo' ),( 'Curanilahue' ),( 'Lebu' ),( 'Los Álamos' ),( 'Tirúa' ),( 'Alto Biobío' ),( 'Antuco' ),( 'Cabrero' ),( 'Laja' ),( 'Los Ángeles' ),( 'Mulchén' ),( 'Nacimiento' ),( 'Negrete' ),( 'Quilaco' ),( 'Quilleco' ),( 'San Rosendo' ),( 'Santa Bárbara' ),( 'Tucapel' ),( 'Yumbel' ),( 'Chiguayante' ),( 'Concepción' ),( 'Coronel' ),( 'Florida' ),( 'Hualpén' ),( 'Hualqui' ),( 'Lota' ),( 'Penco' ),( 'San Pedro de La Paz' ),( 'Santa Juana' ),( 'Talcahuano' ),( 'Tomé' ),( 'Bulnes' ),( 'Chillán' ),( 'Chillán Viejo' ),( 'Cobquecura' ),( 'Coelemu' ),( 'Coihueco' ),( 'El Carmen' ),( 'Ninhue' ),( 'Ñiquen' ),( 'Pemuco' ),( 'Pinto' ),( 'Portezuelo' ),( 'Quillón' ),( 'Quirihue' ),( 'Ránquil' ),( 'San Carlos' ),( 'San Fabián' ),( 'San Ignacio' ),( 'San Nicolás' ),( 'Treguaco' ),( 'Yungay' ),( 'Carahue' ),( 'Cholchol' ),( 'Cunco' ),( 'Curarrehue' ),( 'Freire' ),( 'Galvarino' ),( 'Gorbea' ),( 'Lautaro' ),( 'Loncoche' ),( 'Melipeuco' ),( 'Nueva Imperial' ),( 'Padre Las Casas' ),( 'Perquenco' ),( 'Pitrufquén' ),( 'Pucón' ),( 'Saavedra' ),( 'Temuco' ),( 'Teodoro Schmidt' ),( 'Toltén' ),( 'Vilcún' ),( 'Villarrica' ),( 'Angol' ),( 'Collipulli' ),( 'Curacautín' ),( 'Ercilla' ),( 'Lonquimay' ),( 'Los Sauces' ),( 'Lumaco' ),( 'Purén' ),( 'Renaico' ),( 'Traiguén' ),( 'Victoria' ),( 'Corral' ),( 'Lanco' ),( 'Los Lagos' ),( 'Máfil' ),( 'Mariquina' ),( 'Paillaco' ),( 'Panguipulli' ),( 'Valdivia' ),( 'Futrono' ),( 'La Unión' ),( 'Lago Ranco' ),( 'Río Bueno' ),( 'Ancud' ),( 'Castro' ),( 'Chonchi' ),( 'Curaco de Vélez' ),( 'Dalcahue' ),( 'Puqueldón' ),( 'Queilén' ),( 'Quemchi' ),( 'Quellón' ),( 'Quinchao' ),( 'Calbuco' ),( 'Cochamó' ),( 'Fresia' ),( 'Frutillar' ),( 'Llanquihue' ),( 'Los Muermos' ),( 'Maullín' ),( 'Puerto Montt' ),( 'Puerto Varas' ),( 'Osorno' ),( 'Puero Octay' ),( 'Purranque' ),( 'Puyehue' ),( 'Río Negro' ),( 'San Juan de la Costa' ),( 'San Pablo' ),( 'Chaitén' ),( 'Futaleufú' ),( 'Hualaihué' ),( 'Palena' ),( 'Aisén' ),( 'Cisnes' ),( 'Guaitecas' ),( 'Cochrane' ),( "O'higgins" ),( 'Tortel' ),( 'Coihaique' ),( 'Lago Verde' ),( 'Chile Chico' ),( 'Río Ibáñez' ),( 'Antártica' ),( 'Cabo de Hornos' ),( 'Laguna Blanca' ),( 'Punta Arenas' ),( 'Río Verde' ),( 'San Gregorio' ),( 'Porvenir' ),( 'Primavera' ),( 'Timaukel' ),( 'Natales' ),( 'Torres del Paine');

-- Datos platos

insert into plato (nombrePlato,precioPlato) values ('Arroz con pollo', 3200),('Cazuela de vacuno', 3500),('Lentejas con longaniza', 3000),('Porotos con riendas', 2000);

-- Datos bebidas

insert into bebida (nombreBebida, precioBebida) values ('Mineral', 700), ('Jugo', 800), ('Malteada', 1000);

-- Insertar Clientes

insert into cliente (rut,dv,clave,nombreCliente,apellidoPaterno,apellidoMaterno,direccionCliente,numeracion,comuna,telefono) values (18464695,'1','$2a$12$kyDfvbc/StUjaCtlcPszVu0axHvIWdw9snI1vV.bVUiw9CxnKfoSS','Lucas','Lizama','Monje','Los Militares',5200,109,654785419);