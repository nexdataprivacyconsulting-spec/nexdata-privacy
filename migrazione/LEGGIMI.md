# Migrazione di NexData fuori da Lovable

Stato: in corso. Il sito non ha database né backend (verificato).

## Passi per Mattia
1. **Collega Lovable a GitHub** (editor Lovable → GitHub → Connect project). Crea un repository con il codice e i file di `public/`.
2. **Scarica gli asset ospitati da Lovable** (non finiscono nel repository):
   `./scripts/fetch-lovable-assets.sh` dal tuo computer, poi `git add public/assets && git commit && git push`.
3. Comunica a Claude il nome del repository creato.

## Cosa fa Claude dopo
- Sostituisce `@lovable.dev/vite-tanstack-config` con plugin Vite standard e rimuove i ganci Lovable.
- Riscrive i percorsi `/__l5e/assets-v1/...` verso `public/assets/`.
- Compila, verifica, prepara il deploy su Cloudflare e poi migliora grafica e movimento.

Non disdire l'abbonamento Lovable finché il sito nuovo non è online sul dominio.
