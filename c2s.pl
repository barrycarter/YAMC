# functions that the client can call on the server, see s2c.js to see
# what functions the server can call on the client

package c2s;

sub tile_info {
  my($i, $j) = @_;
  return ["set_tile_fixed", $i, $j, get_pixel_value($i,$j)];
}

# all perl libs must return true

true;
