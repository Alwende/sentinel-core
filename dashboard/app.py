import streamlit as st
import pandas as pd
st.set_page_config(page_title='Sentinel-Core | Global Command', layout='wide')
st.title('🛡️ Sentinel-Core Sovereign HUD')
st.subheader('v5.5.0-VISUAL | Global Mesh Monitoring')
col1, col2, col3 = st.columns(3)
col1.metric('Active Nodes', '102,405', '+12%')
col2.metric('Avg Z-Score', '0.28', '-0.05')
col3.metric('MTTR', '8.2s', '-1.4s')
st.write('### Global Traffic Distribution')
# Bypassing the bracket-paste bug using string split
regions = 'Europe-West (Primary),US-Central (Standby)'.split(',')
loads = [int(x) for x in '65,35'.split(',')]
chart_data = pd.DataFrame({'Region': regions, 'Traffic Load (%)': loads})
st.bar_chart(chart_data.set_index('Region'))
st.write('### Live Forensic Feed (LLM-Generated)')
st.info('**STATUS: SOVEREIGN** - Anomaly detected in PID 4402 on US-Node-09. Z-Score 3.1. Process Terminated.')
st.success('**STATUS: RECOVERY** - Secondary SQL Instance in us-central1 verified. Latency: 42ms.')
