-- Rode este script inteiro no SQL Editor do Supabase (menu lateral "SQL Editor" > "New query")

create extension if not exists "uuid-ossp";

-- Tabela de itens do cardápio (com custo e preço de venda)
create table if not exists items (
  id uuid primary key default uuid_generate_v4(),
  name text not null,
  cost numeric not null default 0,
  price numeric not null default 0,
  created_at timestamptz not null default now()
);

-- Tabela de registros: vendas e gastos/investimentos, por dia
create table if not exists records (
  id uuid primary key default uuid_generate_v4(),
  date date not null,
  type text not null check (type in ('venda','gasto')),
  item_id uuid references items(id) on delete set null,
  item_name text,
  qty integer,
  value numeric not null default 0,
  cost numeric default 0,
  description text,
  created_at timestamptz not null default now()
);

-- Segurança em nível de linha (obrigatório no Supabase)
alter table items enable row level security;
alter table records enable row level security;

-- Como é um app de uso pessoal (sem login), liberamos leitura/escrita para quem tiver a chave anônima.
-- Importante: isso significa que qualquer pessoa com o link do site consegue ver e editar os dados.
create policy "allow all items" on items for all using (true) with check (true);
create policy "allow all records" on records for all using (true) with check (true);
