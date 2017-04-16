/* Generated By:JavaCC: Do not edit this line. MyNewGrammar.java */
/** Simple brace matcher. */
package ll.lll.lll.javaCC;

import java.util.ArrayList;
import java.io.IOException;
import javax.sound.sampled.UnsupportedAudioFileException;

import ll.lll.lll.Exception.*;
import ll.lll.lll.jv.*;

public class MyNewGrammar implements MyNewGrammarConstants {
	private int btLocation = 0;

	private String result = "";

	private String url = "";

	private int tempo = 16;

	private double bpm;
	URLGenerator generator;
	int location = 0;
	int loop = 1;
	Token loc = new Token();
	Token lop = new Token();
	Token note = new Token();
	Token number = new Token();
	Token reverbEffect = new Token();
	ArrayList<Integer> list = new ArrayList<Integer>();
	ArrayList<String> noteList = new ArrayList<String>();
	String reverb = "";
	String delay = "";
	String low = "";
	String high = "";

	public String getResult() {
		try {
			while (readLine()) {
			}
		} catch (Exception e) {
			e.printStackTrace();
			return e.getMessage();
		} catch (Error e) {
			e.printStackTrace();
			return e.getMessage();
		}
		return result;
	}

	public void setURLGenerator(URLGenerator generator) {
		this.generator = generator;
	}

	public double getLoc(double loc, double dloc) {
		double where = loc * bpm;
		double fwhere = where + (bpm / tempo * dloc);
		return fwhere;
	}

	public void setBPM(String key) throws UnsupportedAudioFileException, IOException, SoundFileNotFoundException {
		bpm = generator.getBPM(key);
	}

	final public boolean readLine() throws ParseException, TempoOverflowException, TempoUnderflowException,
			UnsupportedAudioFileException, IOException, SoundFileNotFoundException, NumberFormatException {
		Token number, loops, ins, notes;
		if (jj_2_1(2)) {
			jj_consume_token(TEMPO);
			number = jj_consume_token(NUMBER);
			jj_consume_token(24);
			tempo = Integer.parseInt(number.image);
			if (tempo <= 0) {
				{
					if (true)
						throw new TempoUnderflowException();
				}
			}
			{
				if (true)
					return true;
			}
		} else if (jj_2_2(2)) {
			ins = jj_consume_token(INS);
			notes = jj_consume_token(PIANO);
			url = notes.image;
			{
				if (true)
					return true;
			}
		} else if (jj_2_3(2)) {
			ins = jj_consume_token(INS);
			notes = jj_consume_token(DRUM);
			url = notes.image;
			{
				if (true)
					return true;
			}
		} else if (jj_2_4(2)) {
			ins = jj_consume_token(INS);
			notes = jj_consume_token(GUITARNOTE);
			url = notes.image;
			{
				if (true)
					return true;
			}
		} else if (jj_2_5(2)) {
			ins = jj_consume_token(INS);
			notes = jj_consume_token(GUITARCODE);
			url = notes.image;
			{
				if (true)
					return true;
			}
		} else if (jj_2_6(2)) {
			loops = jj_consume_token(MELODY);
			number = jj_consume_token(NUMBER);
			url = loops.image + number.image;
			setBPM(url);
			{
				if (true)
					return true;
			}
		} else if (jj_2_7(2)) {
			loops = jj_consume_token(BEAT);
			number = jj_consume_token(NUMBER);
			url = loops.image + number.image;
			setBPM(url);
			{
				if (true)
					return true;
			}
		} else if (jj_2_8(2)) {
			loops = jj_consume_token(BASS);
			number = jj_consume_token(NUMBER);
			url = loops.image + number.image;
			setBPM(url);
			{
				if (true)
					return true;
			}
		} else {
			switch ((jj_ntk == -1) ? jj_ntk() : jj_ntk) {
			case 25:
				jj_consume_token(25);
				location = 0;
				loop = 1;
				loc = new Token();
				lop = new Token();
				reverbEffect = new Token();
				note = new Token();
				number = new Token();
				list = new ArrayList<Integer>();
				noteList = new ArrayList<String>();
				reverb = "null";
				delay = "null";
				low = "null";
				high = "null";
				while (makeSound()) {
				}
				jj_consume_token(26);
				for (int i = 0; i < loop; i++) {
					if (list.size() > 0) {
						for (int j = 0; j < list.size(); j++) {
							result += String.format("loadAudio('%s', %f,%s,%s,%s,%s); \u005cn",
									generator.getFilePath(url + noteList.get(j)), getLoc(location + i, list.get(j)),
									reverb, delay, low, high);
						}
					} else {
						result += String.format("loadAudio('%s', %f); \u005cn", generator.getFilePath(url),
								getLoc(btLocation, 0));
						btLocation++;
					}
				} {
				if (true)
					return true;
			}
				break;
			case 0:
				jj_consume_token(0); {
				if (true)
					return false;
			}
				break;
			default:
				jj_la1[0] = jj_gen;
				jj_consume_token(-1);
				throw new ParseException();
			}
		}
		throw new Error("Missing return statement in function");
	}

