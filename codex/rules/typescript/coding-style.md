---
paths:
  - "**/*.ts"
  - "**/*.tsx"
  - "**/*.js"
  - "**/*.jsx"
---
# TypeScript Coding Style

Extends [common/coding-style.md](../common/coding-style.md).

## Types

- Explicit param + return types on all exports; infer locals
- `interface` for extensible object shapes; `type` for unions/intersections/mapped
- String literal unions over `enum`
- Never `any` -- use `unknown` + narrowing or generics
- No `React.FC`; named `interface` for props

```typescript
interface User { id: string; email: string }

export function formatUser(user: User): string {
  return `${user.firstName} ${user.lastName}`
}

// unknown + narrowing
function getErrorMessage(error: unknown): string {
  return error instanceof Error ? error.message : 'Unexpected error'
}
```

```typescript
// React props
interface UserCardProps {
  user: User
  onSelect: (id: string) => void
}

function UserCard({ user, onSelect }: UserCardProps) {
  return <button onClick={() => onSelect(user.id)}>{user.email}</button>
}
```

## Immutability

Spread for updates; `Readonly<T>` on inputs:

```typescript
function updateUser(user: Readonly<User>, name: string): User {
  return { ...user, name }
}
```

## Error Handling

async/await + try-catch; narrow `unknown`:

```typescript
async function loadUser(userId: string): Promise<User> {
  try {
    return await riskyOperation(userId)
  } catch (error: unknown) {
    logger.error('Operation failed', error)
    throw new Error(getErrorMessage(error))
  }
}
```

## Validation

Zod schemas; infer types from schema:

```typescript
import { z } from 'zod'

const userSchema = z.object({
  email: z.string().email(),
  age: z.number().int().min(0).max(150)
})

type UserInput = z.infer<typeof userSchema>
const validated: UserInput = userSchema.parse(input)
```

## JS Files

JSDoc when TS migration impractical; keep aligned with runtime.

## console.log

No `console.log` in production. Use proper loggers. See [hooks.md](./hooks.md).
