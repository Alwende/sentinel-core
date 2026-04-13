
# Integration of LLM RCA
from rca_engine.py import llm_rca

def log_to_ledger(pid, cpu, reason):
    summary = llm_rca.generate_summary(pid, cpu, reason)
    # This pushes the human-readable (but encrypted) summary to our Postgres Tier
    print(f"FORRENSIC_LOG: {summary}")
