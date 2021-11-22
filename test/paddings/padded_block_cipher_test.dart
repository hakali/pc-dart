// See file LICENSE for more information.

library test.padded_block_cipher_test;

import 'package:pointycastle_pc335/pointycastle.dart';
import 'package:pointycastle_pc335/src/registry/registry.dart';
import 'package:test/test.dart';

import '../test/src/helpers.dart';
import '../test/src/null_block_cipher.dart';

void main() {
  registry.register(NullBlockCipher.factoryConfig);

  var params = PaddedBlockCipherParameters(null, null);
  var pbc = PaddedBlockCipher('Null/PKCS7');

  group('PaddedBlockCipher:', () {
    group('partial blocks:', () {
      var sequence = createUint8ListFromSequentialNumbers(24);
      var paddedSequenceHex =
          '000102030405060708090a0b0c0d0e0f10111213141516170808080808080808';

      test('cipher', () {
        pbc.init(true, params);

        var out = pbc.process(sequence);

        expect(formatBytesAsHexString(out), paddedSequenceHex);
      });

      test('decipher', () {
        pbc.init(false, params);

        var out = pbc.process(createUint8ListFromHexString(paddedSequenceHex));

        expect(formatBytesAsHexString(out), formatBytesAsHexString(sequence));
      });
    });

    group('whole blocks:', () {
      var sequence = createUint8ListFromSequentialNumbers(16);
      var paddedSequenceHex =
          '000102030405060708090a0b0c0d0e0f10101010101010101010101010101010';

      test('cipher', () {
        pbc.init(true, params);

        var out = pbc.process(sequence);

        expect(formatBytesAsHexString(out), paddedSequenceHex);
      });

      test('decipher', () {
        pbc.init(false, params);

        var out = pbc.process(createUint8ListFromHexString(paddedSequenceHex));

        expect(formatBytesAsHexString(out), formatBytesAsHexString(sequence));
      });
    });
  });
}
