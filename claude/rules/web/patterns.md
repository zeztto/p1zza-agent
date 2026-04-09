Extends [common/patterns.md](../common/patterns.md).

# Web Patterns

## Compound Components

Parent owns state, children consume via context. Prefer over prop drilling:

```tsx
<Tabs defaultValue="overview">
  <Tabs.List>
    <Tabs.Trigger value="overview">Overview</Tabs.Trigger>
    <Tabs.Trigger value="settings">Settings</Tabs.Trigger>
  </Tabs.List>
  <Tabs.Content value="overview">...</Tabs.Content>
  <Tabs.Content value="settings">...</Tabs.Content>
</Tabs>
```

## Render Props / Slots

- Use when behavior is shared but markup varies
- Keep keyboard/ARIA/focus logic in the headless layer

## Container / Presentational

- Containers: data loading + side effects
- Presentational: props in, UI out, stay pure

## State Management

| Concern | Tooling |
|---------|---------|
| Server state | TanStack Query, SWR, tRPC |
| Client state | Zustand, Jotai, signals |
| URL state | search params, route segments |
| Form state | React Hook Form or equivalent |

- Never duplicate server state into client stores
- Derive values; don't store redundant computed state

## URL As State

Persist in URL: filters, sort, pagination, active tab, search query.

## Data Fetching

**SWR**: Return cached data immediately, revalidate in background. Use libraries.

**Optimistic updates**: Snapshot state > apply update > roll back on failure > show error feedback.

**Parallel loading**: Fetch independent data in parallel. Avoid request waterfalls. Prefetch likely next routes.
