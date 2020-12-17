-- Your database schema. Use the Schema Designer at http://localhost:8001/ to add some tables.
CREATE TABLE donors (
    id UUID DEFAULT uuid_generate_v4() PRIMARY KEY NOT NULL,
    first_name TEXT NOT NULL,
    last_name TEXT,
    phone_number TEXT NOT NULL,
    pincode TEXT DEFAULT NULL,
    address TEXT DEFAULT NULL,
    email TEXT NOT NULL
);
CREATE TABLE orgs (
    id UUID DEFAULT uuid_generate_v4() PRIMARY KEY NOT NULL
);
