<h2>Zeige welches Mitglied welchen Verein hat</h2>
@foreach($members as $member)
    <p>
        - Mitglied: {{ $member->name }}<br>
        <i style="margin-left: 20px;">Verein: {{ $member->club->name }}</i>
    </p>
@endforeach

<hr>

<h2>Zeige Vereine und deren Mitglieder</h2>
@foreach($clubs as $club)
    <p>
        <strong>Verein: {{ $club->name }}</strong><br>

        @forelse($club->members as $member)
            - Mitglied: ({{ $member->name }})<br>
        @empty
            Keine Mitglieder <br>
        @endforelse
    </p>
@endforeach

