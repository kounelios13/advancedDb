drop type if exists address cascade ;
drop table if exists beneficiary;

create type address as (
    street varchar(60),
    city varchar(60),
    country varchar(60)
);

create table beneficiary(
    Tax_ID text not null ,
    Full_Name text not null ,
    Home_Address address,
    telephone varchar(20) [],
    primary key (Tax_ID)
);

insert into beneficiary values ('123123', 'Marcelo Mollaj', row ( 'L Minoos 42', 'Herakleion', 'Herakleion'), array ['2810556677']);

select Full_Name
from beneficiary
where (Home_Address).city = 'Herakleion' and telephone[1]='2810556677';

create table p (
    adt int not null ,
    fn text,
    phone text[],
    address text,
    primary key (adt)
);

create table a (
    primary key (adt),
    d date
)inherits (p)