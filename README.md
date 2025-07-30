# SAGAPI-Proto - Sahabat Agro Group API Prototype & Monitoring

Aplikasi web middleware untuk monitoring dan prototipe API yang dibangun menggunakan Python Flask dan SQLite. Didesain oleh Freddy Mazmur dari PT Sahabat Agro Group untuk menyediakan endpoint REST API profesional dan alat monitoring transaksi data digital.

## Fitur Utama

### API Endpoints
- **POST /api/auth/login** - Autentikasi dengan token
- **POST /api/receiving-tbs/create** - Penerimaan TBS (Tandan Buah Segar)

### Dashboard Web
- Summary statistik transaksi
- Tabel logs API dengan filter dan pencarian
- Visualisasi chart (line chart dan pie chart)
- Detail view setiap transaksi dalam format tabel
- Export data ke Excel
- Sistem login untuk operator/admin

### Database Tables
- **api_logs** - Log semua request/response API
- **receiving_tbs** - Data utama penerimaan TBS
- **order_line** - Detail item per transaksi
- **users** - Manajemen user login

## Deployment

### 🌐 Live Application
**Production URL:** https://web-middlware-production.up.railway.app

### Railway Deployment
1. Push ke GitHub repository: https://github.com/FreddyMH07/web-Middlware.git
2. Connect ke Railway
3. Deploy otomatis menggunakan Procfile

### Local Development
```bash
# Clone repository
git clone https://github.com/FreddyMH07/web-Middlware.git
cd web-Middlware

# Install dependencies
pip install -r requirements.txt

# Run application
python app.py
```

### Production Setup
```bash
gunicorn app:app --bind 0.0.0.0:$PORT
```

Aplikasi akan berjalan di `http://localhost:5000`

### Login Default
- Username: `admin`
- Password: `SAGsecure#2025`

## API Documentation

### Authentication
**POST /api/auth/login**

Request Body:
```json
{
  "login": "admin",
  "password": "SAGsecure#2025",
  "database": "sag_production"
}
```

Response (Success):
```json
{
  "code": 200,
  "message": "Login Successful",
  "token": {
    "access_token": "random_token_string",
    "refresh_token": "random_refresh_token"
  }
}
```

### Create TBS Transaction
**POST /api/receiving-tbs/create**

Headers:
- Content-Type: application/json
- Authorization: Bearer {access_token}

Request Body:
```json
{
  "jsonrpc": "2.0",
  "params": {
    "order_data": [{
      "partner_id": "PT Sumber Sawit",
      "journal_id": "Bank Agro",
      "date_order": "31/07/2025 08:00:00",
      "officers": "Joko Santoso",
      "keterangan_description": "Penerimaan TBS harian",
      "driver_name": "Budi",
      "vehicle_no": "BE 1234 XX",
      "destination_warehouse_id": "Gudang Lampung",
      "branch_id": "Lampung Site",
      "order_line": [{
        "product_code": "TBS-AGRO-001",
        "qty_brutto": 10000,
        "qty_tara": 300,
        "qty_netto": 9700,
        "product_uom": "kg",
        "sortation_percent": 5,
        "sortation_weight": 485,
        "qty_netto2": 9215,
        "price_unit": 1500,
        "product_qty": 1,
        "incoming_date": "31/07/2025 08:10:00",
        "outgoing_date": "31/07/2025 08:30:00"
      }]
    }]
  }
}
```

Response (Success):
```json
{
  "code": 200,
  "message": "Receiving TBS created successfully.",
  "result": {
    "document_no": "TBS/2025/07/31/001"
  }
}
```

## Deployment

### Railway Deployment
1. Push code ke repository Git
2. Connect repository ke Railway
3. Deploy otomatis akan berjalan
4. Aplikasi siap digunakan

### Environment Variables (Optional)
- `FLASK_ENV=production`
- `SECRET_KEY=your_secret_key`

## Developer

**Freddy Mazmur**  
PT Sahabat Agro Group  
Database & Middleware Developer

## Tech Stack

- **Backend**: Python Flask
- **Database**: SQLite (auto-initialized)
- **Frontend**: Bootstrap 5 + Chart.js
- **Export**: openpyxl (Excel)
- **Deployment**: Railway

## License

Private - PT Sahabat Agro Group Internal Use Only
