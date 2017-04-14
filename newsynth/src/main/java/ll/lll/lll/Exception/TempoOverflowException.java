package ll.lll.lll.Exception;

public class TempoOverflowException extends Exception {
	@Override
	public String getMessage() {
		return "The note tempo you submit has been violated by overfolw.\nNote tempo must be samller then tempo.";
	}
}
