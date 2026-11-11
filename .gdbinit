python
import sys
sys.path.insert(0, '/home/lukas/.local/debug/eigen/gdb')
from printers import register_eigen_printers
register_eigen_printers(None)
end
