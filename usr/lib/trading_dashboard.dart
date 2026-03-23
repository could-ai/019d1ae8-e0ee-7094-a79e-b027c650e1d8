import 'package:flutter/material.dart';

// Pine Script Color Constants
const Color cBull = Color(0xFF00E676);
const Color cBear = Color(0xFFFF5252);
const Color cNeutral = Color(0xFF9C9CFF);
const Color cGold = Color(0xFFFFD700);
const Color cOrange = Color(0xFFFFB300);
const Color cCyan = Color(0xFF00BCD4);
const Color cWhite = Color(0xFFE8E8F0);
const Color cMuted = Color(0xFF606080);
const Color cBg0 = Color(0xFF0A0A0F);
const Color cBg1 = Color(0xFF111118);
const Color cSection = Color(0xFF1A1A2E);
const Color cHeader = Color(0xFF0D2137);

class TradingDashboard extends StatelessWidget {
  const TradingDashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: cBg0,
      appBar: AppBar(
        backgroundColor: cHeader,
        title: const Text(
          'TGS-RFS PRO v3.2',
          style: TextStyle(color: cGold, fontWeight: FontWeight.bold, fontSize: 18),
        ),
        centerTitle: true,
        elevation: 0,
      ),
      body: ListView(
        padding: const EdgeInsets.all(12.0),
        children: [
          // Updated to XAUUSD with a realistic Gold price
          _buildHeaderRow('XAUUSD', '1D', '2,345.50', isBullish: true),
          const SizedBox(height: 12),
          
          _buildSectionHeader('▶ DIRECTION'),
          _buildDirectionPanel('▲ STRONG BUY', cBull, const Color(0xFF003300)),
          _buildDataRow('Confluence', '75% VERY HIGH', '███████░░░', cBull, cBull),
          const SizedBox(height: 12),

          _buildSectionHeader('▶ SYSTEM SIGNALS'),
          _buildDataRow('Reversal', '● STRONG BULL', '✓ PASS', cBull, cBull),
          _buildDataRow('EMA Stack', '▲ BULL 3/3', '9/14/21', cBull, cMuted),
          _buildDataRow('HTF D', '▲ BULL HTF', '21/50', cBull, cMuted),
          _buildDataRow('S/R Chan.', '▲ BUY ZONE', '85%/60%', cBull, cBull),
          _buildDataRow('Order Flow', '▲ BULLISH', '5 OBs', cBull, cMuted),
          _buildDataRow('Δ Diverge', '▲ BULL DIV', '14p', cBull, cMuted),
          const SizedBox(height: 12),

          _buildSectionHeader('▶ REGIME & VOLATILITY'),
          _buildDataRow('Regime', 'TREND ▲', 'ADX 28.5', cBull, cCyan),
          _buildDataRow('Vol Regime', 'HIGH 🔥', '1.45x', cOrange, cCyan),
          // Adjusted VWAP and ATR for typical XAUUSD values
          _buildDataRow('VWAP', '▲ ABOVE', '2,340.20', cBull, cMuted),
          _buildDataRow('ATR/Mult', '15.5 | x2.0', 'Medium', cCyan, cOrange),
          const SizedBox(height: 12),

          _buildSectionHeader('▶ VOLUME DELTA'),
          _buildDataRow('Buy 65.0%', '██████░░░░', '12.5K', cBull, cBull),
          _buildDataRow('Sell 35.0%', '███░░░░░░░', '6.8K', cBear, cBear),
          _buildDataRow('Vol Bias', '▲ BULL +15.0%', '50b', cBull, cMuted),
          const SizedBox(height: 12),

          _buildSectionHeader('▶ CHANNEL QUALITY'),
          _buildDataRow('↗ Up Chan', '████████░░', '85%', cBull, cBull),
          _buildDataRow('↘ Dn Chan', '██████░░░░', '60%', cOrange, cOrange),
          const SizedBox(height: 12),

          _buildSectionHeader('▶ PERFORMANCE'),
          _buildDataRow('Win Rate', '62.5% (25/40)', '20b', cBull, cMuted),
          _buildDataRow('Exp. Value', '+0.45R', '25W/15L+2p', cBull, cMuted),
          const SizedBox(height: 12),

          _buildSectionHeader('▶ ANTI-REPAINT STATUS'),
          _buildDataRow('Confirm', '✓ BAR CLOSE LOCK', 'Lock✓ | HTF✓', cBull, cCyan),
          
          const SizedBox(height: 24),
          const Center(
            child: Text(
              'Santos | TGS-RFS PRO v3.2 PATCHED',
              style: TextStyle(color: cMuted, fontSize: 10),
            ),
          ),
          const SizedBox(height: 24),
        ],
      ),
    );
  }

  Widget _buildHeaderRow(String ticker, String timeframe, String price, {required bool isBullish}) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
      decoration: BoxDecoration(
        color: cHeader,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: const Color(0xFF2A2A3A)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(ticker, style: const TextStyle(color: cGold, fontSize: 16, fontWeight: FontWeight.bold)),
          Text(timeframe, style: const TextStyle(color: cWhite, fontSize: 14)),
          Text(price, style: TextStyle(color: isBullish ? cBull : cBear, fontSize: 16, fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }

  Widget _buildSectionHeader(String title) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
      decoration: const BoxDecoration(
        color: cSection,
        borderRadius: BorderRadius.only(topLeft: Radius.circular(8), topRight: Radius.circular(8)),
      ),
      child: Text(
        title,
        style: const TextStyle(color: cGold, fontSize: 12, fontWeight: FontWeight.bold),
      ),
    );
  }

  Widget _buildDirectionPanel(String text, Color textColor, Color bgColor) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 16),
      decoration: BoxDecoration(
        color: bgColor,
        border: const Border(
          left: BorderSide(color: Color(0xFF2A2A3A)),
          right: BorderSide(color: Color(0xFF2A2A3A)),
        ),
      ),
      child: Center(
        child: Text(
          text,
          style: TextStyle(color: textColor, fontSize: 24, fontWeight: FontWeight.bold, letterSpacing: 1.2),
        ),
      ),
    );
  }

  Widget _buildDataRow(String label, String value1, String value2, Color color1, Color color2) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 12),
      decoration: const BoxDecoration(
        color: cBg1,
        border: Border(
          bottom: BorderSide(color: Color(0xFF2A2A3A), width: 1),
          left: BorderSide(color: Color(0xFF2A2A3A), width: 1),
          right: BorderSide(color: Color(0xFF2A2A3A), width: 1),
        ),
      ),
      child: Row(
        children: [
          Expanded(
            flex: 2,
            child: Text(label, style: const TextStyle(color: cMuted, fontSize: 13)),
          ),
          Expanded(
            flex: 3,
            child: Text(value1, style: TextStyle(color: color1, fontSize: 13, fontWeight: FontWeight.w500)),
          ),
          Expanded(
            flex: 2,
            child: Text(
              value2, 
              style: TextStyle(color: color2, fontSize: 11),
              textAlign: TextAlign.right,
            ),
          ),
        ],
      ),
    );
  }
}
