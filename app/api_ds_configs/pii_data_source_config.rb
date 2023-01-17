class PiiDataSourceConfig
	def self.convert_and_add(response, tenant_id)
		p "Config started"
		table_data = response.map {|row| row.values_at("schema_name", "table_name", "column_name", "pii_type", "amount")}
        p table_data
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
        p "config Ended"
    end
end