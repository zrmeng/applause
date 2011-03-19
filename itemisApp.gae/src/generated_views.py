from django.shortcuts import render_to_response
import content as providers

def allSpeakers(request):
    data = providers.allSpeakers()
    return render_to_response('_allSpeakers.html', {'data': data})

def speaker_resolver(request, id):
    data = providers.speakerById(id)
    return render_to_response('_speaker.html', {'data': data})

def speaker_byName(request, name):
    data = providers.speakerByName(name)
    return render_to_response('_speaker.html', {'data': data})

def session_resolver(request, id):
    data = providers.sessionById(id)
    return render_to_response('_session.html', {'data': data})
    
def sessions_byDay(request, day):
    data = providers.sessionsByDay(day)
    return render_to_response('_sessions.html', {'data': data})
    