	final public boolean makeSound()
			throws ParseException, TempoOverflowException, SoundFileNotFoundException, NumberFormatException {
		switch ((jj_ntk == -1) ? jj_ntk() : jj_ntk) {
		case DO:
			jj_consume_token(DO);
			lop = jj_consume_token(NUMBER);
			jj_consume_token(24);
			loop = Integer.parseInt(lop.image); {
			if (true)
				return true;
		}
			break;
		case LOCATION:
			jj_consume_token(LOCATION);
			loc = jj_consume_token(NUMBER);
			jj_consume_token(24);
			location = Integer.parseInt(loc.image); {
			if (true)
				return true;
		}
			break;
		case REVERB:
			jj_consume_token(REVERB);
			reverbEffect = jj_consume_token(NOTE);
			jj_consume_token(24);
			reverb = reverbEffect.image; {
			if (true)
				return true;
		}
			break;
		case DELAY:
			jj_consume_token(DELAY);
			number = jj_consume_token(NUMBER);
			jj_consume_token(24);
			delay = number.image; {
			if (true)
				return true;
		}
			break;
		case LOWFILTER:
			jj_consume_token(LOWFILTER);
			number = jj_consume_token(NUMBER);
			jj_consume_token(24);
			low = number.image; {
			if (true)
				return true;
		}
			break;
		case HIGHFILTER:
			jj_consume_token(HIGHFILTER);
			number = jj_consume_token(NUMBER);
			jj_consume_token(24);
			high = number.image; {
			if (true)
				return true;
		}
			break;
		case SETNOTE:
			jj_consume_token(SETNOTE);
			jj_consume_token(27);
			note = jj_consume_token(NOTE);
			jj_consume_token(28);
			number = jj_consume_token(NUMBER);
			jj_consume_token(29);
			if (tempo < Integer.parseInt(number.image)) {
				{
					if (true)
						throw new TempoOverflowException();
				}
			}
			list.add(Integer.parseInt(number.image));
			noteList.add(note.image); {
			if (true)
				return true;
		}
			break;
		default:
			jj_la1[1] = jj_gen; {
			if (true)
				return false;
		}
		}
		throw new Error("Missing return statement in function");
	}

	private boolean jj_2_1(int xla) {
		jj_la = xla;
		jj_lastpos = jj_scanpos = token;
		try {
			return !jj_3_1();
		} catch (LookaheadSuccess ls) {
			return true;
		} finally {
			jj_save(0, xla);
		}
	}

	private boolean jj_2_2(int xla) {
		jj_la = xla;
		jj_lastpos = jj_scanpos = token;
		try {
			return !jj_3_2();
		} catch (LookaheadSuccess ls) {
			return true;
		} finally {
			jj_save(1, xla);
		}
	}

	private boolean jj_2_3(int xla) {
		jj_la = xla;
		jj_lastpos = jj_scanpos = token;
		try {
			return !jj_3_3();
		} catch (LookaheadSuccess ls) {
			return true;
		} finally {
			jj_save(2, xla);
		}
	}

	private boolean jj_2_4(int xla) {
		jj_la = xla;
		jj_lastpos = jj_scanpos = token;
		try {
			return !jj_3_4();
		} catch (LookaheadSuccess ls) {
			return true;
		} finally {
			jj_save(3, xla);
		}
	}

