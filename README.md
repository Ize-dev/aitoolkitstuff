AI Toolkit Mobile Wrapper (PWA) + Quick-Start Batch

A tiny “quality of life” add-on for AI Toolkit:

- pwa.html -> a mobile-friendly PWA view for monitoring training (job status, ETA, CPU/GPU stats, loss graph, latest samples)
- Start AIT.bat -> a small Windows batch to start the toolkit and open the dashboard

This is vibe-coded (because lazyness = maximum 😄) and a bit random, but very practical when you want to check training progress from your phone.


SCREENSHOTS (mobile UI)

![Job overview / active training](/screenshot/Screenshot_20260104_113317_Vivaldi.jpg?raw=true "Job overview / active training")

![Full dashboard with system stats](/screenshot/Screenshot_20260104_113720_Vivaldi.jpg?raw=true "Full dashboard with system stats")

![Loss graph + samples grouped by step](/screenshot/Screenshot_20260104_113736_Vivaldi.jpg?raw=true "Loss graph + samples grouped by step")

![Sample viewer with step / image navigation](/screenshot/Screenshot_20260104_113832_Vivaldi.jpg?raw=true "Sample viewer with step / image navigation")


FILES

pwa.html
Single static HTML file that:
- polls AI Toolkit API endpoints (jobs, cpu/gpu stats, loss, samples)
- renders:
  - active job + progress + speed
  - ETA + “finish at”
  - CPU & GPU stat cards
  - loss graph
  - sample thumbnails grouped by step
  - full-screen sample viewer with navigation

Start AIT.bat
Windows helper batch to start your toolkit setup and open the dashboard.
You will probably need to tweak paths or ports to match your local setup.


INSTALLATION

1) Copy pwa.html into AI Toolkit

Before starting the UI, copy pwa.html to:

<AI_TOOLKIT_FOLDER>\ui\public\pwa.html

Anything inside ui/public is served as static content by the UI.


2) Adjust the URL inside pwa.html (IMPORTANT)

Open pwa.html and look for line 706:

$("openUI").href = "http://192.168.178.38:8675/";

Change it to match your environment:

- Same PC:
  http://127.0.0.1:8675/
  or
  http://localhost:8675/

- Phone / tablet via LAN:
  http://<YOUR-PC-IP>:8675/

This mainly affects the “WebUI” button inside the PWA.


3) Start AI Toolkit

- Use your normal startup process, or
- run Start AIT.bat


USAGE

Open the PWA page:

Desktop:
http://localhost:8675/pwa.html

Phone (recommended):
http://<YOUR-PC-IP>:8675/pwa.html

Your phone and PC must be on the same network.
Your firewall must allow inbound traffic on the UI port (example: 8675).

BATCH FILE NOTES (Start AIT.bat)

Open the batch file and adjust:
- DASHBOARD_URL (host + port)
- folder paths if your toolkit layout differs

Expected structure example:

<AI_TOOLKIT_FOLDER>
  venv
  ui
  Start AIT.bat


TROUBLESHOOTING

PWA shows offline or no data:
- confirm the normal UI loads first (http://<host>:8675/)
- on phones, never use localhost, always your PC LAN IP
- check Windows Firewall for the UI port

WebUI button opens the wrong address:
- you forgot to update the openUI URL inside pwa.html

Samples do not show or images are broken:
- your toolkit version may use different image endpoints
- adjust the image URL helper inside pwa.html if needed
