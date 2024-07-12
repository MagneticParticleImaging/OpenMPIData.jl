export showMIPs, showSlices

Makie.update_theme!(fonts = (regular = Makie.texfont(), bold = Makie.texfont(:bold), italic = Makie.texfont(:italic)))

function showMIPs(c;filename=nothing)
  cAbs = abs.(arraydata(c))
  cxy = maximum(cAbs,dims=3)[:,:,1]
  cxz = maximum(cAbs,dims=2)[:,1,:]
  cyz = maximum(cAbs,dims=1)[1,:,:]

  fig = Figure()
  g = GridLayout(fig[1,1])
  ax = CairoMakie.Axis(g[1,1], title = "MIP xz", width = 150, height = 150)
  heatmap!(ax, cxz)
  ax = CairoMakie.Axis(g[1,2], title = "MIP yz", width = 150, height = 150 )
  heatmap!(ax, cyz)
  ax = CairoMakie.Axis(g[2,2], title = "MIP xy", width = 150, height = 150)
  heatmap!(ax, cxy)

  resize_to_layout!(fig)
  if filename != nothing
    save(filename, fig)
  end
end

function showSlices(c, slice;filename=nothing)
  cAbs = abs.(arraydata(c))
  x=slice[1]
  y=slice[2]
  z=slice[3]

  cxy = cAbs[:,:,z]
  cxz = cAbs[:,y,:]
  cyz = cAbs[x,:,:]

  fig = Figure()
  g = GridLayout(fig[1,1])
  ax = CairoMakie.Axis(g[1,1], title = "Slice at y=$y xz", width = 150, height = 150)
  heatmap!(ax, cxz)
  ax = CairoMakie.Axis(g[1, 2], title = "Slice at x=$x yz", width = 150, height = 150)
  heatmap!(ax, cyz)
  ax = CairoMakie.Axis(g[2,2], title = "Slice at z=$z xy", width = 150, height = 150)
  heatmap!(ax, cxy)

  resize_to_layout!(fig)
  if filename != nothing
    save(filename, fig)
  end
end