	private boolean jj_2_5(int xla) {
		jj_la = xla;
		jj_lastpos = jj_scanpos = token;
		try {
			return !jj_3_5();
		} catch (LookaheadSuccess ls) {
			return true;
		} finally {
			jj_save(4, xla);
		}
	}

	private boolean jj_2_6(int xla) {
		jj_la = xla;
		jj_lastpos = jj_scanpos = token;
		try {
			return !jj_3_6();
		} catch (LookaheadSuccess ls) {
			return true;
		} finally {
			jj_save(5, xla);
		}
	}

	private boolean jj_2_7(int xla) {
		jj_la = xla;
		jj_lastpos = jj_scanpos = token;
		try {
			return !jj_3_7();
		} catch (LookaheadSuccess ls) {
			return true;
		} finally {
			jj_save(6, xla);
		}
	}

	private boolean jj_2_8(int xla) {
		jj_la = xla;
		jj_lastpos = jj_scanpos = token;
		try {
			return !jj_3_8();
		} catch (LookaheadSuccess ls) {
			return true;
		} finally {
			jj_save(7, xla);
		}
	}

	private boolean jj_3_5() {
		if (jj_scan_token(INS))
			return true;
		if (jj_scan_token(GUITARCODE))
			return true;
		return false;
	}

	private boolean jj_3_3() {
		if (jj_scan_token(INS))
			return true;
		if (jj_scan_token(DRUM))
			return true;
		return false;
	}

	private boolean jj_3_8() {
		if (jj_scan_token(BASS))
			return true;
		if (jj_scan_token(NUMBER))
			return true;
		return false;
	}

	private boolean jj_3_6() {
		if (jj_scan_token(MELODY))
			return true;
		if (jj_scan_token(NUMBER))
			return true;
		return false;
	}

	private boolean jj_3_4() {
		if (jj_scan_token(INS))
			return true;
		if (jj_scan_token(GUITARNOTE))
			return true;
		return false;
	}

	private boolean jj_3_1() {
		if (jj_scan_token(TEMPO))
			return true;
		if (jj_scan_token(NUMBER))
			return true;
		return false;
	}

	private boolean jj_3_2() {
		if (jj_scan_token(INS))
			return true;
		if (jj_scan_token(PIANO))
			return true;
		return false;
	}

	private boolean jj_3_7() {
		if (jj_scan_token(BEAT))
			return true;
		if (jj_scan_token(NUMBER))
			return true;
		return false;
	}

	/** Generated Token Manager. */
	public MyNewGrammarTokenManager token_source;
	SimpleCharStream jj_input_stream;
	/** Current token. */
	public Token token;
	/** Next token. */
	public Token jj_nt;
	private int jj_ntk;
	private Token jj_scanpos, jj_lastpos;
	private int jj_la;
	private int jj_gen;
	final private int[] jj_la1 = new int[2];
	static private int[] jj_la1_0;
	static {
		jj_la1_init_0();
	}

	private static void jj_la1_init_0() {
		jj_la1_0 = new int[] { 0x2000001, 0x46f000, };
	}

	final private JJCalls[] jj_2_rtns = new JJCalls[8];
	private boolean jj_rescan = false;
	private int jj_gc = 0;

	/** Constructor with InputStream. */
	public MyNewGrammar(java.io.InputStream stream) {
		this(stream, null);
	}

	/** Constructor with InputStream and supplied encoding */
	public MyNewGrammar(java.io.InputStream stream, String encoding) {
		try {
			jj_input_stream = new SimpleCharStream(stream, encoding, 1, 1);
		} catch (java.io.UnsupportedEncodingException e) {
			throw new RuntimeException(e);
		}
		token_source = new MyNewGrammarTokenManager(jj_input_stream);
		token = new Token();
		jj_ntk = -1;
		jj_gen = 0;
		for (int i = 0; i < 2; i++)
			jj_la1[i] = -1;
		for (int i = 0; i < jj_2_rtns.length; i++)
			jj_2_rtns[i] = new JJCalls();
	}

	/** Reinitialise. */
	public void ReInit(java.io.InputStream stream) {
		ReInit(stream, null);
	}

