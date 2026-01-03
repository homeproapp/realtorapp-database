update client_invitations set deleted_at = null;

update property_invitations set deleted_at = null;

update client_invitations_properties set deleted_at = null;

update listings set deleted_at = null;

update agents_listings al set deleted_at = null;

update clients_listings set deleted_at = null;