# spec-libraries

Harness documentation and product documentation MUST NOT share one spec pile.

## Requirements

- The Mandate template repo MUST NOT contain a product PRD, product `src/`, or product-specific OpenSpec changes (except the disposable `example-starter`).
- After `init-project.sh`, `openspec/config.yaml` MUST describe the **product**, not Mandate.
- Stakeholder-readable PRD and architecture MUST live in the product repo (`docs/` / `openspec/`).
- Cross-project landscape and brainstorm that is not about one repo MUST live in `~/MDS/`, never in a product clone.
- Agents MUST refuse to add FlagFootballGirls (or any product) specs to the Mandate template.
