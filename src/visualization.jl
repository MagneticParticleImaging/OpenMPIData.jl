export showMIPs,showProjs


function showMIPs(c::Array; fignum=1, filename=nothing)
  cAbs = abs.(c)
  cxy = maximum(cAbs,3)[:,:,1]
  cxz = maximum(cAbs,2)[:,1,:]
  cyz = maximum(cAbs,1)[1,:,:]

  figure(fignum, figsize=(4,4))
  
  subplot(2,2,1)
  imshow(cxz', interpolation="nearest")
  title("MIP xz")
  subplot(2,2,2)
  imshow(cyz', interpolation="nearest")
  title("MIP yz")
  subplot(2,2,4)
  imshow(cxy, interpolation="nearest")
  title("MIP xy")

  subplots_adjust(wspace=0.18,hspace=0.3,left=0.06,bottom=0.06,right=1.0,top=0.95)

  if filename != nothing
    savefig(filename)
  end
end
function showProjs(c::Array,proj; fignum=1, filename=nothing)
  cAbs = abs.(c)
  x=proj[1]
  y=proj[2]
  z=proj[3]

  cxy = cAbs[:,:,z]
  cxz = cAbs[:,y,:]
  cyz = cAbs[x,:,:]

  figure(fignum, figsize=(4,4))
  
  subplot(2,2,1)
  imshow(cxz', interpolation="nearest")
  title("Proj $y xz")
  subplot(2,2,2)
  imshow(cyz', interpolation="nearest")
  title("Proj $x yz")
  subplot(2,2,4)
  imshow(cxy, interpolation="nearest")
  title("Proj $z xy")

  subplots_adjust(wspace=0.18,hspace=0.3,left=0.06,bottom=0.06,right=1.0,top=0.95)

  if filename != nothing
    savefig(filename)
  end
end
