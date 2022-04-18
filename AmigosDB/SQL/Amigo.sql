create table amigo
(
  Id integer not null primary key,
  Nombre varchar(100) not null,
  Alias varchar(20),
  Telefono varchar(20) not null
);

create generator gen_amigo;

set term ^;
create trigger trg_amigo_b_i for amigo before insert
as
begin
  new.Id = gen_id(gen_amigo, 1);
end^
set term ;^

insert into amigo (Nombre, Alias, Telefono) values ('Jesus', 'Chucho', '123');
insert into amigo (Nombre, Alias, Telefono) values ('Luis', 'Lucho', '456');
insert into amigo (Nombre, Alias, Telefono) values ('Juan Jose', 'JJ', '222');

select * from amigo
