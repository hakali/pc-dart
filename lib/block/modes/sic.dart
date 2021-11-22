// See file LICENSE for more information.

library impl.block_cipher.modes.sic;

import 'package:pointycastle_pc335/api.dart';
import 'package:pointycastle_pc335/adapters/stream_cipher_as_block_cipher.dart';
import 'package:pointycastle_pc335/stream/sic.dart';
import 'package:pointycastle_pc335/src/registry/registry.dart';

/// See [SICStreamCipher].
class SICBlockCipher extends StreamCipherAsBlockCipher {
  /// Intended for internal use.
  static final FactoryConfig factoryConfig = DynamicFactoryConfig.suffix(
      BlockCipher,
      '/SIC',
      (_, final Match match) => () {
            var underlying = BlockCipher(match.group(1)!);
            return SICBlockCipher(
                underlying.blockSize, SICStreamCipher(underlying));
          });

  SICBlockCipher(int blockSize, StreamCipher underlyingCipher)
      : super(blockSize, underlyingCipher);
}
