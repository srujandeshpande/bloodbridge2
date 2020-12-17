-- Your database schema. Use the Schema Designer at http://localhost:8001/ to add some tables.
CREATE TABLE donors (
    id UUID DEFAULT uuid_generate_v4() PRIMARY KEY NOT NULL,
    first_name TEXT NOT NULL,
    last_name TEXT DEFAULT NULL,
    phone_number TEXT NOT NULL,
    pincode TEXT DEFAULT NULL,
    address TEXT DEFAULT NULL,
    email TEXT NOT NULL,
    blood_group TEXT NOT NULL
);
CREATE TABLE orgs (
    id UUID DEFAULT uuid_generate_v4() PRIMARY KEY NOT NULL,
    name TEXT NOT NULL,
    address TEXT NOT NULL,
    pincode TEXT NOT NULL,
    city TEXT NOT NULL,
    state TEXT NOT NULL,
    phone_number TEXT NOT NULL,
    email TEXT NOT NULL,
    capacity TEXT DEFAULT NULL
);
CREATE TABLE donations (
    id UUID DEFAULT uuid_generate_v4() PRIMARY KEY NOT NULL,
    donor_id UUID NOT NULL,
    org_id UUID NOT NULL,
    quantity TEXT,
    donation_time TIMESTAMP WITH TIME ZONE DEFAULT NULL,
    "location" TEXT DEFAULT NULL
);
CREATE TABLE alerts (
    id UUID DEFAULT uuid_generate_v4() PRIMARY KEY NOT NULL,
    org_id UUID NOT NULL,
    blood_group TEXT NOT NULL,
    quantity TEXT DEFAULT NULL,
    create_date TIMESTAMP WITH TIME ZONE DEFAULT NOW() NOT NULL,
    expire_date TIMESTAMP WITH TIME ZONE DEFAULT NULL,
    open BOOLEAN DEFAULT true NOT NULL
);
ALTER TABLE alerts ADD CONSTRAINT alerts_ref_org_id FOREIGN KEY (org_id) REFERENCES orgs (id) ON DELETE NO ACTION;
ALTER TABLE donations ADD CONSTRAINT donations_ref_donor_id FOREIGN KEY (donor_id) REFERENCES donors (id) ON DELETE NO ACTION;
ALTER TABLE donations ADD CONSTRAINT donations_ref_org_id FOREIGN KEY (org_id) REFERENCES orgs (id) ON DELETE NO ACTION;
