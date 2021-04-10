create_table :logs do |t|
  t.string :remote_ip
  t.text :useragent

  t.timestamps
end
