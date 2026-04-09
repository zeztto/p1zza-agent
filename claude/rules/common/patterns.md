# Patterns

## Skeleton projects

Search battle-tested templates → evaluate with parallel agents (security, extensibility, relevance) → clone best match → iterate.

## Repository pattern

Interface with standard ops: findAll, findById, create, update, delete. Concrete impls handle storage. Business logic depends on abstract interface.

## API response envelope

Consistent format: success indicator, data payload (nullable on error), error message (nullable on success), pagination metadata (total, page, limit).
