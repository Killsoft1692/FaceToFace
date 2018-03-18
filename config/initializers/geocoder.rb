Geocoder.configure(

    lookup: :google,

    http_proxy: ENV['QUOTAGUARD_URL'],

    timeout: 5,

    units: :km,

    api_key: 'Your API_KEY'
)