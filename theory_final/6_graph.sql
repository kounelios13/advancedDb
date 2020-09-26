drop table if exists graphnode cascade;
drop table if exists symb cascade;
drop type if exists noumero;

CREATE TYPE noumero AS ENUM ('1', '2', '3', '4', '5', '6', '7', '8', '9', '10', '11');

create table graphnode (
    nodekey text not null,
    facet   text,
    primary key (nodekey)
);

create table symb(
    nodekey1 text not null,
    nodekey2 text not null,
    value    int[],
    fanela noumero,
    foreign key (nodekey1) references graphnode (nodekey),
    foreign key (nodekey2) references graphnode (nodekey),
    primary key (nodekey1, nodekey2, value)
);

insert into graphnode values ('olimpiakos', 'omada');
insert into graphnode values ('panathinaikos', 'omada');

insert into graphnode values ('anatolakis', 'paixtis');
insert into graphnode values ('apostolakis', 'paixtis');
insert into graphnode values ('pathiakakis', 'paixtis');

insert into symb values ('olimpiakos','apostolakis', array[1000], '2');
insert into symb values ('panathinaikos','anatolakis', array[1000], '11');
insert into symb values ('panathinaikos','pathiakakis', array[1000], '10');

insert into graphnode values ('ofi', 'omada');
insert into graphnode values ('kournikos', 'paixtis');
insert into symb values ('kournikos','ofi', array[500], '11');

