class RockPaperScissors

  # Exceptions this class can raise:
  class NoSuchStrategyError < StandardError ; end

  def self.winner(player1, player2)
    strgy1 = player1[1]
	strgy2 = player2[1]
	raise RockPaperScissors::NoSuchStrategyError,"Strategy must be one of R,P,S" if (strgy1 + strgy2).match(/[^RPS]/)
	return player1 if strgy1 == strgy2
	return player1 if (strgy1 == 'R' && strgy2 == 'S')
	return player2 if (strgy1 == 'R' && strgy2 == 'P')
	return player2 if (strgy1 == 'S' && strgy2 == 'R')
	return player1 if (strgy1 == 'S' && strgy2 == 'P')
	return player1 if (strgy1 == 'P' && strgy2 == 'R')
	return player2 if (strgy1 == 'P' && strgy2 == 'S')
  end

  def self.tournament_winner(tournament)
    tournament.flatten!
	if tournament.length == 2
		return tournament
	else
		win = self.winner(tournament.slice!(0,2), tournament.slice!(0,2))
		tournament.push(win).flatten!
		tournament_winner(tournament)
	end
  end

end
