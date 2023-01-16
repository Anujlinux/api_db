class ValidateJob
    include Sidekiq::Job

    sidekiq_options retry: false

    def perform(srctype, tenant_id, table_data)
        p "validation started"
        table_data.each do |row|
            Piidatum.create(
                    schema_name: row[0],
                    table_name: row[1],
                    column_name: row[2],
                    pii_type: row[3],
                    amount: row[4],
                    tenant_id: tenant_id
                )
        end
    end
end