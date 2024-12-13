Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 132029F212D
	for <lists+intel-gvt-dev@lfdr.de>; Sat, 14 Dec 2024 23:18:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E9A1310E1B9;
	Sat, 14 Dec 2024 22:18:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=anep.edu.uy header.i=@anep.edu.uy header.b="K+tt1svW";
	dkim-atps=neutral
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
X-Greylist: delayed 24276 seconds by postgrey-1.36 at gabe;
 Sat, 14 Dec 2024 22:18:54 UTC
Received: from correos.anep.edu.uy (mx120.anep.edu.uy [190.0.150.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0562810E1B9
 for <intel-gvt-dev@lists.freedesktop.org>;
 Sat, 14 Dec 2024 22:18:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by correos.anep.edu.uy (Postfix) with ESMTP id B12C244225C;
 Sat, 14 Dec 2024 09:02:09 -0300 (-03)
Received: from correos.anep.edu.uy ([127.0.0.1])
 by localhost (correos.anep.edu.uy [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id m4KYYYAHK2Uv; Sat, 14 Dec 2024 09:02:09 -0300 (-03)
Received: from localhost (localhost [127.0.0.1])
 by correos.anep.edu.uy (Postfix) with ESMTP id 0A451403E62;
 Sat, 14 Dec 2024 09:01:19 -0300 (-03)
DKIM-Filter: OpenDKIM Filter v2.10.3 correos.anep.edu.uy 0A451403E62
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=anep.edu.uy;
 s=CA766030-28BF-11EF-B8E9-0BE48E5E4344; t=1734177679;
 bh=Ju8wqnUh8A/sZ5KPZltOv2mE4sV3wrd3YjZOIMvtnq8=;
 h=MIME-Version:To:From:Date:Message-Id;
 b=K+tt1svWEvJpGOmCx18tvgYxXpbCSBDRDWEJY+iplFAoFos4s8vS3USyJIGw0yJNt
 YLO383fknkG4cEuZoL0AG7JCCKg9gplWo0o263IfOqZmKuUaIBcnNKjYcA+6pFkmd1
 uk2cugBD/UZYuUnX1NmJ1tRuImU0Jr5B9J4BRGwKq3k1g2wIAgXn6z2X4F56ELeuKm
 iKjSs8tMq3CkTkRGMlr9bWaAKCLAzhUN7cKQk41wX0fchXMwAWibu27yAmpu7PDWTu
 2jmn86zS4HYOv1Z/C7BPD3Ym9NJ/WMjVGs5Rppb9plxHMD20u3N3fQ5PoHsE9+griM
 waxoeGqp3VABw==
X-Amavis-Modified: Mail body modified (using disclaimer) - correos.anep.edu.uy
X-Virus-Scanned: amavisd-new at anep.edu.uy
Received: from correos.anep.edu.uy ([127.0.0.1])
 by localhost (correos.anep.edu.uy [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id IrhkxtaJ8s_C; Sat, 14 Dec 2024 09:01:18 -0300 (-03)
Received: from [192.168.100.202] (unknown [105.9.118.56])
 by correos.anep.edu.uy (Postfix) with ESMTPSA id 387E8403F91;
 Sat, 14 Dec 2024 09:00:36 -0300 (-03)
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Description: Mail message body
Subject: =?utf-8?q?Investitions/Wohlt=C3=A4tigkeitsfonds_von_2_Millionen_Eur?=
To: Recipients <>
From: "Cheng saephan" <""@anep.edu.uy>
Date: Fri, 13 Dec 2024 20:11:04 +0200
X-Antivirus: Avast (VPS 241213-10, 12/13/2024), Outbound message
X-Antivirus-Status: Clean
Message-Id: <20241214120037.387E8403F91@correos.anep.edu.uy>
X-BeenThere: intel-gvt-dev@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: "Intel GVT \(Graphics Virtualization\) development list"
 <intel-gvt-dev.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/intel-gvt-dev>, 
 <mailto:intel-gvt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/intel-gvt-dev>
List-Post: <mailto:intel-gvt-dev@lists.freedesktop.org>
List-Help: <mailto:intel-gvt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-gvt-dev>, 
 <mailto:intel-gvt-dev-request@lists.freedesktop.org?subject=subscribe>
Reply-To: chengsaephanfoundation@gmail.com
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

Mein Name ist Cheng Charlie Saephan und es gibt einen Jackpot von 1,3 Milli=
arde Dollar. Ich leide seit acht Jahren an Krebs und meine Zeit ist fast ab=
gelaufen. Ich habe beschlossen, Ihnen 2 Millionen Euro zu spenden. Bitte ko=
ntaktieren Sie mich unter dieser E-Mail-Adresse: chengsaephanfoundation@gma=
il.com

-- 
This email has been checked for viruses by Avast antivirus software.
www.avast.com
PRIVACIDAD DE ESTE MENSAJE - Este mensaje esta dirigido exclusivamente a las personas que tienen las direcciones de correo electronico especificadas en los destinatarios dentro de su encabezado. Si por error usted ha recibido este mensaje, por ningun motivo debe revelar su contenido, copiarlo, distribuirlo o utilizarlo. Le solicitamos por favor comunique el error a la direccion de correo electronico remitente y elimine dicho mensaje junto con cualquier documento adjunto que pudiera contener. Los derechos de privacidad y confidencialidad de la informacion en este mensaje no deben perderse por el hecho de haberse trasmitido erroneamente o por causas de interferencias en el funcionamiento de los sistemas de correo y canales de comunicacion. Los datos contenidos en este mensaje estan protegidos por la Ley 18.331 Ley de Proteccion de Datos Personales y Accion de Habeas Data. Toda opinion que se expresa en este mensaje pertenece a la persona remitente por lo que no debe entenderse necesari
 amente como una opinion de ANEP y/o de las entidades que la integran, a menos que el remitente este autorizado para hacerlo o expresamente lo diga en el mismo mensaje. En consideracion a que los mensajes enviados de manera electronica pueden ser interceptados y manipulados, ANEP y las entidades que la integran no se hacen responsables si los mensajes llegan con demora respecto de la fecha de su envio por el remitente, incompletos, eliminados o con algun programa malicioso denominado como virus informatico.