	/** Reinitialise. */
	public void ReInit(java.io.InputStream stream, String encoding) {
		try {
			jj_input_stream.ReInit(stream, encoding, 1, 1);
		} catch (java.io.UnsupportedEncodingException e) {
			throw new RuntimeException(e);
		}
		token_source.ReInit(jj_input_stream);
		token = new Token();
		jj_ntk = -1;
		jj_gen = 0;
		for (int i = 0; i < 2; i++)
			jj_la1[i] = -1;
		for (int i = 0; i < jj_2_rtns.length; i++)
			jj_2_rtns[i] = new JJCalls();
	}

	/** Constructor. */
	public MyNewGrammar(java.io.Reader stream) {
		jj_input_stream = new SimpleCharStream(stream, 1, 1);
		token_source = new MyNewGrammarTokenManager(jj_input_stream);
		token = new Token();
		jj_ntk = -1;
		jj_gen = 0;
		for (int i = 0; i < 2; i++)
			jj_la1[i] = -1;
		for (int i = 0; i < jj_2_rtns.length; i++)
			jj_2_rtns[i] = new JJCalls();
	}

	/** Reinitialise. */
	public void ReInit(java.io.Reader stream) {
		jj_input_stream.ReInit(stream, 1, 1);
		token_source.ReInit(jj_input_stream);
		token = new Token();
		jj_ntk = -1;
		jj_gen = 0;
		for (int i = 0; i < 2; i++)
			jj_la1[i] = -1;
		for (int i = 0; i < jj_2_rtns.length; i++)
			jj_2_rtns[i] = new JJCalls();
	}

	/** Constructor with generated Token Manager. */
	public MyNewGrammar(MyNewGrammarTokenManager tm) {
		token_source = tm;
		token = new Token();
		jj_ntk = -1;
		jj_gen = 0;
		for (int i = 0; i < 2; i++)
			jj_la1[i] = -1;
		for (int i = 0; i < jj_2_rtns.length; i++)
			jj_2_rtns[i] = new JJCalls();
	}

	/** Reinitialise. */
	public void ReInit(MyNewGrammarTokenManager tm) {
		token_source = tm;
		token = new Token();
		jj_ntk = -1;
		jj_gen = 0;
		for (int i = 0; i < 2; i++)
			jj_la1[i] = -1;
		for (int i = 0; i < jj_2_rtns.length; i++)
			jj_2_rtns[i] = new JJCalls();
	}

	private Token jj_consume_token(int kind) throws ParseException {
		Token oldToken;
		if ((oldToken = token).next != null)
			token = token.next;
		else
			token = token.next = token_source.getNextToken();
		jj_ntk = -1;
		if (token.kind == kind) {
			jj_gen++;
			if (++jj_gc > 100) {
				jj_gc = 0;
				for (int i = 0; i < jj_2_rtns.length; i++) {
					JJCalls c = jj_2_rtns[i];
					while (c != null) {
						if (c.gen < jj_gen)
							c.first = null;
						c = c.next;
					}
				}
			}
			return token;
		}
		token = oldToken;
		jj_kind = kind;
		throw generateParseException();
	}

	static private final class LookaheadSuccess extends java.lang.Error {
	}

	final private LookaheadSuccess jj_ls = new LookaheadSuccess();

	private boolean jj_scan_token(int kind) {
		if (jj_scanpos == jj_lastpos) {
			jj_la--;
			if (jj_scanpos.next == null) {
				jj_lastpos = jj_scanpos = jj_scanpos.next = token_source.getNextToken();
			} else {
				jj_lastpos = jj_scanpos = jj_scanpos.next;
			}
		} else {
			jj_scanpos = jj_scanpos.next;
		}
		if (jj_rescan) {
			int i = 0;
			Token tok = token;
			while (tok != null && tok != jj_scanpos) {
				i++;
				tok = tok.next;
			}
			if (tok != null)
				jj_add_error_token(kind, i);
		}
		if (jj_scanpos.kind != kind)
			return true;
		if (jj_la == 0 && jj_scanpos == jj_lastpos)
			throw jj_ls;
		return false;
	}

	/** Get the next Token. */
	final public Token getNextToken() {
		if (token.next != null)
			token = token.next;
		else
			token = token.next = token_source.getNextToken();
		jj_ntk = -1;
		jj_gen++;
		return token;
	}

