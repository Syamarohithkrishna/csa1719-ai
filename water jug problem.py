from collections import deque

def get_all_states(state):
    """Generate all possible states from the current state."""
    x, y = state
    # Ensure capacities and desired amount are correctly set
    X, Y, Z = 4, 3, 2  # Example capacities and target
    
    return filter(lambda s: s != state, [
        (X, y),  # Fill Jug X
        (x, Y),  # Fill Jug Y
        (0, y),  # Empty Jug X
        (x, 0),  # Empty Jug Y
        (0, x+y) if x+y <= Y else (x-(Y-y), y+(Y-y)),  # Pour X to Y
        (x+y, 0) if x+y <= X else (x+(X-x), y-(X-x)),  # Pour Y to X
    ])

def water_jug_solver(X, Y, Z):
    """Solve the water jug problem using BFS."""
    start_state = (0, 0)
    explored = set()
    queue = deque([start_state])

    while queue:
        state = queue.popleft()
        if Z in state:
            return True
        explored.add(state)
        for next_state in get_all_states(state):
            if next_state not in explored:
                queue.append(next_state)
                explored.add(next_state)
    return False

if __name__ == "__main__":
    X, Y, Z = 4, 3, 2  # Example capacities and target
    if water_jug_solver(X, Y, Z):
        print(f"It is possible to get exactly {Z} liters.")
    else:
        print(f"It is not possible to get exactly {Z} liters.")
