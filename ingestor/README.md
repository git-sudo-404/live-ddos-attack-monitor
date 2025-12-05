src/
├── types/
│ ├── unified.ts <-- The "Standard Way" (What your DB needs)
│ └── external/ <-- The raw messy types from the APIs
│ ├── fortinet.d.ts
│ ├── a10.d.ts
│ └── netscout.d.ts
│
├── services/ <-- Fetchers (Only job: Get JSON from URL)
│ ├── fortinetService.ts
│ ├── a10Service.ts
│ └── netscoutService.ts
│
├── adapters/ <-- Transformers (Only job: Raw -> Unified)
│ ├── fortinetAdapter.ts
│ ├── a10Adapter.ts
│ └── netscoutAdapter.ts
│
├── db/
│ └── client.ts <-- Saves 'UnifiedThreat' to DB
│
└── index.ts <-- The Orchestrator