	/** Get the specific Token. */
	final public Token getToken(int index) {
		Token t = token;
		for (int i = 0; i < index; i++) {
			if (t.next != null)
				t = t.next;
			else
				t = t.next = token_source.getNextToken();
		}
		return t;
	}

	private int jj_ntk() {
		if ((jj_nt = token.next) == null)
			return (jj_ntk = (token.next = token_source.getNextToken()).kind);
		else
			return (jj_ntk = jj_nt.kind);
	}

	private java.util.List<int[]> jj_expentries = new java.util.ArrayList<int[]>();
	private int[] jj_expentry;
	private int jj_kind = -1;
	private int[] jj_lasttokens = new int[100];
	private int jj_endpos;

	private void jj_add_error_token(int kind, int pos) {
		if (pos >= 100)
			return;
		if (pos == jj_endpos + 1) {
			jj_lasttokens[jj_endpos++] = kind;
		} else if (jj_endpos != 0) {
			jj_expentry = new int[jj_endpos];
			for (int i = 0; i < jj_endpos; i++) {
				jj_expentry[i] = jj_lasttokens[i];
			}
			jj_entries_loop: for (java.util.Iterator<?> it = jj_expentries.iterator(); it.hasNext();) {
				int[] oldentry = (int[]) (it.next());
				if (oldentry.length == jj_expentry.length) {
					for (int i = 0; i < jj_expentry.length; i++) {
						if (oldentry[i] != jj_expentry[i]) {
							continue jj_entries_loop;
						}
					}
					jj_expentries.add(jj_expentry);
					break jj_entries_loop;
				}
			}
			if (pos != 0)
				jj_lasttokens[(jj_endpos = pos) - 1] = kind;
		}
	}

	/** Generate ParseException. */
	public ParseException generateParseException() {
		jj_expentries.clear();
		boolean[] la1tokens = new boolean[30];
		if (jj_kind >= 0) {
			la1tokens[jj_kind] = true;
			jj_kind = -1;
		}
		for (int i = 0; i < 2; i++) {
			if (jj_la1[i] == jj_gen) {
				for (int j = 0; j < 32; j++) {
					if ((jj_la1_0[i] & (1 << j)) != 0) {
						la1tokens[j] = true;
					}
				}
			}
		}
		for (int i = 0; i < 30; i++) {
			if (la1tokens[i]) {
				jj_expentry = new int[1];
				jj_expentry[0] = i;
				jj_expentries.add(jj_expentry);
			}
		}
		jj_endpos = 0;
		jj_rescan_token();
		jj_add_error_token(0, 0);
		int[][] exptokseq = new int[jj_expentries.size()][];
		for (int i = 0; i < jj_expentries.size(); i++) {
			exptokseq[i] = jj_expentries.get(i);
		}
		return new ParseException(token, exptokseq, tokenImage);
	}

	/** Enable tracing. */
	final public void enable_tracing() {
	}

	/** Disable tracing. */
	final public void disable_tracing() {
	}

	private void jj_rescan_token() {
		jj_rescan = true;
		for (int i = 0; i < 8; i++) {
			try {
				JJCalls p = jj_2_rtns[i];
				do {
					if (p.gen > jj_gen) {
						jj_la = p.arg;
						jj_lastpos = jj_scanpos = p.first;
						switch (i) {
						case 0:
							jj_3_1();
							break;
						case 1:
							jj_3_2();
							break;
						case 2:
							jj_3_3();
							break;
						case 3:
							jj_3_4();
							break;
						case 4:
							jj_3_5();
							break;
						case 5:
							jj_3_6();
							break;
						case 6:
							jj_3_7();
							break;
						case 7:
							jj_3_8();
							break;
						}
					}
					p = p.next;
				} while (p != null);
			} catch (LookaheadSuccess ls) {
			}
		}
		jj_rescan = false;
	}

	private void jj_save(int index, int xla) {
		JJCalls p = jj_2_rtns[index];
		while (p.gen > jj_gen) {
			if (p.next == null) {
				p = p.next = new JJCalls();
				break;
			}
			p = p.next;
		}
		p.gen = jj_gen + xla - jj_la;
		p.first = token;
		p.arg = xla;
	}

	static final class JJCalls {
		int gen;
		Token first;
		int arg;
		JJCalls next;
	}

}
