using OrdinaryDiffEq
using Plots

function system!(du,u,p,t)
    a, b, c = p
    s, i, r = u
    du[1] = -a*s*i
    du[2] = a*s*i + b*i*r - c*i
    du[3] = -b*i*r + c*i
end

# Initial conditions
u0 = [0.99, 0.01, 0.0]
p = [0.1, 0.05, 0.02]
tspan = (0.0, 100.0)

println("hi")

# Solve the system
prob = ODEProblem(system!, u0, tspan, p)
println("hiii")
sol = solve(prob)

# Plot the solution
plot(sol)
savefig("plot.png")
