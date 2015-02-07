if Rails.env.development?
  Category.create(
    [
      {id: 1, name: 'iPhone', code: 'iosp'},
      {id: 2, name: 'iPad', code: 'iost'},
      {id: 3, name: 'Android Phone', code: 'andp'},
      {id: 4, name: 'Android Tablet', code: 'andt'},
      {id: 5, name: 'Receipt Printers', code: 'prin'},
    ]
  )

  Device.create(
    [
      {id: 1, category_id: 1, hardware: 'iPhone 5s', operating_system: 'iOS 7.1', storage_code: '00001', barcode: 'iosp0001'},
      {id: 2, category_id: 1, hardware: 'iPhone 6', operating_system: 'iOS 7.2', storage_code: '00002', barcode: 'iosp0002'},
      {id: 3, category_id: 2, hardware: 'iPad Air', operating_system: 'iOS 8.0', storage_code: '00010', barcode: 'iost0010'},
      {id: 4, category_id: 2, hardware: 'iPad Mini', operating_system: 'iOS 7.2', storage_code: '00011', barcode: 'iost0011'},
      {id: 5, category_id: 3, hardware: 'Galaxy S4', operating_system: 'Android 4.4', storage_code: '00100', barcode: 'andp0100'},
      {id: 6, category_id: 5, hardware: 'Casio PCR-T280', operating_system: '', storage_code: '10000', barcode: 'prin1000'},
    ]
  )
end